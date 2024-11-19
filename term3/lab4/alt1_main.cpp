#include <cstdio>
#include <math.h>
#include <locale.h>
#include <string.h>
#include <fstream>
#include <iostream>
#include <set>

const int MAX_STRING_LENGTH = 256;
int ReadString(char *inputFName, char *str, int *length);
void AppendString(char *toStr, int *toLength, char *append, int appendLength);
void ReworkString(char *baseStr, int baseLength, char *result, int *resultLength);

int main(int argc, char *argv[])
{
    char *str = new char[MAX_STRING_LENGTH]();
    char *result = new char[MAX_STRING_LENGTH]();
    int strLength, resultLength;
    setlocale(LC_ALL, "rus");
    if (argc < 2)
    {
        printf("Недостаточно параметров!\n");
        return 0;
    }
    ReadString(argv[1], str, &strLength);
    if (strLength == 0)
    {
        printf("Подана нулевая строка\n");
        return 0;
    }
    printf("\nИсходная строка: %s\n", str);
    ReworkString(str, strLength, result, &resultLength);
    if (resultLength == 0)
    {
        printf("Нет слов по условию\n");
        return 0;
    }
    printf("\nВыходная строка: %s\n", result);
}

int ReadString(char *inputFName, char *str, int *length)
{
    FILE *file;
    if ((file = fopen(inputFName, "r")) == NULL)
    {
        printf("Невозможно открыть файл '%s'\n", inputFName);
        return 0;
    }
    fgets(str, MAX_STRING_LENGTH, file);
    *length = strlen(str);
}

void ReworkString(char *baseStr, int baseLength, char *result, int *resultLength)
{
    *resultLength = 0;
    char lastWord[MAX_STRING_LENGTH];
    bool foundDouble = false;
    int lastWordLength = 0;
    std::set<char> ascii;
    for (int i = 0; baseStr[i] != '\0'; i++)
    {
        if (baseStr[i] == ' ')
        {
            if (lastWordLength > 0)
            {
                if (!foundDouble)
                {
                    AppendString(result, resultLength, lastWord, lastWordLength);
                }
                ascii.clear();
                foundDouble = false;
                lastWordLength = 0;
            }
        }
        else
        {
            lastWord[lastWordLength] = baseStr[i];
            if (ascii.count(baseStr[i]) == 1)
            {
                foundDouble = true;
            }
            else
            {
                ascii.insert(baseStr[i]);
            }
            lastWordLength += 1;
        }
    }
    if (lastWordLength > 0)
    {
        if (!foundDouble)
        {
            AppendString(result, resultLength, lastWord, lastWordLength);
        }
    }
}

void AppendString(char *toStr, int *toLength, char *append, int appendLength)
{
    for (int i = 0; i < appendLength; i++)
    {
        toStr[*toLength + i] = append[i];
    }
    toStr[*toLength + appendLength] = ' ';
    *toLength += appendLength + 1;
}