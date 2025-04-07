//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop

#include "Unit3.h"
#include "Unit1.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TModeWind *ModeWind;
//---------------------------------------------------------------------------
__fastcall TModeWind::TModeWind(TComponent* Owner)
    : TForm(Owner)
{
    Color = MainM->modCol;

    // Инициализация состояния радио-кнопок
    RadioButton1->Checked = true; // Значение по умолчанию
}
//---------------------------------------------------------------------------
//---------------------------------------------------------------------------
void __fastcall TModeWind::saveBClick(TObject *Sender)
{
    // Сохраняем только выбранный вариант
    MainM->selectedMode = RadioButton1->Checked ? 1 : 2;
}
//---------------------------------------------------------------------------
void __fastcall TModeWind::FormClose(TObject *Sender, TCloseAction &Action)
{
    MainM->modeB->Enabled = true;
    Action = caFree;
}
//---------------------------------------------------------------------------
