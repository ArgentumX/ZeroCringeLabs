//---------------------------------------------------------------------------

#ifndef Unit3H
#define Unit3H
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
//---------------------------------------------------------------------------
class TModeWind : public TForm
{
__published:	// IDE-managed Components
	TLabel *Label1;
	TLabel *Label2;
	TLabel *Label3;
	TButton *saveB;
	TRadioButton *RadioButton1;
	TRadioButton *RadioButton2;
	void __fastcall saveBClick(TObject *Sender);
	void __fastcall FormClose(TObject *Sender, TCloseAction &Action);
private:	// User declarations
public:		// User declarations
	__fastcall TModeWind(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TModeWind *ModeWind;
//---------------------------------------------------------------------------
#endif
