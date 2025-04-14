#include <vcl.h>
#pragma hdrstop
#include "UnitAnswer.h"
#include "UnitTask.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TFormAnswer *FormAnswer;

extern UserTask task; // ������ �� ���������� task �� UnitInput.cpp
//---------------------------------------------------------------------------
__fastcall TFormAnswer::TFormAnswer(TComponent* Owner)
    : TForm(Owner)
{
    EditThreshold->Text = "0"; // �������� �� ���������
}
//---------------------------------------------------------------------------

void __fastcall TFormAnswer::ButtonAnswerClick(TObject *Sender)
{
    LabelComment->Caption = "������� ������: ";
    AnsiString result = "";

    // 1. ������ � ������� �� ���� ��������� ���� ��������� ��������
    double threshold;
    AnsiString thresholdText = EditThreshold->Text.Trim(); // ������� ������ �������
    if (thresholdText.IsEmpty()) {
        ShowMessage("������: ������� �������� ������ ������ �� ���� ���������!");
        return;
    }

    // ���������� TFormatSettings ��� ������ �������� ����������� (�����)
    TFormatSettings fs;
    fs.DecimalSeparator = '.';
    try {
        threshold = StrToFloat(thresholdText, fs);
        if (threshold < 0) {
            ShowMessage("������: ����� ������ �� ����� ���� �������������!");
            return;
        }
    } catch (const EConvertError &e) {
        ShowMessage("������: '" + thresholdText + "' �� �������� ���������� ������! ����������� ����� ��� ����������� (��������, 123.45).");
        return;
    }

    std::vector<City> aboveIncome = task.getCitiesAboveIncomePerCapita(threshold);
    result += "������ � ������� �� ���� ��������� ������ " + AnsiString::FormatFloat("#.##", threshold) + ":\n";
    if (aboveIncome.empty()) {
        result += "��� ����� �������\n";
    } else {
        for (const auto& city : aboveIncome) {
            double incomePerCapita = city.budget / city.population;
            result += city.name.c_str() + AnsiString(": ") +
                      AnsiString::FormatFloat("#.##", incomePerCapita) + "\n";
        }
    }
    result += "\n";

    // 2. ������� � ������� �� ���� ��������� ����� ��������
    double ratio = task.getIncomePerCapitaRatio();
    result += "������������ ����� �� ���� ��������� ������ ������������ � " +
              AnsiString::FormatFloat("#.##", ratio) + " ���";

    LabelAnswer->Caption = result;
}
//---------------------------------------------------------------------------

void __fastcall TFormAnswer::ButtonCloseClick(TObject *Sender)
{
    LabelAnswer->Caption = "...";
    Close();
}
//---------------------------------------------------------------------------
