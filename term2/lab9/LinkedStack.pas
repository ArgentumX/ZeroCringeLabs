unit LinkedStack;

interface

uses UnitTypes;

type
  TStack = ^SElem;
  SElem = record
    info: TInfo;
    next: TStack;
  end;
  
procedure Init(var top: TStack; ch: TInfo);
function IsEmpty(var top: TStack): boolean;
procedure AddTop(var top: TStack; ch: TInfo);
procedure RemoveTop(var top: TStack);
function GetInfo(var top: TStack): TInfo;
procedure TopToTop(var fromTop, toTop: TStack);


implementation

procedure Init(var top: TStack; ch: TInfo);
begin
  new(top);
  top^.info := ch;
  top^.next := nil;
end;
function IsEmpty(var top: TStack): boolean;
begin
  result := top = nil;
end;
procedure AddTop(var top: TStack; ch: TInfo);
var newTop: TStack;
begin
  new(newTop);
  newTop^.info := ch;
  newTop^.next := top;
  top := newTop;
end;
procedure RemoveTop(var top: TStack);
var oldTop: TStack;
begin
  if not IsEmpty(top^.next) then begin
    oldTop := top;
    top := top^.next;
    oldTop^.next := nil;
    dispose(oldTop);
  end
  else begin
    dispose(top);
  end;
end;
function GetInfo(var top: TStack): TInfo;
begin
  result := top^.info;
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