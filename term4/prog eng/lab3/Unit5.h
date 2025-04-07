//---------------------------------------------------------------------------

#ifndef Unit5H
#define Unit5H
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include <Vcl.ActnColorMaps.hpp>
#include <Vcl.ActnMan.hpp>
#include <Vcl.CheckLst.hpp>
#include <Vcl.ExtCtrls.hpp>
//---------------------------------------------------------------------------
class TSetWind : public TForm
{
__published:	// IDE-managed Components
	TButton *closeB;
	TLabel *Label1;
	TColorBox *colBox;
	TCheckListBox *CBL1;
	TButton *applyB;
	void __fastcall closeBClick(TObject *Sender);
	void __fastcall applyBClick(TObject *Sender);
private:	// User declarations
public:		// User declarations
	__fastcall TSetWind(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TSetWind *SetWind;
//---------------------------------------------------------------------------
#endif
