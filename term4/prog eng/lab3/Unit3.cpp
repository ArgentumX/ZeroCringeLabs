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

    // ������������� ��������� �����-������
    RadioButton1->Checked = true; // �������� �� ���������
}
//---------------------------------------------------------------------------
//---------------------------------------------------------------------------
void __fastcall TModeWind::saveBClick(TObject *Sender)
{
    // ��������� ������ ��������� �������
    MainM->selectedMode = RadioButton1->Checked ? 1 : 2;
}
//---------------------------------------------------------------------------
void __fastcall TModeWind::FormClose(TObject *Sender, TCloseAction &Action)
{
    MainM->modeB->Enabled = true;
    Action = caFree;
}
//---------------------------------------------------------------------------
