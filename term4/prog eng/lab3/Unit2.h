//---------------------------------------------------------------------------

#ifndef Unit2H
#define Unit2H
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include <Vcl.Grids.hpp>
//---------------------------------------------------------------------------
class TInputWind : public TForm
{
__published:	// IDE-managed Components
	TStringGrid *SG1;
	TLabel *Label1;
	TLabel *Label2;
	TEdit *rowsE;
	TLabel *Label3;
	TEdit *colsE;
	TButton *saveB;
	TButton *closeB;
	void __fastcall rowsEChange(TObject *Sender);
	void __fastcall colsEChange(TObject *Sender);
	void __fastcall FormClose(TObject *Sender, TCloseAction &Action);
	void __fastcall saveBClick(TObject *Sender);
private:	// User declarations
public:		// User declarations
	__fastcall TInputWind(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TInputWind *InputWind;
//---------------------------------------------------------------------------
#endif
