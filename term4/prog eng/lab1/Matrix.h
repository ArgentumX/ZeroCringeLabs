//---------------------------------------------------------------------------
#ifndef MatrixH
#define MatrixH
#include <vector>
using namespace std;
#include <vector>
#include <iostream>

class Matrix {
public:
	Matrix(int rows, int cols);
	Matrix(const vector<vector<int>>& data);
	void display() const;

	int getRows() const;
	int getCols() const;
	vector<vector<int>> getData() const;

	// Lab 1
	int getNullCount() const;
	int getMaxNullCol() const;
	bool isNullOrdered() const;
	int getColNullCount(int col) const;

	// Lab 2
	int getRowSum(int i) const;
	int getRowNulls(int i) const;
	float getCoff() const;
	int getEvenRowsNulls() const;

private:
	vector<vector<int>> data;
    int rows;
    int cols;
};
//---------------------------------------------------------------------------
#endif
