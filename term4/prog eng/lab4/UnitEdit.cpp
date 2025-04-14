#include <vcl.h>
#pragma hdrstop
#include "UnitEdit.h"
#include "UnitTask.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TFormEdit *FormEdit;

extern UserTask task;
//---------------------------------------------------------------------------
__fastcall TFormEdit::TFormEdit(TComponent* Owner)
    : TForm(Owner)
{
    EditGrid->ColCount = 3;
    EditGrid->RowCount = 1;
}
//---------------------------------------------------------------------------

void __fastcall TFormEdit::FormShow(TObject *Sender)
{
    EditGrid->BeginUpdate();
    EditGrid->RowCount = 1; // ������������� ���� ������ ��� ����������
    EditGrid->ColCount = 3;
    EditGrid->Cells[0][0] = "�����";
    EditGrid->Cells[1][0] = "���������";
    EditGrid->Cells[2][0] = "������";

    EditGrid->RowCount = task.cities.size() + 1;
    for (int i = 0; i < task.cities.size(); i++) {
        EditGrid->Cells[0][i + 1] = task.cities[i].name.c_str();
        EditGrid->Cells[1][i + 1] = FloatToStr(task.cities[i].population);
        EditGrid->Cells[2][i + 1] = FloatToStr(task.cities[i].budget);
    }
    EditGrid->EndUpdate();
    EditGrid->Invalidate(); // ������������� �������� ������� ��� �����������
}
//---------------------------------------------------------------------------

void __fastcall TFormEdit::EditButtonChangeClick(TObject *Sender)
{
    int row = EditGrid->Row;
    if (row < 1 || row > task.cities.size()) {
        ShowMessage("�������� ������ ��� ��������������!");
        return;
    }

    try {
        AnsiString name = EditGrid->Cells[0][row];
        if (name.IsEmpty()) {
            ShowMessage("������: �������� ������ �� ����� ���� ������!");
            return;
        }
        double population = StrToFloat(EditGrid->Cells[1][row]);
        double budget = StrToFloat(EditGrid->Cells[2][row]);
        if (population <= 0) {
            ShowMessage("������: ��������� ������ ���� ������ 0!");
            return;
        }
        if (budget < 0) {
            ShowMessage("������: ������ �� ����� ���� �������������!");
            return;
        }
        task.cities[row - 1] = City(name.c_str(), population, budget);
        FormShow(Sender);
    } catch (const EConvertError &e) {
        ShowMessage("������: ������� ���������� ����� ��� ��������� � �������!");
    }
}
//---------------------------------------------------------------------------

void __fastcall TFormEdit::EditButtonDeleteClick(TObject *Sender)
{
    int row = EditGrid->Row;
    if (row < 1 || row > task.cities.size()) {
        ShowMessage("�������� ������ ��� ��������!");
        return;
    }
    task.cities.erase(task.cities.begin() + (row - 1));
    FormShow(Sender);
}
//---------------------------------------------------------------------------
