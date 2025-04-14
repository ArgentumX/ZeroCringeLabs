#include <vcl.h>
#pragma hdrstop

#include "UnitInput.h"
#include "UnitTask.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TDataInput *DataInput;

UserTask task; // ���������� ������ task
//---------------------------------------------------------------------------
__fastcall TDataInput::TDataInput(TComponent* Owner)
    : TForm(Owner)
{
    StringGrid->Hide();
    StringGrid->RowCount = 1;
    StringGrid->ColCount = 3;
    StringGrid->Cells[0][0] = "�����";
    StringGrid->Cells[1][0] = "���������";
    StringGrid->Cells[2][0] = "������";
}
//---------------------------------------------------------------------------

int n;
void __fastcall TDataInput::ButtonClick(TObject *Sender)
{
    AnsiString s1;
    s1 = EditRows->Text;
    try {
        n = StrToInt(s1);
        StringGrid->RowCount = n + 1;
        StringGrid->ColCount = 3;
        if (n > 0) {
            StringGrid->Show();
        }
    } catch (const EConvertError &e) {
        ShowMessage("������: ������� ���������� ����� �����!");
    }
}
//---------------------------------------------------------------------------

void __fastcall TDataInput::ButtonInputClick(TObject *Sender)
{
    task.clear();
    for (int i = 1; i < StringGrid->RowCount; i++) {
        try {
            AnsiString name = StringGrid->Cells[0][i];
            if (name.IsEmpty()) {
                ShowMessage("������: �������� ������ �� ����� ���� ������ � ������ " + IntToStr(i));
                return;
            }
            double population = StrToFloat(StringGrid->Cells[1][i]);
            double budget = StrToFloat(StringGrid->Cells[2][i]);
            if (population <= 0) {
                ShowMessage("������: ��������� ������ ���� ������ 0 � ������ " + IntToStr(i));
                return;
            }
            if (budget < 0) {
                ShowMessage("������: ������ �� ����� ���� ������������� � ������ " + IntToStr(i));
                return;
            }
            task.addCity(name.c_str(), population, budget);
        } catch (const EConvertError &e) {
            ShowMessage("������ � ������ " + IntToStr(i) + ": ������� ���������� ����� ��� ��������� � �������!");
            return;
        }
    }
    DataInput->Close();
}
//---------------------------------------------------------------------------
