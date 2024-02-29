unit UnitBooleanArraySet;

interface

const
  ALPHABET_SIZE = 62;

type
  TCharSet = array[1..ALPHABET_SIZE] of Boolean;

procedure Init(var x: TCharSet);
procedure Add(var x: TCharSet; ch: Char);
procedure Remove(var x: TCharSet; ch: Char);
procedure Copy(const x: TCharSet; var z: TCharSet);

function Contains(const x: TCharSet; ch: Char): Boolean;

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

procedure Init(var x: TCharSet);
var
  i: Integer;
begin
  for i := 1 to ALPHABET_SIZE do
  begin
    X[i] := False;
  end;
end;

procedure Add(var x: TCharSet; ch: Char);
begin
  x[GetCharIndex(ch)] := True;
end;

procedure Remove(var x: TCharSet; ch: Char);
begin
  x[GetCharIndex(ch)] := False;
end;

function Contains(const x: TCharSet; ch: Char): Boolean;
begin
  Contains := x[GetCharIndex(ch)];
end;

procedure Copy(const x: TCharSet; var z: TCharSet);
var 
  ch: Char;
  i: Integer;
begin
  Init(z);
  for i := 1 to ALPHABET_SIZE do
  begin
    ch := GetCharByIndex(i);
    if (Contains(x, ch)) then
    begin
      Add(z, ch);
    end;
  end;
end;

end.