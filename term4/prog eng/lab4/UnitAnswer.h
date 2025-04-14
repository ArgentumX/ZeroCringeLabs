// UnitAnswer.h
#ifndef UnitAnswerH
#define UnitAnswerH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
//---------------------------------------------------------------------------
class TFormAnswer : public TForm
{
__published:
    TLabel *LabelComment;
    TLabel *LabelAnswer;
    TButton *ButtonAnswer;
    TButton *ButtonClose;
	TEdit *EditThreshold;
	TLabel *Label1;
    void __fastcall ButtonAnswerClick(TObject *Sender);
    void __fastcall ButtonCloseClick(TObject *Sender);
private:
public:
    __fastcall TFormAnswer(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TFormAnswer *FormAnswer; // Должно быть здесь
//---------------------------------------------------------------------------
#endif
