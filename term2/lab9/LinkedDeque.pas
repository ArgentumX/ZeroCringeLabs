unit LinkedDeque;

interface

uses UnitTypes;

type
  TDeque = ^DElem;
  DElem = record
    info: TInfo;
    next, prev: TDeque;
  end;
  
procedure Init(var head, tail: TDeque; ch: TInfo);
function IsEmpty(var anything: TDeque): boolean;
procedure AddHead(var head, tail: TDeque; ch: TInfo);
procedure AddTail(var head, tail: TDeque; ch: TInfo);
procedure RemoveHead(var head, tail: TDeque);
procedure RemoveTail(var head, tail: TDeque);
function GetInfoHead(var head, tail: TDeque): TInfo;
function GetInfoTail(var head, tail: TDeque): TInfo;
procedure HeadToTail(var head, tail, toHead, toTail: TDeque);
procedure HeadToHead(var head, tail, toHead, toTail: TDeque);
procedure TailToHead(var head, tail, toHead, toTail: TDeque);
procedure TailToTail(var head, tail, toHead, toTail: TDeque);

implementation

procedure Init(var head, tail: TDeque; ch: TInfo);
begin
  new(head);
  tail := head;
  head^.info := ch;
  head^.prev := nil;
  head^.next := nil;
end;
function IsEmpty(var anything: TDeque): boolean;
begin
  result := anything = nil;
end;
procedure AddHead(var head, tail: TDeque; ch: TInfo);
var newHead: TDeque;
begin
  new(newHead);
  newHead^.info := ch;
  newHead^.prev := head;
  newHead^.next := nil;
  head^.next := newHead;
  head := newHead;
end;
procedure AddTail(var head, tail: TDeque; ch: TInfo);
var newTail: TDeque;
begin
  new(newTail);
  newTail^.info := ch;
  newTail^.prev := nil;
  newTail^.next := tail;
  tail^.prev := newTail;
  tail := newTail;
end;
procedure RemoveHead(var head, tail: TDeque);
var oldHead: TDeque;
begin
  if not IsEmpty(head^.prev) then begin
    oldHead := head;
    head := head^.prev;
    oldHead^.prev := nil;
    dispose(oldHead);
  end
  else begin
    dispose(head);
  end;
end;
procedure RemoveTail(var head, tail: TDeque);
var oldTail: TDeque;
begin
  if not IsEmpty(tail^.next) then begin
    oldTail := tail;
    tail := tail^.next;
    oldTail^.next := nil;
    dispose(oldTail);
  end
  else begin
    dispose(head);
  end;
end;

function GetInfoHead(var head, tail: TDeque): TInfo;
begin
  result := head^.info;
end;
function GetInfoTail(var head, tail: TDeque): TInfo;
begin
  result := tail^.info;
end;

procedure HeadToHead(var head, tail, toHead, toTail: TDeque);
var ch: TInfo;
begin
  ch := GetInfoHead(head, tail);
  RemoveHead(head, tail);
  if not IsEmpty(toHead) then
    AddHead(toHead, toTail, ch)
  else
    Init(toHead, toTail, ch);
end;
procedure HeadToTail(var head, tail, toHead, toTail: TDeque);
var ch: TInfo;
begin
  ch := GetInfoHead(head, tail);
  RemoveHead(head, tail);
  if not IsEmpty(toHead) then
    AddTail(toHead, toTail, ch)
  else
    Init(toHead, toTail, ch);
end;

procedure TailToHead(var head, tail, toHead, toTail: TDeque);
var ch: TInfo;
begin
  ch := GetInfoTail(head, tail);
  RemoveTail(head, tail);
  if not IsEmpty(toHead) then
    AddHead(toHead, toTail, ch)
  else
    Init(toHead, toTail, ch);
end;
procedure TailToTail(var head, tail, toHead, toTail: TDeque);
var ch: TInfo;
begin
  ch := GetInfoTail(head, tail);
  RemoveTail(head, tail);
  if not IsEmpty(toHead) then
    AddTail(toHead, toTail, ch)
  else
    Init(toHead, toTail, ch);
end;

end.

