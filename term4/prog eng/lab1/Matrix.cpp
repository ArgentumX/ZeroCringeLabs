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

