//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Main.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
#include "ABOUT.h"
#include "Input.h"
#include "Output.h"
#include "Actions.h"
TForm2 *Form2;
//---------------------------------------------------------------------------
__fastcall TForm2::TForm2(TComponent* Owner)
	: TForm(Owner) {
	InitMatrix(3);
}


void TForm2::InitMatrix(int size){
	matrixSize = size;
	vector<vector<int>> matr = vector<vector<int>>(matrixSize, vector<int>(matrixSize, 0)) ;
	for (int i = 0; i < matrixSize; i++) {
		for (int j = 0; j < matrixSize; j++) {
			matr[i][j] = i+j;
		}
	}
	matrix = Matrix(matr);
}

void TForm2::UpdateMatrixView(){
	if (!Form1) {
		ShowMessage("Form1 is nullptr!");
		return;
	}
	if (!Form1->SG) {
		ShowMessage("SG is nullptr!");
		return;
	}

	(Form1->SG)->RowCount = matrixSize;
	(Form1->SG)->ColCount = matrixSize;
	for (int i = 0; i < matrixSize; i++) {
		for (int j = 0; j < matrixSize; j++) {
			(Form1->SG)->Cells[j][i] = matrix.getData()[i][j];
		}
	}
}

void TForm2::UpdateMatrixBackend(){
	vector<vector<int>> matr = vector<vector<int>>(matrixSize, vector<int>(matrixSize, 0));
	for (int i = 0; i < matrixSize; i++) {
		for (int j = 0; j < matrixSize; j++) {
			matr[i][j] = StrToInt(Form1->SG->Cells[j][i]);
		}
	}
	matrix = Matrix(matr);
}

//---------------------------------------------------------------------------
void __fastcall TForm2::About1Click(TObject *Sender)
{
    AboutBox->Show();
}
//---------------------------------------------------------------------------
void __fastcall TForm2::File2Click(TObject *Sender)
{
    Close();
}
//---------------------------------------------------------------------------
void __fastcall TForm2::Input1Click(TObject *Sender)
{
	UpdateMatrixView();
	Form1->Show();

}
//---------------------------------------------------------------------------
void __fastcall TForm2::Input2Click(TObject *Sender)
{
    Form3->Show();
}
//---------------------------------------------------------------------------
void __fastcall TForm2::Actions1Click(TObject *Sender)
{
	Form4->Show();
}
//---------------------------------------------------------------------------
