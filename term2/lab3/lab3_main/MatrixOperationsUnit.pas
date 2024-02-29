unit MatrixOperationsUnit;

interface

uses UnitTypes;

procedure ReadMatrix(var fin: TextFile; var x: matrix; var n, m: integer);

procedure WriteMatrix(var fout: TextFile; const x: matrix; const n, m: integer; comment: string);

function GetLastRowWithNumber(const x: matrix; const n, m: integer; const number: real) : integer;

function GetSpecialСonditionSum(const x: matrix; const n, m: integer; const number: real; var successful, ordered: boolean) : real;

function GetOrderedRowsAmount(const x: matrix; const n, m: integer): integer;

implementation

procedure ReadMatrix(var fin: TextFile; var x: matrix; var n, m: integer);
var i, j: integer;
begin
  readln(fin, n, m);
  SetLength(x, n);
  for i := 0 to n-1 do
  begin
    SetLength(x[i], m);
    for j := 0 to m-1 do
    begin
      read(fin, x[i, j]);
    end;
    readln(fin);
  end;
end;

procedure WriteMatrix(var fout: TextFile; const x: matrix; const n, m: integer; comment: string);
var i, j: integer;
begin
  writeln(fout, comment);
  for i := 0 to n-1 do
  begin
    for j := 0 to m-1 do
    begin
      write(fout, x[i, j], ' ');
    end;
    writeln(fout, '');
  end;
end;

function GetLastRowWithNumber(const x: matrix; const n, m: integer; const number: real) : integer;
var 
  i, j: integer;
  foundFlag: boolean;
begin
  foundFlag := False;
  i := n - 1;
  while (not foundFlag) and (i >= 0) do
  begin
    j := 0;
    while (j < m) and (not foundFlag) do
    begin
      if (x[i, j] = number) then
      begin
        foundFlag := True;
      end;
      j += 1;
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

function IsRowOrdered(const x: matrix; const n, m, index: integer): boolean;
var 
  j: integer;
  notOrderedFlag: boolean;
begin
  notOrderedFlag := False;
  j := 1;
  while (j < m) and (not notOrderedFlag) do
  begin
    if (x[index, j] < x[index, j-1]) then
    begin
      notOrderedFlag := True;
    end;
    j += 1;
  end;
  result := not notOrderedFlag
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
    for j := 0 to m-1 do
    begin
      if x[rowIndex, j] < 0 then
      begin
        sum += x[rowIndex, j];
      end;
    end;
    result := sum;
    successful := True;
    ordered := IsRowOrdered(x, n, m, rowIndex);
  end;
end;

function GetOrderedRowsAmount(const x: matrix; const n, m: integer): integer;
var 
  i, amount: integer;
begin
  amount := 0;
  for i := 0 to n-1 do
  begin
    if (IsRowOrdered(x, n, m, i)) then
      amount += 1;
  end;
  result := amount;
end;

end.