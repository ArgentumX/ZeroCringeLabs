//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Unit2.h"
#include "Unit1.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TInputWind *InputWind;
//---------------------------------------------------------------------------
__fastcall TInputWind::TInputWind(TComponent* Owner) : TForm(Owner) {
    Color = MainM->inpCol;
    // Очистка грида
    for (int i = 0; i < SG1->RowCount; i++) {
        for (int j = 0; j < SG1->ColCount; j++) {
			SG1->Cells[j][i] = "0";
		}
    }
}
//---------------------------------------------------------------------------
//---------------------------------------------------------------------------
void __fastcall TInputWind::rowsEChange(TObject *Sender)
{
	int newRows;
	if (TryStrToInt(rowsE->Text, newRows))
	{
		if (newRows <= 1)
        {
			newRows = 2;
			rowsE->Text = IntToStr(newRows);
        }
		SG1->RowCount = newRows;
    }
    else
	{
		rowsE->Text = "2";
        SG1->RowCount = 2;
    }
}
//---------------------------------------------------------------------------

void __fastcall TInputWind::colsEChange(TObject *Sender)
{
    int newCols;

    if (TryStrToInt(colsE->Text, newCols))
    {
        if (newCols <= 1)
        {
            newCols = 2;
            colsE->Text = IntToStr(newCols);
        }
        SG1->ColCount = newCols;
    }
    else
    {
		colsE->Text = "2";
		SG1->ColCount = 2;
    }
}
//---------------------------------------------------------------------------
void __fastcall TInputWind::FormClose(TObject *Sender, TCloseAction &Action)
{
	MainM->inputB->Enabled = True;
    Action = caFree;
}
//---------------------------------------------------------------------------

void __fastcall TInputWind::saveBClick(TObject *Sender)
{
	MainM->matrRows = SG1->RowCount;
	MainM->matrCols = SG1->ColCount;

	for (int i = 0; i < SG1->RowCount; i++) {
		for (int j = 0; j < SG1->ColCount; j++) {
			MainM->matr[i][j] = StrToFloat(SG1->Cells[j][i]);
		}
	}
}
//---------------------------------------------------------------------------




