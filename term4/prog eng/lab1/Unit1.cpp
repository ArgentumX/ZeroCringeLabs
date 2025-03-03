//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Unit1.h"
#include <windows.h>
#include <iostream>
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
#include <vector>
using namespace std;

TForm1 *Form1;
//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
	: TForm(Owner)
{
	UpdateMatrixView();
}
void TForm1::UpdateMatrixView(){
	SG->RowCount = matrixSize;
	SG->ColCount = matrixSize;;
	for (int i = 0; i < matrixSize; i++) {
		for (int j = 0; j < matrixSize; j++) {
			SG->Cells[j][i] = i+j ;
		}
	}
	UpdateMatrixBackend();
}

void TForm1::UpdateMatrixBackend(){
	vector<vector<int>> matr = vector<vector<int>>(matrixSize, vector<int>(matrixSize, 0)) ;
	for (int i = 0; i < matrixSize; i++) {
		for (int j = 0; j < matrixSize; j++) {
			matr[i][j] = StrToInt(SG->Cells[j][i]);
		}
	}
	matrix = Matrix(matr);
	matrix.display() ;
}

//---------------------------------------------------------------------------
void __fastcall TForm1::MatrixSizeChange(TObject *Sender)
{
	matrixSize = StrToInt(MatrixSize->Text);
	if (matrixSize <= 0) {
		Label1 -> Caption = "validation error";
		return;
	}
	Label1 -> Caption = "Matrix size:";
	UpdateMatrixView();
}
//---------------------------------------------------------------------------
void __fastcall TForm1::CheckClick(TObject *Sender)
{
	if (matrix.isNullOrdered()) {
		Label2 -> Caption = "Nulls Count = " + IntToStr(matrix.getNullCount());
	}
	else {
		Label2 -> Caption = "Max Null col = " + IntToStr(matrix.getMaxNullCol());
	}
}
//---------------------------------------------------------------------------
void __fastcall TForm1::Button1Click(TObject *Sender)
{
	Close();
}
//---------------------------------------------------------------------------


void __fastcall TForm1::SGExit(TObject *Sender)
{
	UpdateMatrixBackend();
}
//---------------------------------------------------------------------------

