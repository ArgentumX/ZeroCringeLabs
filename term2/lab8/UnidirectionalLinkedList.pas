unit UnidirectionalLinkedList;

interface

uses UnitTypes;

type
  PElem = ^TElem;
  TElem = record
    info: TInfo;
    next: PElem;
  end;


procedure Init(var an: PElem; ch: TInfo);

procedure AddToStart(var an: PElem; ch: TInfo);
procedure AddToEnd(var an: PElem; ch: TInfo);
procedure AddToMiddle(var an, cn: PElem; ch: TInfo);

procedure RemoveStart(var an: PElem);
procedure RemoveEnd(var an: PElem);
procedure RemoveMiddle(var an, cn: PElem);

function GetEnd(const an: PElem): PElem;
function GetMiddle(const an, cn: PElem): PElem;
function GetInfo(const bn: PElem): TInfo;

procedure MoveForward(var xn: PElem);
function IsEmpty(const an: PElem): boolean;

implementation

procedure Init(var an: PElem; ch: TInfo);
begin
  new(an);
  an^.info := ch;
  an^.next := nil;
end;

procedure AddToStart(var an: PElem; ch: TInfo);
var nn: PElem;
begin
  new(nn);
  nn^.info := ch;
  nn^.next := an;
  an := nn;
end;
procedure AddToEnd(var an: PElem; ch: TInfo);
var pn, nn: PElem;
begin
  pn := an;
  while not IsEmpty(pn^.next) do
    pn := pn^.next;
  new(nn);
  nn^.info := ch;
  nn^.next := nil;
  pn^.next := nn;
end;
procedure AddToMiddle(var an, cn: PElem; ch: TInfo);
var nn: PElem;
begin
  new(nn);
  nn^.info := ch;
  if not IsEmpty(cn^.next) then
  begin
    nn^.next := cn^.next;  
  end
  else begin
    nn^.next := nil;
  end;
  cn^.next := nn;
end;

procedure RemoveStart(var an: PElem);
var dn: PElem;
begin
  dn := an;
  an := dn^.next;
  dn^.next := nil;
  dispose(dn);
end;
procedure RemoveEnd(var an: PElem);
var pn, dn: PElem;
begin
  pn := an;
  while not IsEmpty(pn^.next^.next) do
    pn := pn^.next;
  dn := pn^.next;
  pn^.next := nil;
  dispose(dn);
end;
procedure RemoveMiddle(var an, cn: PElem);
var dn: PElem;
begin
  if not IsEmpty(cn^.next) then begin
    dn := cn^.next;
    if not IsEmpty(dn^.next) then
    begin
      cn^.next := dn^.next;
      dn^.next := nil;
    end
    else begin
      cn^.next := nil;
    end;
    dispose(dn);
  end;
end;

function GetEnd(const an: PElem): PElem;
var bn: PElem;
begin
  bn := an;
  while not IsEmpty(bn^.next) do
    bn := bn^.next;
  result := bn;
end;

function GetMiddle(const an, cn: PElem): PElem;
begin
  if not IsEmpty(cn^.next) then
    result := cn^.next;
end;

function GetInfo(const bn: PElem): TInfo;
begin
  if not IsEmpty(bn) then
    result := bn^.info;
end;

procedure MoveForward(var xn: PElem);
begin
  xn := xn^.next;
end;

function IsEmpty(const an: PElem): boolean;
begin
  result := an = nil;
end;

end.