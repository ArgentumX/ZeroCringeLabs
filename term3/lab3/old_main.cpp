#include <cstdio>
#include <math.h>
#include <locale.h>
#include <fstream>
#include <iostream>
#include <typeinfo>
using namespace std;

const int recordSize = 6;

void createBinFile(char *inputFName, char *binFName);
void ReadAndWriteBinFile(char *fname, char *comment);
int swap(char *fname, int swapA, int swapB);
void WriteArray(char record[]);
int swap(char *fname, int swapA, int swapB);

int main(int argc, char *argv[])
{
    int swapA, swapB;
    setlocale(LC_ALL, "rus");
    if (argc < 5)
    {
        printf("Недостаточно параметров!\n");
        return 0;
    }
    createBinFile(argv[3], argv[4]);
    ReadAndWriteBinFile(argv[4], "\nInput records:\n");
    sscanf(argv[1], "%d", &swapA);
    sscanf(argv[2], "%d", &swapB);
    swap(argv[4], swapA, swapB);
    ReadAndWriteBinFile(argv[4], "\nOutput records:\n");
}
void createBinFile(char *inputFName, char *binFName)
{
    int n;
    FILE *file;
    if ((file = fopen(inputFName, "r")) == NULL)
    {
        printf("Невозможно открыть файл '%s'\n", inputFName);
        return;
    }
    if (fscanf(file, "%d", &n) < 1)
    {
        printf("Ошибка чтения из файла '%s'\n", inputFName);
        fclose(file);
        return;
    }
    ofstream fout(binFName, ios_base::binary);

    for (int i = 0; i < n; i++)
    {
        char record[recordSize];
        for (int j = 0; j < recordSize; j++)
        {
            if (fscanf(file, "%s", &record[j]) < 1)
            {
                printf("Ошибка чтения из файла '%s'\n", inputFName);
                fclose(file);
                return;
            }
        }
        fout.write(record, sizeof(record));
    }
    fout.close();
    fclose(file);
}
void WriteArray(char record[])
{
    for (int z = 0; z < recordSize; z++)
    {
        cout << record[z] << " ";
    }
}
void ReadAndWriteBinFile(char *fname, char *comment)
{
    FILE *fin = fopen(fname, "r");
    fseek(fin, 0, SEEK_END);
    int recordAmount = ftell(fin) / recordSize;
    char record[recordSize];
    fseek(fin, 0, SEEK_SET);
    printf(comment);
    for (int i = 0; i < recordAmount; i++)
    {
        fread(record, sizeof(char), recordSize, fin);
        WriteArray(record);
        printf("\n");
    }
    fclose(fin);
}
int swap(char *fname, int swapA, int swapB)
{
    char recordA[recordSize], recordB[recordSize];
    FILE *fin = fopen(fname, "r+");
    fseek(fin, 0, SEEK_END);
    int size = ftell(fin);
    int recordsAmount = size / recordSize;
    fseek(fin, 0, SEEK_SET);
    if (swapA >= recordsAmount || swapB >= recordsAmount)
    {
        printf("\nCan't swap: wrong swap indexes\n");
        return 0;
    }
    fseek(fin, swapA * recordSize * sizeof(char), SEEK_SET);
    fread(recordA, sizeof(char), recordSize, fin);
    fseek(fin, swapB * recordSize * sizeof(char), SEEK_SET);
    fread(recordB, sizeof(char), recordSize, fin);
    fseek(fin, swapA * recordSize * sizeof(char), SEEK_SET);
    fwrite(recordB, sizeof(char), recordSize, fin);
    fseek(fin, swapB * recordSize * sizeof(char), SEEK_SET);
    fwrite(recordA, sizeof(char), recordSize, fin);
    fclose(fin);
}