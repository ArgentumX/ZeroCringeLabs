unit VectorOperationsUnit;

interface

uses UnitTypes;

procedure ReadMatrix(var fin: TextFile; var x: matrix; var n, m: integer);

procedure WriteMatrix(var fout: TextFile; const x: matrix; const n, m: integer; comment: string);

function GetLastRowWithNumber(const x: matrix; const n, m: integer; const number: real) : integer;

function GetSpecialСonditionSum(const x: matrix; const n, m: integer; const number: real; var successful, ordered: boolean) : real;

function GetOrderedRowsAmount(const x: matrix; const n, m: integer): integer;

implementation

procedure ReadVector(var fin: TextFile; var vect: vector; const m: integer);
var j: integer;
begin
  SetLength(vect, m);
  for j := 0 to m - 1 do
  begin
    read(fin, vect[j]);
  end;
end;

procedure WriteVector(var fout: TextFile; var vect: vector; const m: integer);
var j: integer;
begin
  for j := 0 to m - 1 do
  begin
    write(fout, vect[j], ' ');
  end;
end;

function IsVectorOrdered(const vect: vector; const m: integer): boolean;
var
  j: integer;
  notOrderedFlag: boolean;
begin
  j := 1;
  notOrderedFlag := False;
  
  while (not notOrderedFlag) and (j < m) do
  begin
    if (vect[j] < vect[j-1]) then
      notOrderedFlag := True;
    j += 1;
  end;
  
  result := not notOrderedFlag;
end;

function VectorContainsNumber(const vect: vector; const m: integer; const number: real): boolean;
var
  j: integer;
  foundFlag: boolean;
begin
  j := 0;
  foundFlag := False;
  
  while (not foundFlag) and (j < m) do
  begin
    if (vect[j] = number) then
      foundFlag := True;
    j += 1;
  end;
  
  result := foundFlag;
end;

function GetVectorSpecialSum(const vect: vector; const m: integer): real;
var 
  j: integer;
  sum: real;
begin
  sum := 0;
  for j := 0 to m - 1 do 
  begin
    if vect[j] < 0 then
      sum += vect[j];
  end;
  result := sum;
end;

procedure ReadMatrix(var fin: TextFile; var x: matrix; var n, m: integer);
var i: integer;
begin
  readln(fin, n, m);
  SetLength(x, n);
  for i := 0 to n-1 do
  begin
    ReadVector(fin, x[i], m);
    readln(fin);
  end;
end;

procedure WriteMatrix(var fout: TextFile; const x: matrix; const n, m: integer; comment: string);
var i: integer;
begin
  writeln(fout, comment);
  for i := 0 to n-1 do
  begin
    WriteVector(fout, x[i], m);
    writeln(fout, '');
  end;
end;

function GetLastRowWithNumber(const x: matrix; const n, m: integer; const number: real) : integer;
var
  i: integer;
  foundFlag: boolean;
begin
  i := n - 1;
  foundFlag := false;
  while (not foundFlag) and (i >= 0) do
  begin
    if VectorContainsNumber(x[i], m, number) then begin
      foundFlag := true;
      end;
    i -= 1;
  end;
  if foundFlag then
  begin
    result := i + 1;
  end
  else
  begin
    result := -1;
  end;
end;

function GetSpecialСonditionSum(const x: matrix; const n, m: integer; const number: real; var successful, ordered: boolean) : real;
var 
  rowIndex, j: integer;
  sum: real;
begin
  sum := 0;
  rowIndex := GetLastRowWithNumber(x, n, m, number);
  if rowIndex = -1 then
  begin
    result := sum;
    successful := False;
    ordered := false;
  end
  else begin
    result := GetVectorSpecialSum(x[rowIndex], m);
    successful := True;
    ordered := IsVectorOrdered(x[rowIndex], m);
  end;
end;

function GetOrderedRowsAmount(const x: matrix; const n, m: integer): integer;
var 
  i, amount: integer;
begin
  amount := 0;
  for i := 0 to n-1 do
  begin
    if (IsVectorOrdered(x[i], m)) then
      amount += 1;
  end;
  result := amount;
end;


end.