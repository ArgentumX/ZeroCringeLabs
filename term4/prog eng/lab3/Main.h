//---------------------------------------------------------------------------

#ifndef MainH
#define MainH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include <Vcl.Menus.hpp>
#include "Matrix.h"
//---------------------------------------------------------------------------
class TForm2 : public TForm
{
__published:	// IDE-managed Components
	TMainMenu *MainMenu1;
	TMenuItem *File1;
	TMenuItem *File2;
	TMenuItem *Window1;
	TMenuItem *Window2;
	TMenuItem *About1;
	TMenuItem *Input1;
	TMenuItem *Input2;
	TMenuItem *Actions1;
	void __fastcall About1Click(TObject *Sender);
	void __fastcall File2Click(TObject *Sender);
	void __fastcall Input2Click(TObject *Sender);
	void __fastcall Actions1Click(TObject *Sender);
	void __fastcall Input1Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
	__fastcall TForm2(TComponent* Owner);
	int matrixSize = 3;
	Matrix matrix = Matrix(matrixSize, matrixSize);
	void UpdateMatrixView();
	void UpdateMatrixBackend();
	void InitMatrix(int size);
};
//---------------------------------------------------------------------------
extern PACKAGE TForm2 *Form2;
//---------------------------------------------------------------------------
#endif
