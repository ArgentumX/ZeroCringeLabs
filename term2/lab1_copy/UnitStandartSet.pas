unit UnitStandartSet;

interface

type
  TCharSet = set of Char;

procedure Init(var x: TCharSet);
procedure Add(var x: TCharSet; ch: Char);
procedure Remove(var x: TCharSet; ch: Char);
procedure Copy(const x: TCharSet; var z: TCharSet);

function Contains(const x: TCharSet; ch: Char): Boolean;

implementation 

procedure Init(var X: TCharSet);
begin
  X := [];
end;

procedure Add(var X: TCharSet; ch: Char);
begin
  X += [ch];
end;

procedure Remove(var x: TCharSet; ch: Char);
begin
  Exclude(x, ch);
end;

function Contains(const X: TCharSet; ch: Char): Boolean;
begin
  Contains := ch in X;
end;

procedure Copy(const x: TCharSet; var z: TCharSet);
var 
  e: Char;
begin
  Init(z);
  foreach e in x do 
  begin
    z += [e];
  end;
end;

end.