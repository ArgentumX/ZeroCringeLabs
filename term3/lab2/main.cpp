
#include <cstdio>
#include <math.h>
#include <locale.h>

const int nmax = 20;
int ReadMatrix(int *n, int x[][nmax], char *fname);
int GetMultiply(int n, int x[][nmax]);
int GetMultiplyMonolith(int n, int x[][nmax]);
int GetMultiply(int n, int x[], bool *foundAny);

int GetMax(int n, int x[]);
int GetMaxs(int n, int x[][nmax], int result[]);
int GetMaxsMonolith(int n, int x[][nmax], int result[]);

void WriteArray(int n, int x[], char *comment);
void WriteMatrix(int n, int x[][nmax], char *comment);
int main(int argc, char *argv[])
{
  int na, nb, A[nmax][nmax], B[nmax][nmax], multA, multB, resArray[nmax], rn;
  setlocale(LC_ALL, "rus");
  if (argc < 3)
  {
    printf("Недостаточно параметров!\n");
    return 0;
  }

  if (!(ReadMatrix(&na, A, argv[1])) || !(ReadMatrix(&nb, B, argv[2])))
  {
    return 0;
  }

  multA = GetMultiply(na, A);
  multB = GetMultiply(nb, B);
  if (multA >= multB)
  {
    GetMaxs(na, A, resArray);
    rn = na;
  }
  else
  {
    GetMaxs(nb, B, resArray);
    rn = nb;
  }
  WriteMatrix(na, A, "Matrix A:");
  WriteMatrix(nb, B, "Matrix B:");
  WriteArray(rn, resArray, "Result: ");
}

int ReadMatrix(int *n, int x[][nmax], char *fname)
{
  FILE *file;
  if ((file = fopen(fname, "r")) == NULL)
  {
    printf("Невозможно открыть файл '%s'\n", fname);
    return 0;
  }
  if (fscanf(file, "%d", n) < 1)
  {
    printf("Ошибка чтения из файла '%s'\n", fname);
    fclose(file);
    return 0;
  }
  if (*n < 0 || *n > nmax)
  {
    printf("Кол-во эл-тов массива должно быть от 1 до %d! (файл '%s')\n", nmax, fname);
    return 0;
  }
  for (int i = 0; i < *n; i++)
    for (int j = 0; j < *n; j++)
    {
      if (fscanf(file, "%d", &x[i][j]) < 1)
      {
        printf("Ошибка чтения из файла '%s'\n", fname);
        fclose(file);
        return 0;
      }
    }
  fclose(file);
  return 1;
}
void WriteArray(int n, int x[], char *comment)
{
  if (comment != "")
  {
    printf("%s\n", comment);
  }
  for (int i = 0; i < n; i++)
  {
    printf("%d ", x[i]);
  }
  printf("\n");
}

void WriteMatrix(int n, int x[][nmax], char *comment)
{
  printf("%s\n", comment);
  for (int i = 0; i < n; i++)
  {
    WriteArray(n, x[i], "");
  }
}
int GetMultiply(int n, int x[][nmax])
{
  int result = 1;
  bool foundAny = false;
  for (int i = 0; i < n; i++)
  {
    result *= GetMultiply(n, x[i], &foundAny);
  }
  return foundAny ? result : 0;
}
int GetMultiplyMonolith(int n, int x[][nmax])
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
int GetMultiply(int n, int x[], bool *foundAny)
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

int GetMax(int n, int x[])
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
int GetMaxs(int n, int x[][nmax], int result[])
{
  for (int i = 0; i < n; i++)
  {
    result[i] = GetMax(n, x[i]);
  }
}
int GetMaxsMonolith(int n, int x[][nmax], int result[])
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