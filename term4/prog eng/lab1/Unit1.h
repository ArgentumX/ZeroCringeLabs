//---------------------------------------------------------------------------

#ifndef Unit1H
#define Unit1H
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include <Vcl.Grids.hpp>
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
private:	// User declarations
	int matrixSize = 3;
public:		// User declarations
	__fastcall TForm1(TComponent* Owner);
	void UpdateMatrixView();
	bool IsMatrixOrdered();
	int GetMaxNullCol();
	int GetMatrixNullCount();
	int GetColNullCount(int j);
};
//---------------------------------------------------------------------------
extern PACKAGE TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
