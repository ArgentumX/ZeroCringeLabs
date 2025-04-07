//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Unit4.h"
#include "Unit1.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TOutputWind *OutputWind;
//---------------------------------------------------------------------------
__fastcall TOutputWind::TOutputWind(TComponent* Owner)
	: TForm(Owner)
{
    Color = MainM->outCol;
    Invalidate();
}


//---------------------------------------------------------------------------
void __fastcall TOutputWind::closeBClick(TObject *Sender)
{
	Close();
}
//---------------------------------------------------------------------------

void output_elements() {
    int row = MainM->matrRows;
    int col = MainM->matrCols;
	int evenCount = 0;
	int oddCount = 0;

    // Проверка, какая радиокнопка выбрана, чтобы определить тип подсчета
	if (MainM->selectedMode == 2) {  // Выбраны четные числа
		for (int i = 0; i < row; i++) {
            for (int j = 0; j < col; j++) {
                float value = MainM->matr[i][j];
                if (static_cast<int>(value) % 2 == 0) {  // Четное число
                    evenCount++;
                }
            }
        }
		OutputWind->minout->Caption = "Четных элементов: " + IntToStr(evenCount);
    }
    else if (MainM->selectedMode == 1) {  // Выбраны нечетные числа
        for (int i = 0; i < row; i++) {
            for (int j = 0; j < col; j++) {
                float value = MainM->matr[i][j];
                if (static_cast<int>(value) % 2 != 0) {  // Нечетное число
                    oddCount++;
                }
            }
        }
        OutputWind->minout->Caption = "Нечетных элементов: " + IntToStr(oddCount);
    }
}

void output_negative_elements() {
    int row = MainM->matrRows;
	int col = MainM->matrCols;

	OutputWind->SGout->RowCount = 1;
	for (int j = 0; j < col; j++) {
		bool found = false;
        for (int i = 0; i < row; i++) {
            float value = MainM->matr[i][j];
			if (value < 0) {
				OutputWind->SGout->Cells[j][0] = FloatToStr(value);
				found = true;
				break;
            }
        }
		if (!found) {
			OutputWind->SGout->Cells[j][0] = "0";
        }
	}
}

void __fastcall TOutputWind::calcBClick(TObject *Sender)
{
	output_elements();
	output_negative_elements();
}

//---------------------------------------------------------------------------
void __fastcall TOutputWind::FormClose(TObject *Sender, TCloseAction &Action)
{
	Action = caFree;
}
//---------------------------------------------------------------------------

//---------------------------------------------------------------------------

