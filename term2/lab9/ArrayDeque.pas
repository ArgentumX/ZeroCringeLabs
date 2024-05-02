unit ArrayDeque;

interface

uses UnitTypes;

type
  TDeque = record
    x: array of TInfo;
    n, r, l: integer;
  end;
  
procedure Init(var deque: TDeque; ch: TInfo);
function IsEmpty(var deque: TDeque): boolean;
procedure AddHead(var deque: TDeque; ch: TInfo);
procedure AddTail(var deque: TDeque; ch: TInfo);
procedure RemoveHead(var deque: TDeque);
procedure RemoveTail(var deque: TDeque);
function GetInfoHead(var deque: TDeque): TInfo;
function GetInfoTail(var deque: TDeque): TInfo;
procedure HeadToTail(var deque, toDeque: TDeque);
procedure HeadToHead(var deque, toDeque: TDeque);
procedure TailToHead(var deque, toDeque: TDeque);
procedure TailToTail(var deque, toDeque: TDeque);

implementation

procedure AddMemoryAfter(var deque: TDeque);
begin
  deque.r := 10;
  SetLength(deque.x, deque.l + deque.n + deque.r);
end;

procedure AddMemoryBefore(var deque: TDeque);
var i, oldL: integer;
begin
  oldL := deque.l;
  deque.l := 10;
  SetLength(deque.x, deque.l + deque.n + deque.r);
  for i := deque.l + deque.n - 1 downto deque.l do begin
    deque.x[i] := deque.x[i - 10 + oldL];
  end;
end;

procedure Init(var deque: TDeque; ch: TInfo);
begin
  deque.n := 1;
  deque.l := 10;
  deque.r := 10;
  SetLength(deque.x, deque.l + deque.n + deque.r);
  deque.x[deque.l] := ch;
end;

function IsEmpty(var deque: TDeque): boolean;
begin
  result := deque.n = 0;
end;

procedure AddHead(var deque: TDeque; ch: TInfo);
begin
  deque.n += 1;
  deque.r -= 1;
  deque.x[deque.l + deque.n - 1] := ch;
  if deque.r = 0 then
    AddMemoryAfter(deque);
end;
procedure AddTail(var deque: TDeque; ch: TInfo);
begin
  deque.n += 1;
  deque.l -= 1;
  deque.x[deque.l] := ch;
  if deque.l = 0 then
    AddMemoryBefore(deque);
end;
procedure RemoveHead(var deque: TDeque);
begin
  deque.n -= 1;
  deque.r += 1;
end;
procedure RemoveTail(var deque: TDeque);
begin
  deque.n -= 1;
  deque.l += 1;
end;
function GetInfoHead(var deque: TDeque): TInfo;
begin
  result := deque.x[deque.l + deque.n - 1];
end;
function GetInfoTail(var deque: TDeque): TInfo;
begin
  result := deque.x[deque.l]; 
end;
procedure HeadToTail(var deque, toDeque: TDeque);
var ch: TInfo;
begin
  ch := GetInfoHead(deque);
  RemoveHead(deque);
  if not IsEmpty(toDeque) then
    AddHead(toDeque, ch)
  else
    Init(toDeque, ch);
end;
procedure HeadToHead(var deque, toDeque: TDeque);
var ch: TInfo;
begin
  ch := GetInfoHead(deque);
  RemoveHead(deque);
  if not IsEmpty(toDeque) then
    AddTail(toDeque, ch)
  else
    Init(toDeque, ch);
end;
procedure TailToHead(var deque, toDeque: TDeque);
var ch: TInfo;
begin
  ch := GetInfoTail(deque);
  RemoveTail(deque);
  if not IsEmpty(toDeque) then
    AddHead(toDeque, ch)
  else
    Init(toDeque, ch);
end;
procedure TailToTail(var deque, toDeque: TDeque);
var ch: TInfo;
begin
  ch := GetInfoTail(deque);
  RemoveTail(deque);
  if not IsEmpty(toDeque) then
    AddTail(toDeque, ch)
  else
    Init(toDeque, ch);
end;


end.