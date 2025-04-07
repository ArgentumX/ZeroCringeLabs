//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Unit5.h"
#include "Unit1.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TSetWind *SetWind;
//---------------------------------------------------------------------------
__fastcall TSetWind::TSetWind(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TSetWind::closeBClick(TObject *Sender)
{
    Close();
}
//---------------------------------------------------------------------------
void __fastcall TSetWind::applyBClick(TObject *Sender)
{
	for (int i = 0; i < 4; i++) {
		if (CBL1->Checked[i]) {
			switch (i) {
				case 0: MainM->Color = colBox->Selected; break;
				case 1: MainM->inpCol = colBox->Selected; break;
				case 2: MainM->modCol = colBox->Selected; break;
				case 3: MainM->outCol = colBox->Selected; break;
			}
		}
	}
}
//---------------------------------------------------------------------------


