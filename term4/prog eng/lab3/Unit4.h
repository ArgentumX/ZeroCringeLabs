//---------------------------------------------------------------------------

#ifndef Unit4H
#define Unit4H
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include <Vcl.Grids.hpp>

#include "Unit2.h"
#include "Unit3.h"
//---------------------------------------------------------------------------
class TOutputWind : public TForm
{
__published:	// IDE-managed Components
	TLabel *OUTPUT;
	TLabel *Label1;
	TLabel *minout;
	TStringGrid *SGout;
	TButton *calcB;
	void __fastcall closeBClick(TObject *Sender);
	void __fastcall calcBClick(TObject *Sender);
	void __fastcall FormClose(TObject *Sender, TCloseAction &Action);
private:	// User declarations
public:		// User declarations
	__fastcall TOutputWind(TComponent* Owner);
};

void output_mas();
void output_num();
//---------------------------------------------------------------------------
extern PACKAGE TOutputWind *OutputWind;
//---------------------------------------------------------------------------
#endif
