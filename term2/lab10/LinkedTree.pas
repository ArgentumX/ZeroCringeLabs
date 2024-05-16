unit LinkedTree;

interface

uses UnitTypes;

type
  PTree = ^TTree;
  TTree = record
    info: TInfo;
    left, right, root: PTree;
  end;

procedure Init(var an: PTree; info: TInfo);
function IsEmpty(const xn: PTree): boolean;

procedure AddLeft(var xn: PTree; info: TInfo);
procedure AddRight(var xn: PTree; info: TInfo);
procedure AddRoot(var xn: PTree; info: TInfo);

procedure RemoveRight(var xn: PTree);
procedure RemoveLeft(var xn: PTree);
procedure RemoveRoot(var xn: PTree);
procedure SplitByRoot(var xn: PTree);

function GetInfo(const xn: PTree): TInfo;

procedure MoveRight(var an, xn: PTree);
procedure MoveLeft(var an, xn: PTree);
procedure MoveRoot(var an, xn: PTree);

implementation

procedure Init(var an: PTree; info: TInfo);
begin
  new(an);
  an^.info := info;
  an^.root := nil;
  an^.right := nil;
  an^.left := nil;
end;

function IsEmpty(const xn: PTree): boolean;
begin
  result := xn = nil;
end;

procedure AddLeft(var xn: PTree; info: TInfo);
var leaf: PTree;
begin
  if xn^.left = nil then begin
    new(leaf);
    leaf^.left := nil;
    leaf^.right := nil;
    leaf^.root := xn;
    leaf^.info := info;
    xn^.left := leaf;
  end;
end;
procedure AddRight(var xn: PTree; info: TInfo);
var leaf: PTree;
begin
  if xn^.right = nil then begin
    new(leaf);
    leaf^.left := nil;
    leaf^.right := nil;
    leaf^.root := xn;
    leaf^.info := info;
    xn^.right := leaf;
  end;
end;
procedure AddRoot(var xn: PTree; info: TInfo);
var root: PTree;
begin
  if xn^.root = nil then begin
    new(root);
    root^.left := xn;
    root^.right := nil;
    root^.root := nil;
    root^.info := info;
    xn^.root := root;
  end;
end;

procedure RemoveRight(var xn: PTree);
var leaf: PTree;
begin
  if ((xn <> nil) and (xn^.right <> nil) and ((xn^.right^.left = nil) and (xn^.right^.right = nil))) then begin
    leaf := xn^.right;
    xn^.right := nil;
    dispose(leaf);
  end;
end;
procedure RemoveLeft(var xn: PTree);
var leaf: PTree;
begin
  if ((xn <> nil) and (xn^.left <> nil) and ((xn^.left^.left = nil) and (xn^.left^.right = nil))) then begin
    leaf := xn^.left;
    xn^.left := nil;
    dispose(leaf);
  end;
end;

procedure RemoveAllBranch(var xn: PTree);
begin
  if xn^.left <> nil then
    RemoveAllBranch(xn^.left);
  if xn^.right <> nil then
    RemoveAllBranch(xn^.right);
  dispose(xn);
end;

procedure RemoveRoot(var xn: PTree);
var top: PTree;
begin
  if (xn^.root <> nil) then begin
    top := xn^.root;
    if (top^.root <> nil) then
      top := top^.root;
    SplitByRoot(xn);
    RemoveAllBranch(top);
  end;
end;
procedure SplitByRoot(var xn: PTree);
begin
  if xn^.root^.right = xn then
    xn^.root^.right := nil
  else
    xn^.root^.left := nil;
  xn^.root := nil;
end;

function GetInfo(const xn: PTree): TInfo;
begin
  result := xn^.info;
end;

procedure MoveRight(var an, xn: PTree);
begin
  xn := an^.right;
end;
procedure MoveLeft(var an, xn: PTree);
begin
  xn := an^.left;
end;
procedure MoveRoot(var an, xn: PTree);
begin
  xn := an^.root;
end;
  

end.
