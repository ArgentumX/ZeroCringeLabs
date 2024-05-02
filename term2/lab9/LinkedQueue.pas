unit LinkedQueue;

interface

uses UnitTypes;

type
  TQueue = ^QElem;
  QElem = record
    info: TInfo;
    next: TQueue;
  end;
  
procedure Init(var head, tail: TQueue; ch: TInfo);
function IsEmpty(var head: TQueue): boolean;
procedure AddTail(var head, tail: TQueue; ch: TInfo);
procedure RemoveHead(var head, tail: TQueue);
function GetInfoHead(var head, tail: TQueue): TInfo;
procedure HeadToTail(var fromHead, fromTail, toHead, toTail: TQueue);


implementation

procedure Init(var head, tail: TQueue; ch: TInfo);
begin
  new(head);
  head^.info := ch;
  head^.next := nil;
  tail := head;
end;

function IsEmpty(var head: TQueue): boolean;
begin
  result := head = nil;
end;

procedure AddTail(var head, tail: TQueue; ch: TInfo);
var newTail: TQueue;
begin
  new(newTail);
  newTail^.info := ch;
  newTail^.next := nil;
  tail^.next := newTail;
  tail := newTail;
end;

procedure RemoveHead(var head, tail: TQueue);
var oldHead: TQueue;
begin
  if not IsEmpty(head^.next) then begin
    oldHead := head;
    head := head^.next;
    oldHead^.next := nil;
    dispose(oldHead);
  end
  else begin
    dispose(head);
  end;
end;

function GetInfoHead(var head, tail: TQueue): TInfo;
begin
  result := head^.info;
end;

procedure HeadToTail(var fromHead, fromTail, toHead, toTail: TQueue);
var ch: TInfo;
begin
  ch := GetInfoHead(fromHead, fromTail);
  RemoveHead(fromHead, fromTail);
  if not IsEmpty(toHead) then
    AddTail(toHead, toTail, ch)
  else
    Init(toHead, toTail, ch);
end;

end.