#include <vcl.h>
#pragma hdrstop

#include "UnitInput.h"
#include "UnitTask.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TDataInput *DataInput;

UserTask task; // Глобальный объект task
//---------------------------------------------------------------------------
__fastcall TDataInput::TDataInput(TComponent* Owner)
    : TForm(Owner)
{
    StringGrid->Hide();
    StringGrid->RowCount = 1;
    StringGrid->ColCount = 3;
    StringGrid->Cells[0][0] = "Город";
    StringGrid->Cells[1][0] = "Население";
    StringGrid->Cells[2][0] = "Бюджет";
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
        ShowMessage("Ошибка: введите корректное число строк!");
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
                ShowMessage("Ошибка: название города не может быть пустым в строке " + IntToStr(i));
                return;
            }
            double population = StrToFloat(StringGrid->Cells[1][i]);
            double budget = StrToFloat(StringGrid->Cells[2][i]);
            if (population <= 0) {
                ShowMessage("Ошибка: население должно быть больше 0 в строке " + IntToStr(i));
                return;
            }
            if (budget < 0) {
                ShowMessage("Ошибка: бюджет не может быть отрицательным в строке " + IntToStr(i));
                return;
            }
            task.addCity(name.c_str(), population, budget);
        } catch (const EConvertError &e) {
            ShowMessage("Ошибка в строке " + IntToStr(i) + ": введите корректные числа для населения и бюджета!");
            return;
        }
    }
    DataInput->Close();
}
//---------------------------------------------------------------------------
