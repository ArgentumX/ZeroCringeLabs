unit UnitCharArraySet;

interface

type
  TCharSet = record
    n: integer;
    arr: array of Char;
  end;

procedure Init(var x: TCharSet);
procedure Add(var x: TCharSet; ch: Char);
procedure Remove(var x: TCharSet; ch: Char);
procedure Copy(const x: TCharSet; var z: TCharSet);

function Contains(const x: TCharSet; ch: Char): Boolean;

implementation 

function GetCharIndex(var x: TCharSet; ch: Char): Integer;
var
  i: Integer;
  flag: Boolean;
begin
  i := 0;
  flag := False;
  while (i < x.n) and (not flag) do
  begin
    if (x.arr[i] = ch) then
    begin
      GetCharIndex := i;
      flag := True;
    end;
    i += 1;
  end;
end;

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

procedure Remove(var x: TCharSet; ch: Char);
begin
  if Contains(x, ch) then
  begin
    x.arr[GetCharIndex(x, ch)] := x.arr[x.n - 1];
    x.n -= 1;
    SetLength(x.arr, x.n);
  end;
end;

function Contains(const x: TCharSet; ch: Char): Boolean;
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

procedure Copy(const x: TCharSet; var z: TCharSet);
var 
  i: Integer;
begin
  Init(z);
  for i := 0 to x.n - 1 do
  begin
    Add(z, x.arr[i])
  end;
end;

end.