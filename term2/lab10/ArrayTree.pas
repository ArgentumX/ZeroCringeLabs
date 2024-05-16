unit ArrayTree;

interface

uses UnitTypes;

type
  PTree = record 
    x: array of TInfo;
    n, l: integer;
  end;
  
procedure Init(var tree: PTree; ch: TInfo);
function IsEmpty(const tree: PTree; index: integer): boolean;

procedure AddLeft(var tree: PTree; ch: TInfo; index: integer);
procedure AddRight(var tree: PTree; ch: TInfo; index: integer);
procedure AddRoot(var tree: PTree; ch: TInfo; index: integer);

procedure RemoveRight(var tree: PTree; index: integer);
procedure RemoveLeft(var tree: PTree; index: integer);

function GetInfo(const tree: PTree; index: integer): TInfo;

procedure MoveRight(var tree: PTree; var index: integer);
procedure MoveLeft(var tree: PTree; var index: integer);

implementation

procedure writerr(var an: PTree);
var i: integer;
begin
  for i := 0 to an.n-1 do begin
    writeln(i, ' ', an.x[i]);
  end; 
end;

procedure AddMemoryAfter(var tree: PTree);
begin
  SetLength(tree.x, tree.n + tree.l + 10);
  tree.l += 10;
end;
procedure MoveElementsForward(var tree: PTree; fromIndex, step: integer);
var i: integer;
begin
  if (tree.l <= step) then
    AddMemoryAfter(tree);
  for i := tree.n - 1 downto fromIndex do begin
    tree.x[i+step] := tree.x[i];
  end;
end;
procedure MoveElementsDownto(var tree: PTree; fromIndex, step: integer);
var i: integer;
begin
  for i := fromIndex to tree.n - 1 do begin
    tree.x[i + step] := tree.x[i];
  end;
end;
procedure Init(var tree: PTree; ch: TInfo);
begin
  tree.n := 3;
  tree.l := 0;
  AddMemoryAfter(tree);
  tree.x[0] := ch;
  tree.x[1] := '*';
  tree.x[2] := '*';
end;
function IsEmpty(const tree: PTree; index: integer): boolean;
begin
  result := (tree.x[index] = '*') or (tree.x[index] = '');
end;

procedure AddLeft(var tree: PTree; ch: TInfo; index: integer);
begin
  if IsEmpty(tree, index+2) then begin
    MoveElementsForward(tree, index+2, 2);
    tree.x[index+1] := ch;
    tree.x[index+2] := '*';
    tree.x[index+3] := '*';
    tree.n += 2;
    tree.l -= 2;
  end;
  writerr(tree);
end;
procedure AddRight(var tree: PTree; ch: TInfo; index: integer);
begin
  if IsEmpty(tree, index+3) then begin
    MoveElementsForward(tree, index+3, 2);
    tree.x[index+2] := ch;
    tree.x[index+3] := '*';
    tree.x[index+4] := '*';
    tree.n += 2;
    tree.l -= 2;
  end;
  writerr(tree);
end;
procedure AddRoot(var tree: PTree; ch: TInfo; index: integer);
begin
  MoveElementsForward(tree, index, 2);
  tree.x[index] := ch;
  tree.x[index+1] := '*';
  tree.n += 2;
  tree.l -= 2;
end;

procedure RemoveRight(var tree: PTree; index: integer);
var 
  endedStructure: boolean;
  chars, empts, oldrIndex, rIndex: integer;
begin
  rIndex := index;
  MoveRight(tree, rIndex);
  oldrIndex := rIndex;
  if not IsEmpty(tree, rIndex) then begin
    endedStructure := false;
    chars := 0;
    empts := 0;
    while not endedStructure do begin
      rIndex += 1;
      if not IsEmpty(tree, rIndex) then
        chars += 1
      else
        empts += 1;
      
      if chars + 1 = empts then
        endedStructure := true;
    end;
    rIndex += 1;
  end;
  tree.x[oldrIndex] := '*';
  tree.n -= rIndex-1-oldrIndex;
  tree.l += rIndex-1-oldrIndex;
  MoveElementsDownto(tree, oldrIndex+1, -(rIndex-1-oldrIndex));
end;
procedure RemoveLeft(var tree: PTree; index: integer);
var rIndex: integer;
begin
  rIndex := index;
  MoveRight(tree, rIndex);
  tree.x[index+1] := '*';
  tree.n -= rIndex-2-index;
  tree.l += rIndex-2-index;
  MoveElementsDownto(tree, index+2, -(rIndex-2-index));
end;

function GetInfo(const tree: PTree; index: integer): TInfo;
begin
  result := tree.x[index];
end;

procedure MoveRight(var tree: PTree; var index: integer);
var 
  endedStructure: boolean;
  chars, empts: integer;
begin
  if not IsEmpty(tree, index) then begin
    endedStructure := false;
    chars := 0;
    empts := 0;
    while not endedStructure do begin
      index += 1;
      if not IsEmpty(tree, index) then
        chars += 1
      else
        empts += 1;
      
      if chars + 1 = empts then
        endedStructure := true;
    end;
    index += 1;
  end;
end;

procedure MoveLeft(var tree: PTree; var index: integer);
begin
  if not IsEmpty(tree, index) then
    index += 1;
end;
end.