unit UnidirectionalArrayList;

interface

uses UnitTypes;

type
  PElem = record
    x: array of TInfo;
    n, l, d: integer;
  end;


procedure Init(var an: PElem; ch: TInfo);

procedure AddToStart(var an: PElem; ch: TInfo);
procedure AddToEnd(var an: PElem; ch: TInfo);
procedure AddTo(var an: PElem; index: integer; ch: TInfo);

procedure RemoveStart(var an: PElem);
procedure RemoveEnd(var an: PElem);
procedure Remove(var an: PElem; index: integer);

function GetInfo(const an: PElem; index: integer): TInfo;

procedure MoveForward(var xn: PElem);
function IsEmpty(const an: PElem): boolean;

implementation

procedure AddMemoryBefore(var an: PElem);
var 
  i: integer;
  k: PElem;
begin
  k.n := an.n;
  k.d := an.d;
  k.l := 10;
  SetLength(k.x, k.l + k.n + k.d);
  for i := 0 to an.n do
     k.x[k.l + i]  := an.x[i];
  an := k;
end;

procedure AddMemoryAfter(var an: PElem);
begin
  an.d := 10;
  SetLength(an.x, an.l + an.n + an.d);
end;

procedure Init(var an: PElem; ch: TInfo);
begin
  an.n := 1;
  an.l := 10;
  an.d := 10;
  SetLength(an.x, an.n + an.l + an.d);
  an.x[an.l] := ch;
end;

procedure AddToStart(var an: PElem; ch: TInfo);
var 
  i: integer;
begin
  If an.l = 0 then
    AddMemoryBefore(an);
  an.l := an.l - 1;
  an.n := an.n + 1;
  an.x[an.l] := ch;
end;

procedure AddToEnd(var an: PElem; ch: TInfo);
begin
  if an.d = 0 then
    AddMemoryAfter(an);
  an.d := an.d - 1;
  an.n := an.n + 1;
  an.x[an.l + an.n - 1] := ch;
end;

procedure AddTo(var an: PElem; index: integer; ch: TInfo);
var i: integer;
begin
  if an.d = 0 then
    AddMemoryAfter(an);
  
  for i := an.n + an.l downto an.l + index + 1 do begin
    an.x[i] := an.x[i - 1];
  end;
  an.x[an.l + index] := ch;
  an.n += 1;
  an.d -= 1;
end;

procedure RemoveStart(var an: PElem);
var ch: TInfo;
begin
  ch.val := 0;
  an.x[an.l - 1] := ch;
  an.l += 1;
  an.n -= 1;
end;
procedure RemoveEnd(var an: PElem);
var ch: TInfo;
begin
  ch.val := 0;
  an.x[an.l + an.n - 1] := ch;
  an.d += 1;
  an.n -= 1;
end;
procedure Remove(var an: PElem; index: integer);
var 
  ch: TInfo;
  i: integer;
begin
  ch.val := 0;
  for i := an.l + index + 1 to an.l + an.n - 1 do begin
    an.x[i - 1] := an.x[i];
  end;
  an.x[an.l + an.n - 1] := ch;
  an.d += 1;
  an.n -= 1;
end;

function GetInfo(const an: PElem; index: integer): TInfo;
begin
  result := an.x[an.l + index];
end;

procedure MoveForward(var xn: PElem);
begin
  xn.l += 1;
  xn.n -= 1;
end;
function IsEmpty(const an: PElem): boolean;
begin
  result := an.n = 0;
end;

end.