#include <cstdio>
#include <cstdlib>
#include <locale.h>
#include <math.h>
#include <iomanip>
#include <iostream>
#include <fstream>

double *getArray(int *n, char *fname);
double getSpecialMedian(double x[], int n, double number, double (*f)(double));

double f1(double x)
{
    return x;
}

double f2(double x)
{
    return x * x;
}

void printArray(double *x, int n, char *comment, std::ofstream *file, double (*f)(double))
{
    *file << comment;
    for (int i = 0; i < n; i++)
    {
        *file << f(x[i]) << " ";
    }
    *file << std::endl;
}

int main(int argc, char *argv[])
{
    double *a, *b, *c;
    double sa, sb, sc, max, number;
    int na, nb, nc;
    std::ofstream outFile("output.txt");
    outFile << std::fixed << std::setprecision(2);
    setlocale(LC_ALL, "rus");

    if (argc < 4)
    {
        printf("Недостаточно параметров!\n");
        return 0;
    }

    a = getArray(&na, argv[1]);
    b = getArray(&nb, argv[2]);
    c = getArray(&nc, argv[3]);
    if (!a || !b || !c)
        return 0;
    printArray(a, na, "Array a: ", &outFile, f1);
    printArray(b, nb, "Array b: ", &outFile, f1);
    printArray(c, nc, "Array c: ", &outFile, f1);

    number = std::strtod(argv[4], NULL);
    sa = getSpecialMedian(a, na, number, sqrt);
    sb = getSpecialMedian(b, nb, number, sqrt);
    sc = getSpecialMedian(c, nc, number, sqrt);

    printArray(a, na, "Reworked array a: ", &outFile, sqrt);
    printArray(b, nb, "Reworked array b: ", &outFile, sqrt);
    printArray(c, nc, "Reworked array c: ", &outFile, sqrt);
    max = sa;
    if (sb > max)
        max = sb;
    if (sc > max)
        max = sc;

    if (sa == max)
        outFile << "Массив А имеет максимальное среднее арифметическое по условию: " << max << std::endl;
    if (sb == max)
        outFile << "Массив B имеет максимальное среднее арифметическое по условию: " << max << std::endl;
    if (sc == max)
        outFile << "Массив C имеет максимальное среднее арифметическое по условию: " << max << std::endl;

    outFile.close();
}

double getSpecialMedian(double x[], int n, double number, double (*f)(double))
{
    double result = 0;
    int amount = 0;
    for (int i = 0; i < n; i++)
    {
        if (f(x[i]) < number)
        {
            result += f(x[i]);
            amount++;
        }
    }
    return amount != 0 ? result / amount : result;
}

double *getArray(int *n, char *fname)
{
    FILE *file;

    if ((file = fopen(fname, "r")) == NULL)
    {
        printf("Невозможно открыть файл '%s'\n", fname);
        return NULL;
    }
    if (fscanf(file, "%d", n) < 1)
    {
        printf("Ошибка чтения из файла '%s'\n", fname);
        fclose(file);
        return NULL;
    }
    if (*n < 0)
    {
        printf("Кол-во эл-тов массива должно быть > 0\n");
        fclose(file);
        return NULL;
    }
    double *result = new double[*n]();
    for (int i = 0; i < *n; i++)
    {
        if (fscanf(file, "%lf", &result[i]) < 1)
        {
            printf("Ошибка чтения из файла '%s'\n", fname);
            fclose(file);
            return NULL;
        }
    }
    fclose(file);
    return result;
}
