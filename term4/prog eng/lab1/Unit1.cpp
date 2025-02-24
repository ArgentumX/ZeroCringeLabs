//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Unit1.h"
#include <windows.h>
#include <iostream>
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TForm1 *Form1;
//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
	: TForm(Owner)
{
	UpdateMatrixView();
}
void TForm1::UpdateMatrixView(){
	SG->RowCount = matrixSize;
	SG->ColCount = matrixSize;
   	for (int i = 0; i < matrixSize; i++) {
		for (int j = 0; j < matrixSize; j++) {
			SG->Cells[j][i] = i+j;
		}
	}
}

int TForm1::GetColNullCount(int j){
	int count = 0;
	for (int i = 0; i < matrixSize; i++) {
		if (SG->Cells[j][i] == 0) {
				count++;
		}
	}
	return count;
}
int TForm1::GetMatrixNullCount() {
	int count = 0;
	for (int i = 0; i < matrixSize; i++) {
		count += GetColNullCount(i);
	}
	return count;
}
int TForm1::GetMaxNullCol(){
	int col_index = 0;
	int col_val = GetColNullCount(0);
	for (int i = 1; i < matrixSize; i++) {
		int val = GetColNullCount(i);
		if(col_val < val){
			col_val = val;
			col_index = i;
		}
	}
	return col_index;
}
bool TForm1::IsMatrixOrdered(){
	int prevVal = GetColNullCount(0);
	for (int i = 1; i < matrixSize; i++) {
		int val = GetColNullCount(i);
		if (val < prevVal) {
			return false;
		}
		prevVal = val;
	}
	return true;
}
//---------------------------------------------------------------------------
void __fastcall TForm1::MatrixSizeChange(TObject *Sender)
{
	matrixSize = StrToInt(MatrixSize->Text);
	if (matrixSize <= 0) {
		Label1 -> Caption = "validation error";
		return;
	}
	UpdateMatrixView();
}
//---------------------------------------------------------------------------
void __fastcall TForm1::CheckClick(TObject *Sender)
{
	if (IsMatrixOrdered()) {
		Label2 -> Caption = "Nulls Count = " + IntToStr(GetMatrixNullCount());
	}
	else {
		Label2 -> Caption = "Max Null col = " + IntToStr(GetMaxNullCol());
	}
}
//---------------------------------------------------------------------------
void __fastcall TForm1::Button1Click(TObject *Sender)
{
Close() ;
}
//---------------------------------------------------------------------------
