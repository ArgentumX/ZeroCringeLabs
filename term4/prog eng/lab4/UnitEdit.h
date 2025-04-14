#ifndef UnitEditH
#define UnitEditH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <Grids.hpp>
//---------------------------------------------------------------------------
class TFormEdit : public TForm
{
__published:
    TStringGrid *EditGrid;
    TButton *EditButtonChange;
    TButton *EditButtonDelete;
    void __fastcall FormShow(TObject *Sender);
    void __fastcall EditButtonChangeClick(TObject *Sender);  // ��������� � ButtonEditClick
    void __fastcall EditButtonDeleteClick(TObject *Sender);  // ��������� � ButtonDeleteClick
private:
public:
    __fastcall TFormEdit(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TFormEdit *FormEdit;
//---------------------------------------------------------------------------
#endif
