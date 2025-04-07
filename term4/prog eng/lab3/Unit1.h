//---------------------------------------------------------------------------

#ifndef Unit1H
#define Unit1H
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include <Vcl.Menus.hpp>

#include "ABOUT.h"
#include "Unit2.h"
#include "Unit3.h"
#include "Unit4.h"

#include <Vcl.ComCtrls.hpp>
#include <Vcl.WinXCalendars.hpp>
#include <Vcl.WinXCtrls.hpp>
//---------------------------------------------------------------------------
class TMainM : public TForm
{
__published:	// IDE-managed Components
	TMainMenu *MainMenu1;
	TMenuItem *fileW;
	TMenuItem *closeBut;
	TMenuItem *DataW;
	TMenuItem *inputB;
	TMenuItem *modeB;
	TMenuItem *outputB;
	TMenuItem *helpW;
	TMenuItem *aboutB;
	TMenuItem *workB;
	TMenuItem *closeAllB;
	TMenuItem *cascadeB;
	TMenuItem *tilesB;
	TMenuItem *openAllB;
	TMenuItem *arrangeB;
	void __fastcall closeButClick(TObject *Sender);
	void __fastcall aboutBClick(TObject *Sender);
	void __fastcall inputBClick(TObject *Sender);
	void __fastcall modeBClick(TObject *Sender);
	void __fastcall outputBClick(TObject *Sender);
	void __fastcall closeCurBClick(TObject *Sender);
	void __fastcall closeAllBClick(TObject *Sender);
	void __fastcall cascadeBClick(TObject *Sender);
	void __fastcall tilesBClick(TObject *Sender);
	void __fastcall openAllBClick(TObject *Sender);
	void __fastcall arrangeBClick(TObject *Sender);
private:	// User declarations
public:		// User declarations
	__fastcall TMainM(TComponent* Owner);
	float matr[100][100];
	float interA = -1.0;
	float interB = 1.0;
	int matrRows = 4;
	int matrCols = 4;
	bool condflag1 = True;
	bool condflag2 = True;
	int selectedMode = 1; // Значение по умолчанию;
	TColor inpCol = clBtnFace;
	TColor modCol = clBtnFace;
	TColor outCol = clBtnFace;
};
//---------------------------------------------------------------------------
extern PACKAGE TMainM *MainM;
//---------------------------------------------------------------------------
#endif
