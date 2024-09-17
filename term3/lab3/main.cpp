#include <cstdio>
#include <math.h>
#include <locale.h>
#include <fstream>
#include <iostream>
#include <typeinfo>
using namespace std;

const int recordSize = 6;

struct Record
{
    char chars[recordSize];
};

void createBinFile(char *inputFName, char *binFName);
void ReadAndWriteBinFile(char *fname, char *comment);
int swap(char *fname, int swapA, int swapB);
void WriteArray(Record record);
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
        Record record;
        for (int j = 0; j < recordSize; j++)
        {
            if (fscanf(file, "%s", &record.chars[j]) < 1)
            {
                printf("Ошибка чтения из файла '%s'\n", inputFName);
                fclose(file);
                return;
            }
        }
        fout.write((char *)(&record), sizeof(Record));
    }
    fout.close();
    fclose(file);
}
void WriteArray(Record record)
{
    for (int z = 0; z < recordSize; z++)
    {
        cout << record.chars[z] << " ";
    }
}
void ReadAndWriteBinFile(char *fname, char *comment)
{
    FILE *fin = fopen(fname, "r");
    fseek(fin, 0, SEEK_END);
    int recordAmount = ftell(fin) / sizeof(Record);
    Record record;
    fseek(fin, 0, SEEK_SET);
    printf(comment);
    for (int i = 0; i < recordAmount; i++)
    {
        fread(&record, sizeof(Record), 1, fin);
        WriteArray(record);
        printf("\n");
    }
    fclose(fin);
}
int swap(char *fname, int swapA, int swapB)
{
    Record recordA, recordB;
    FILE *fin = fopen(fname, "r+");
    fseek(fin, 0, SEEK_END);
    int recordsAmount = ftell(fin) / sizeof(Record);
    fseek(fin, 0, SEEK_SET);
    if (swapA >= recordsAmount || swapB >= recordsAmount)
    {
        printf("\nCan't swap: wrong swap indexes\n");
        return 0;
    }
    fseek(fin, swapA * sizeof(Record), SEEK_SET);
    fread(&recordA, sizeof(Record), 1, fin);
    fseek(fin, swapB * sizeof(Record), SEEK_SET);
    fread(&recordB, sizeof(Record), 1, fin);
    fseek(fin, swapA * sizeof(Record), SEEK_SET);
    fwrite((char *)(&recordB), sizeof(Record), 1, fin);
    fseek(fin, swapB * sizeof(Record), SEEK_SET);
    fwrite((char *)(&recordA), sizeof(Record), 1, fin);
    fclose(fin);
}