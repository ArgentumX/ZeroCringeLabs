//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Unit1.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TMainM *MainM;
//---------------------------------------------------------------------------
__fastcall TMainM::TMainM(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TMainM::closeButClick(TObject *Sender)
{
    Close();
}
//---------------------------------------------------------------------------
void __fastcall TMainM::aboutBClick(TObject *Sender)
{
	AboutBox->Show();
}
//---------------------------------------------------------------------------
void __fastcall TMainM::inputBClick(TObject *Sender)
{
	if (inputB->Enabled != False) InputWind = new TInputWind(this);

	InputWind->rowsE->Text = matrRows;
	InputWind->SG1->RowCount = matrRows;
	InputWind->colsE->Text = matrCols;
	InputWind->SG1->ColCount = matrCols;



	for (int i = 1; i < matrRows; i++) {
		for (int j = 1; j < matrCols; j++) {
			InputWind->SG1->Cells[j][i] = FloatToStr(matr[i][j]);
		}
	}

	if (inputB->Enabled != False) {
		inputB->Enabled = False;
		InputWind->Show();
	}
}
//---------------------------------------------------------------------------

void __fastcall TMainM::modeBClick(TObject *Sender)
{
    if (modeB->Enabled != False) ModeWind = new TModeWind(this);

    // ”станавливаем состо€ние радио-кнопок через selectedMode
    ModeWind->RadioButton1->Checked = (selectedMode == 1);
    ModeWind->RadioButton2->Checked = (selectedMode == 2);

    if (modeB->Enabled != False) {
        modeB->Enabled = False;
        ModeWind->Show();
    }
}
//---------------------------------------------------------------------------

void __fastcall TMainM::outputBClick(TObject *Sender)
{
	OutputWind = new TOutputWind(this);
	OutputWind->Color = outCol;
	OutputWind->Show();
}
//---------------------------------------------------------------------------

void __fastcall TMainM::closeCurBClick(TObject *Sender)
{
	if (ActiveMDIChild != NULL) {
	        ActiveMDIChild->Close();
	}
}
//---------------------------------------------------------------------------

void __fastcall TMainM::closeAllBClick(TObject *Sender)
{
    for (int i = MDIChildCount - 1; i >= 0; i--) {
		MDIChildren[i]->Close();
	}
}
//---------------------------------------------------------------------------

void __fastcall TMainM::cascadeBClick(TObject *Sender)
{
    Cascade();
}
//---------------------------------------------------------------------------

void __fastcall TMainM::tilesBClick(TObject *Sender)
{
    Tile();
}
//---------------------------------------------------------------------------

void __fastcall TMainM::openAllBClick(TObject *Sender)
{
	inputBClick(this);
	modeBClick(this);
	outputBClick(this);
}
//---------------------------------------------------------------------------

void __fastcall TMainM::arrangeBClick(TObject *Sender)
{
	ArrangeIcons();
}

