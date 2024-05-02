unit ArrayStack;

interface

uses UnitTypes;

type
  TStack = record
    x: array of TInfo;
    n, r: integer;
  end;
  
procedure Init(var top: TStack; ch: TInfo);
function IsEmpty(var top: TStack): boolean;
procedure AddTop(var top: TStack; ch: TInfo);
procedure RemoveTop(var top: TStack);
function GetInfo(var top: TStack): TInfo;
procedure TopToTop(var fromTop, toTop: TStack);

implementation

procedure AddMemoryAfter(var stack: TStack);
begin
  stack.r := 10;
  SetLength(stack.x, stack.n + stack.r)
end;

procedure Init(var top: TStack; ch: TInfo);
begin
  top.n := 1;
  top.r := 10;
  SetLength(top.x, top.r + top.n);
  top.x[top.n-1] := ch;
end;
function IsEmpty(var top: TStack): boolean;
begin
  result := top.n = 0;
end;
procedure AddTop(var top: TStack; ch: TInfo);
begin
  top.n += 1;
  top.r -= 1;
  top.x[top.n-1] := ch;
  
  if (top.r = 0) then
    AddMemoryAfter(top);
end;

procedure RemoveTop(var top: TStack);
begin
  if not IsEmpty(top) then begin
    top.n -= 1;
    top.r += 1;
  end;
end;
  
function GetInfo(var top: TStack): TInfo;
begin
  result := top.x[top.n-1];
end;
procedure TopToTop(var fromTop, toTop: TStack);
var ch: TInfo;
begin
  ch := GetInfo(fromTop);
  RemoveTop(fromTop);
  if not IsEmpty(toTop) then
    AddTop(toTop, ch)
  else
    Init(toTop, ch);
end;


end.