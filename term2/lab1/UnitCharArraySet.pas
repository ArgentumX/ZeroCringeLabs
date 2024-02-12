unit UnitCharArraySet;

interface

type
  TCharSet = record
    n: integer;
    arr: array of Char;
  end;

procedure Init(var x: TCharSet);
procedure Add(var x: TCharSet; ch: Char);

function Union(const x, y: TCharSet): TCharSet;
function Intersection(const x, y: TCharSet): TCharSet;
function Difference(const x, y: TCharSet): TCharSet;
function Contains(const x: TCharSet; const ch: Char): Boolean;
function ToString(const x: TCharSet): String;

implementation 

procedure Init(var x: TCharSet);
begin
  x.n := 0;
  SetLength(x.arr, x.n);
end;

procedure Add(var x: TCharSet; ch: Char);
begin
  if not Contains(x, ch) then
  begin
    x.n += 1;
    SetLength(x.arr, x.n);
    x.arr[x.n - 1] := ch;
  end;
end;

function Union(const x, y: TCharSet): TCharSet;
var
  res: TCharSet;
  i: Integer;
begin
  Init(res);
  for i := 0 to (x.n - 1) do
  begin
    Add(res, x.arr[i]);
  end;
  for i := 0 to (y.n - 1) do
  begin
    Add(res, y.arr[i]);
  end;
  Union := res;
end;

function Intersection(const x, y: TCharSet): TCharSet;
var
  res: TCharSet;
  i: Integer;
begin
  Init(res);
  for i := 0 to (x.n - 1) do
  begin
    if Contains(y, x.arr[i]) then
    begin
      Add(res, x.arr[i]);
    end;
  end;
  Intersection := res;
end;

function Difference(const x, y: TCharSet): TCharSet;
var
  res: TCharSet;
  i: Integer;
begin
  Init(res);
  for i := 0 to (x.n - 1) do
  begin
    if not Contains(y, x.arr[i]) then
    begin
      Add(res, x.arr[i]);
    end;
  end;
  Difference := res;
end;

function Contains(const x: TCharSet; const ch: Char): Boolean;
var
  i: Integer;
  flag: Boolean;
begin
  i := 0;
  flag := False;
  while (not flag) and (i < x.n) do
  begin
    if (x.arr[i] = ch) then
    begin
      flag := True;
    end;
    i += 1;
  end;
  Contains := flag;
end;

function ToString(const x: TCharSet): String;
var
  res: String;
  i: Integer;
begin
  res := '[';
  for i := 48 to 122 do
  begin
    if Contains(x, chr(i)) then
    begin
      res += ' ' + chr(i);
    end;
  end;
  res += ' ]';
  ToString := res;
end;

end.