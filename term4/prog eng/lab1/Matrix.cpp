//---------------------------------------------------------------------------

#pragma hdrstop

#include "Matrix.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)

Matrix::Matrix(int rows, int cols) : rows(rows), cols(cols), data(rows, std::vector<int>(cols, 0)) {}

Matrix::Matrix(const std::vector<std::vector<int>>& data) : data(data), rows(data.size()), cols(data[0].size()) {}

int Matrix::getRows() const { return rows; }
int Matrix::getCols() const { return cols; }
std::vector<std::vector<int>> Matrix::getData() const { return data; }

int Matrix::getColNullCount(int col) const {
    int count = 0;
    for (int i = 0; i < rows; i++) {
        if (data[i][col] == 0) {
            count++;
        }
    }
    return count;
}

int Matrix::getNullCount() const {
    int count = 0;
    for (int i = 0; i < cols; i++) {
        count += getColNullCount(i);
    }
    return count;
}

int Matrix::getMaxNullCol() const {
    int col_index = 0;
    int col_val = getColNullCount(0);
    for (int i = 1; i < cols; i++) {
        int val = getColNullCount(i);
        if (col_val < val) {
            col_val = val;
            col_index = i;
        }
    }
    return col_index;
}

bool Matrix::isNullOrdered() const {
    int prevVal = getColNullCount(0);
    for (int i = 1; i < cols; i++) {
        int val = getColNullCount(i);
        if (val < prevVal) {
            return false;
        }
        prevVal = val;
    }
    return true;
}

void Matrix::display() const {
    for (const auto& row : data) {
        for (int val : row) {
            std::cout << val << " ";
        }
        std::cout << std::endl;
    }
}


// Lab 2

int Matrix::getRowSum(int i) const {
	int result = 0;
	if (i < 0 || i >= data.size()) {
		return 0;
	}
	for (int j = 0; j < data[i].size(); j++) {
		result += data[i][j];
	}
	return result;
}

int Matrix::getRowNulls(int i) const {
	int result = 0;

	if (i < 0 || i >= data.size()) {
		return 0;
	}

	for (int j = 0; j < data[i].size(); j++) {
		if (data[i][j] == 0) {
			result++;
		}
	}

	return result;
}
float Matrix::getCoff() const {
	int evenSum = 0;
	int oddSum = 0;

	for (int i = 0; i < data.size(); i++) {
		int rowSum = getRowSum(i);
		if (i % 2 == 0) {
			evenSum += rowSum;
		} else {
			oddSum += rowSum;
		}
	}
	if (oddSum == 0) {
		return 0; ;
	}

	return static_cast<float>(evenSum) / oddSum;
}

int Matrix::getEvenRowsNulls() const {
	int result = 0;

	for (int i = 0; i < data.size(); i++) {
		if (i % 2 == 0) {
			result += getRowNulls(i);
		}
	}

	return result;
}

