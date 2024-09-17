#include <cstdio>
#include <math.h>
#include <locale.h>
#include <string.h>
#include <fstream>
#include <iostream>
#include <set>

const int MAX_STRING_LENGTH = 256;
int ReadString(char *inputFName, char *str);
void WriteString(char *str);
void AppendString(char *toStr, char *append, int appendLength);
void ReworkString(char *baseStr, char *result);

int main(int argc, char *argv[])
{
    char *str = new char[MAX_STRING_LENGTH]();
    char *result = new char[MAX_STRING_LENGTH]();
    setlocale(LC_ALL, "rus");
    if (argc < 2)
    {
        printf("Недостаточно параметров!\n");
        return 0;
    }
    ReadString(argv[1], str);
    printf("\nИсходная строка: %s\n", str);
    ReworkString(str, result);
    printf("\nВыходная строка: %s\n", result);
}

int ReadString(char *inputFName, char *str)
{
    FILE *file;
    if ((file = fopen(inputFName, "r")) == NULL)
    {
        printf("Невозможно открыть файл '%s'\n", inputFName);
        return 0;
    }
    fgets(str, MAX_STRING_LENGTH, file);
}

void ReworkString(char *baseStr, char *result)
{
    char lastWord[MAX_STRING_LENGTH];
    bool foundDouble = false;
    int lastWordLength = 0;
    std::set<char> ascii;
    for (int i = 0; i < strlen(baseStr); i++)
    {
        if (baseStr[i] == ' ')
        {
            if (lastWordLength > 0)
            {
                if (!foundDouble)
                {
                    AppendString(result, lastWord, lastWordLength);
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
            AppendString(result, lastWord, lastWordLength);
        }
    }
}

void AppendString(char *toStr, char *append, int appendLength)
{
    int baseStrLength = strlen(toStr);
    for (int i = 0; i < appendLength; i++)
    {
        toStr[baseStrLength + i] = append[i];
    }
    toStr[baseStrLength + appendLength] = ' ';
}