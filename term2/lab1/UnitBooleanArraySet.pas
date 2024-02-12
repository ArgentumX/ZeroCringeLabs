unit UnitBooleanArraySet;

interface

const
  ALPHABET_SIZE = 62;

type
  TCharSet = array[1..ALPHABET_SIZE] of Boolean;

procedure Init(var x: TCharSet);
procedure Add(var x: TCharSet; ch: Char);

function Union(const x, y: TCharSet): TCharSet;
function Intersection(const x, y: TCharSet): TCharSet;
function Difference(const x, y: TCharSet): TCharSet;
function Contains(const x: TCharSet; const ch: Char): Boolean;
function ToString(const x: TCharSet): String;

implementation 

function GetCharIndex(ch: Char): Integer;
var
  res: Integer;
begin
  case ord(ch) of
    48..57: res := ord(ch) - ord('0');
    65..90: res := ord(ch) - (ord('0') + 7);
    97..122: res := ord(ch) - (ord('0') + 13)
  else
    
  end;
  GetCharIndex := res + 1;
end;

function GetCharByIndex(index: Integer): Char;
var
  trueIndexRes: Integer;
begin
  case index of
    1..10: trueIndexRes := ord('0') + index;
    11..36: trueIndexRes := ord('0') + index + 7;
    37..62: trueIndexRes := ord('0') + index + 13
  else
    
  end;
  GetCharByIndex := chr(trueIndexRes - 1);
end;

procedure Init(var X: TCharSet);
var
  i: Integer;
begin
  for i := 1 to ALPHABET_SIZE do
  begin
    X[i] := False;
  end;
end;

procedure Add(var X: TCharSet; ch: Char);
begin
  X[GetCharIndex(ch)] := True;
end;

function Union(const X, Y: TCharSet): TCharSet;
var
  res: TCharSet;
  i: Integer;
begin
  Init(res);
  for i := 1 to ALPHABET_SIZE do
  begin
    if ((X[i] = True) or (Y[i] = True)) then
    begin
      res[i] := True;
    end;
  end;
  Union := res;
end;

function Intersection(const X, Y: TCharSet): TCharSet;
var
  res: TCharSet;
  i: Integer;
begin
  Init(res);
  for i := 1 to ALPHABET_SIZE do
  begin
    if ((X[i] = True) and (Y[i] = True)) then
    begin
      res[i] := True;
    end;
  end;
  Intersection := res;
end;

function Difference(const X, Y: TCharSet): TCharSet;
var
  res: TCharSet;
  i: Integer;
begin
  Init(res);
  for i := 1 to ALPHABET_SIZE do
  begin
    if ((X[i] = True) and (Y[i] = False)) then
    begin
      res[i] := True;
    end;
  end;
  Difference := res;
end;

function Contains(const X: TCharSet; const ch: Char): Boolean;
begin
  Contains := X[GetCharIndex(ch)];
end;

function ToString(const X: TCharSet): String;
var
  res: String;
  i: Integer;
begin
  res := '[';
  for i := 1 to ALPHABET_SIZE do
  begin
    if X[i] = True then
    begin
      res += ' ' + GetCharByIndex(i);
    end;
  end;
  res += ' ]';
  ToString := res;
end;

end.