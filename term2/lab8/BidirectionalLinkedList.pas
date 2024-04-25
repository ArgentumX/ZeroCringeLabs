unit BidirectionalLinkedList;

interface

uses UnitTypes;

type
  PElem = ^TElem;
  TElem = record
    info: TInfo;
    prev, next: PElem;
  end;

procedure Init(var an, bn: PElem; ch: TInfo);

procedure AddToStart(var an, bn: PElem; ch: TInfo);
procedure AddToEnd(var an, bn: PElem; ch: TInfo);
procedure AddToMiddle(var an, bn, cn: PElem; ch: TInfo);

procedure RemoveStart(var an, bn: PElem);
procedure RemoveEnd(var an, bn: PElem);
procedure RemoveMiddle(var an, bn, cn: PElem);

function GetMiddle(const an, bn, cn: PElem): PElem;
function GetInfo(const xn: PElem): TInfo;

procedure MoveForward(var xn: PElem);
procedure MoveBack(var xn: PElem);
function IsEmpty(const xn: PElem): boolean;

implementation

procedure Init(var an, bn: PElem; ch: TInfo);
begin
  new(an);
  an^.info := ch;
  an^.next := nil;
  an^.prev := nil;
  bn := an;
end;

procedure AddToStart(var an, bn: PElem; ch: TInfo);
var nn: PElem;
begin
  new(nn);
  nn^.info := ch;
  nn^.next := an;
  nn^.prev := nil;
  an^.prev := nn;
  an := nn;
end;

procedure AddToEnd(var an, bn: PElem; ch: TInfo);
var nn: PElem;
begin
  new(nn);
  nn^.info := ch;
  nn^.next := nil;
  nn^.prev := bn;
  bn^.next := nn;
  bn := nn;
end;

procedure AddToMiddle(var an, bn, cn: PElem; ch: TInfo);
var nn: PElem;
begin
  new(nn);
  nn^.info := ch;
  if not IsEmpty(cn^.next) then
  begin
    nn^.next := cn^.next;
    cn^.next^.prev := nn;
  end
  else begin
    nn^.next := nil;
  end;
  nn^.prev := cn;
  cn^.next := nn;
end;

procedure RemoveStart(var an, bn: PElem);
var dn: PElem;
begin
  dn := an;
  an := dn^.next;
  dn^.next := nil;
  an^.prev := nil;
  dispose(dn);
end;

procedure RemoveEnd(var an, bn: PElem);
var dn: PElem;
begin
  dn := bn;
  bn := dn^.prev;
  bn^.next := nil;
  dn^.prev := nil;
  dispose(dn);
end;

procedure RemoveMiddle(var an, bn, cn: PElem);
var dn: PElem;
begin
  if not IsEmpty(cn^.next) then begin
    dn := cn^.next;
    if not IsEmpty(dn^.next) then
    begin
      cn^.next := dn^.next;
      cn^.next^.prev := cn;
      dn^.next := nil;
    end
    else begin
      cn^.next := nil;
    end;
    dn^.prev := nil;
    dispose(dn);
  end;
end;

function GetMiddle(const an, bn, cn: PElem): PElem;
begin
  if not IsEmpty(cn^.next) then
    result := cn^.next;
end;

function GetInfo(const xn: PElem): TInfo;
begin
  if not IsEmpty(xn) then
    result := xn^.info;
end;
procedure MoveForward(var xn: PElem);
begin
  xn := xn^.next;
end;

procedure MoveBack(var xn: PElem);
begin
  xn := xn^.prev;
end;

function IsEmpty(const xn: PElem): boolean;
begin
  result := xn = nil;
end;

end.