//---------------------------------------------------------------------------

#ifndef Unit1H
#define Unit1H
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include <Vcl.Grids.hpp>
#include "Matrix.h"
//---------------------------------------------------------------------------
class TForm1 : public TForm
{
__published:	// IDE-managed Components
	TStringGrid *SG;
	TEdit *MatrixSize;
	TLabel *Label1;
	TButton *Check;
	TLabel *Label2;
	TButton *Button1;
	void __fastcall MatrixSizeChange(TObject *Sender);
	void __fastcall CheckClick(TObject *Sender);
	void __fastcall Button1Click(TObject *Sender);
	void __fastcall SGExit(TObject *Sender);
private:	// User declarations
	int matrixSize = 3;
	Matrix matrix = Matrix(matrixSize, matrixSize);
public:		// User declarations
	__fastcall TForm1(TComponent* Owner);
	void UpdateMatrixView();
	void UpdateMatrixBackend();
};
//---------------------------------------------------------------------------
extern PACKAGE TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
