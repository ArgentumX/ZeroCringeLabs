//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Input.h"
#include "Main.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TForm1 *Form1;
//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TForm1::Edit1Change(TObject *Sender)
{
	int value = StrToInt(Edit1->Text);
	Form2->InitMatrix(value);
	Form2->UpdateMatrixView();
}
//---------------------------------------------------------------------------
void __fastcall TForm1::SGExit(TObject *Sender)
{
	Form2->UpdateMatrixBackend();
	Form2->UpdateMatrixView();
}
//---------------------------------------------------------------------------
void __fastcall TForm1::SGClick(TObject *Sender)
{
 	Form2->UpdateMatrixBackend();
	Form2->UpdateMatrixView();
}
//---------------------------------------------------------------------------
void __fastcall TForm1::FormClose(TObject *Sender, TCloseAction &Action)
{
	Action = caFree;
}
//---------------------------------------------------------------------------

