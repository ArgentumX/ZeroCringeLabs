#include <vcl.h>
#pragma hdrstop
#include "UnitAnswer.h"
#include "UnitTask.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TFormAnswer *FormAnswer;

extern UserTask task; // Ссылка на глобальный task из UnitInput.cpp
//---------------------------------------------------------------------------
__fastcall TFormAnswer::TFormAnswer(TComponent* Owner)
    : TForm(Owner)
{
    EditThreshold->Text = "0"; // Значение по умолчанию
}
//---------------------------------------------------------------------------

void __fastcall TFormAnswer::ButtonAnswerClick(TObject *Sender)
{
    LabelComment->Caption = "Решение задачи: ";
    AnsiString result = "";

    // 1. Города с доходом на душу населения выше заданного значения
    double threshold;
    AnsiString thresholdText = EditThreshold->Text.Trim(); // Убираем лишние пробелы
    if (thresholdText.IsEmpty()) {
        ShowMessage("Ошибка: введите значение порога дохода на душу населения!");
        return;
    }

    // Используем TFormatSettings для явного указания разделителя (точка)
    TFormatSettings fs;
    fs.DecimalSeparator = '.';
    try {
        threshold = StrToFloat(thresholdText, fs);
        if (threshold < 0) {
            ShowMessage("Ошибка: порог дохода не может быть отрицательным!");
            return;
        }
    } catch (const EConvertError &e) {
        ShowMessage("Ошибка: '" + thresholdText + "' не является корректным числом! Используйте точку как разделитель (например, 123.45).");
        return;
    }

    std::vector<City> aboveIncome = task.getCitiesAboveIncomePerCapita(threshold);
    result += "Города с доходом на душу населения больше " + AnsiString::FormatFloat("#.##", threshold) + ":\n";
    if (aboveIncome.empty()) {
        result += "Нет таких городов\n";
    } else {
        for (const auto& city : aboveIncome) {
            double incomePerCapita = city.budget / city.population;
            result += city.name.c_str() + AnsiString(": ") +
                      AnsiString::FormatFloat("#.##", incomePerCapita) + "\n";
        }
    }
    result += "\n";

    // 2. Разница в доходах на душу населения между городами
    double ratio = task.getIncomePerCapitaRatio();
    result += "Максимальный доход на душу населения больше минимального в " +
              AnsiString::FormatFloat("#.##", ratio) + " раз";

    LabelAnswer->Caption = result;
}
//---------------------------------------------------------------------------

void __fastcall TFormAnswer::ButtonCloseClick(TObject *Sender)
{
    LabelAnswer->Caption = "...";
    Close();
}
//---------------------------------------------------------------------------
