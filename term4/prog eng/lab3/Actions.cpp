//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Actions.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
#include "Main.h"
#include "Output.h"

TForm4 *Form4;
//---------------------------------------------------------------------------
__fastcall TForm4::TForm4(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TForm4::Button1Click(TObject *Sender)
{
	float answer = (Form2->matrix).getCoff();
	(Form3->Label1)->Caption = "Coff: " + FloatToStr(answer);
}
//---------------------------------------------------------------------------
void __fastcall TForm4::Button2Click(TObject *Sender)
{
	int nulls = (Form2->matrix).getEvenRowsNulls();
	int selection = 0;
	if (!nulls) {
		selection = -1;
	}
	(Form3->RG1)->ItemIndex = selection;
}
//---------------------------------------------------------------------------
void __fastcall TForm4::FormClose(TObject *Sender, TCloseAction &Action)
{
    Action = caFree;
}
//---------------------------------------------------------------------------

