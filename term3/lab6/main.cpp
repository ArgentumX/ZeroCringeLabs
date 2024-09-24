#include <cstdio>
#include <math.h>
#include <locale.h>
#include <fstream>

int **getMatrix(int *n, char *fname);
int GetMultiply(int n, int **x);
int GetMultiplyMonolith(int n, int **x);
int GetMultiply(int n, int *x, bool *foundAny);

int GetMax(int n, int *x);
int GetMaxs(int n, int **x, int *result);
int GetMaxsMonolith(int n, int **x, int *result);

void WriteArray(int n, int *x, char *comment, std::ofstream *out);
void WriteMatrix(int n, int **x, char *comment, std::ofstream *out);
int main(int argc, char *argv[])
{
  int **A, **B;
  int *resArray;
  int na, nb, multA, multB, rn;
  std::ofstream outFile("output.txt");
  setlocale(LC_ALL, "rus");
  if (argc < 3)
  {
    printf("Недостаточно параметров!\n");
    return 0;
  }

  A = getMatrix(&na, argv[1]);
  B = getMatrix(&nb, argv[2]);
  if (A == NULL || B == NULL)
  {
    return 0;
  }
  multA = GetMultiplyMonolith(na, A);
  multB = GetMultiplyMonolith(nb, B);
  if (multA >= multB)
  {
    resArray = new int[na]();
    GetMaxsMonolith(na, A, resArray);
    rn = na;
  }
  else
  {
    resArray = new int[nb]();
    GetMaxsMonolith(nb, B, resArray);
    rn = nb;
  }
  WriteMatrix(na, A, "Matrix A:", &outFile);
  WriteMatrix(nb, B, "Matrix B:", &outFile);
  WriteArray(rn, resArray, "Result: ", &outFile);
  outFile.close();
}

int **getMatrix(int *n, char *fname)
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
  if (*n < 1)
  {
    printf("Кол-во эл-тов массива должно быть от 1! (файл '%s')\n", fname);
    return NULL;
  }
  int **result = new int *[*n];
  for (int i = 0; i < *n; i++)
  {
    result[i] = new int[*n]();
    for (int j = 0; j < *n; j++)
    {
      if (fscanf(file, "%d", &result[i][j]) < 1)
      {
        printf("Ошибка чтения из файла '%s'\n", fname);
        fclose(file);
        return NULL;
      }
    }
  }
  fclose(file);
  return result;
}
void WriteArray(int n, int *x, char *comment, std::ofstream *out)
{
  if (comment != "")
  {
    *out << comment << std::endl;
  }
  for (int i = 0; i < n; i++)
  {
    *out << x[i] << " ";
  }
  *out << std::endl;
}

void WriteMatrix(int n, int **x, char *comment, std::ofstream *out)
{
  *out << comment << std::endl;
  for (int i = 0; i < n; i++)
  {
    WriteArray(n, x[i], "", out);
  }
}
int GetMultiply(int n, int **x)
{
  int result = 1;
  bool foundAny = false;
  for (int i = 0; i < n; i++)
  {
    result *= GetMultiply(n, x[i], &foundAny);
  }
  return foundAny ? result : 0;
}
int GetMultiplyMonolith(int n, int **x)
{
  int result = 1;
  bool foundAny = false;
  for (int i = 0; i < n; i++)
  {
    for (int j = 0; j < n; j++)
    {
      if (x[i][j] != 0)
      {
        foundAny = true;
        result *= x[i][j];
      }
    }
  }
  return foundAny ? result : 0;
}
int GetMultiply(int n, int *x, bool *foundAny)
{
  int result = 1;
  for (int i = 0; i < n; i++)
  {
    if (x[i] != 0)
    {
      *foundAny = true;
      result *= x[i];
    }
  }
  return result;
}

int GetMax(int n, int *x)
{
  int max = x[0];
  for (int i = 1; i < n; i++)
  {
    if (x[i] > max)
    {
      max = x[i];
    }
  }
  return max;
}
int GetMaxs(int n, int **x, int *result)
{
  for (int i = 0; i < n; i++)
  {
    result[i] = GetMax(n, x[i]);
  }
}
int GetMaxsMonolith(int n, int **x, int *result)
{
  for (int i = 0; i < n; i++)
  {
    int max = x[i][0];
    for (int j = 1; j < n; j++)
    {
      if (x[i][j] > max)
      {
        max = x[i][j];
      }
    }
    result[i] = max;
  }
}