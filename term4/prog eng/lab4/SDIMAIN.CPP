#include <vcl.h>
#pragma hdrstop
#include "SDIMain.h"
#include "UnitInput.h"
#include "UnitEdit.h"   // Добавляем для доступа к FormEdit
#include "UnitAnswer.h"
//---------------------------------------------------------------------
#pragma resource "*.dfm"
TSDIAppForm *SDIAppForm;
//---------------------------------------------------------------------
__fastcall TSDIAppForm::TSDIAppForm(TComponent *AOwner)
    : TForm(AOwner)
{
}
//---------------------------------------------------------------------

void __fastcall TSDIAppForm::Exit1Click(TObject *Sender)
{
    Close();
}
//---------------------------------------------------------------------------

void __fastcall TSDIAppForm::AboutClick(TObject *Sender)
{
    AboutBox->ShowModal();
}
//---------------------------------------------------------------------------

void __fastcall TSDIAppForm::InputDataClick(TObject *Sender)
{
    DataInput->Show();
}
//---------------------------------------------------------------------------

void __fastcall TSDIAppForm::EditDataClick(TObject *Sender)
{
    if (!FormEdit) {
        FormEdit = new TFormEdit(this); // Создаём форму, если её ещё нет
    }
    FormEdit->Show(); // Показываем окно редактирования
}
//---------------------------------------------------------------------------

void __fastcall TSDIAppForm::SolvationClick(TObject *Sender)
{
    if (!FormAnswer) {
        FormAnswer = new TFormAnswer(this);
    }
    FormAnswer->Show();
}
//---------------------------------------------------------------------------
