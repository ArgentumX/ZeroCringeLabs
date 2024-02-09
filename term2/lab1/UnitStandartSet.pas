unit UnitStandartSet;

interface

type
  TCharSet = set of Char;

procedure Init(var x: TCharSet);
procedure Add(var x: TCharSet; ch: Char);

function Union(const x, y: TCharSet): TCharSet;
function Intersection(const x, y: TCharSet): TCharSet;
function Difference(const x, y: TCharSet): TCharSet;
function Contains(const x: TCharSet; const ch: Char): Boolean;
function ToString(const x: TCharSet): String;

implementation 

procedure Init(var X: TCharSet);
begin
  X := [];
end;

procedure Add(var X: TCharSet; ch: Char);
begin
  X += [ch];
end;

function Union(const X, Y: TCharSet): TCharSet;
begin
  Union := X + Y;
end;

function Intersection(const X, Y: TCharSet): TCharSet;
begin
  Intersection := X * Y;
end;

function Difference(const X, Y: TCharSet): TCharSet;
begin
  Difference := X - Y;
end;

function Contains(const X: TCharSet; const ch: Char): Boolean;
begin
  Contains := ch in X;
end;

function ToString(const X: TCharSet): String;
var
  res: String;
  i: Integer;
begin
  res := '[';
  for i := ord('A') to ord('z') do
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