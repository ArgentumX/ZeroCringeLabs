program lab10;

uses UnitTypes, LinkedTree;

var
  fin, fout: TextFile;
  tree: PTree;

function filter1(x: TInfo): boolean;
begin
  result := x = 'S';
end;
procedure ReadTreeCore(var f: TextFile; var an: PTree);
var 
  ch: TInfo;
  l, r: PTree;
begin
  if not(eof(f)) then begin
    read(f, ch);
    if ch <> '*' then begin
      AddLeft(an, ch);
      MoveLeft(an, l);
      ReadTreeCore(fin, l);
    end;
  end;
  if not(eof(f)) then begin
    read(f, ch);
    if ch <> '*' then begin
      AddRight(an, ch);
      MoveRight(an, r);
      ReadTreeCore(fin, r);
    end;
  end;
end;

procedure ReadTree(var fin: TextFile; var an: PTree);
var info: TInfo;
begin
  if not(eof(fin)) then begin
    read(fin, info);
    if info <> '*' then begin
      Init(an, info);
      ReadTreeCore(fin, an);
    end;
  end;
end;
  
procedure PrintTree(var fout: TextFile; var an: PTree);
var 
  info: TInfo;
  l, r: PTree;
begin
  if not IsEmpty(an) then begin
    MoveLeft(an, l);
    PrintTree(fout, l);
    info := GetInfo(an);
    write(fout, info);
    MoveRight(an, r);
    PrintTree(fout, r);
  end;
end;

function GetAmountByCondition(var an: PTree; f: filterFunc): integer;
var 
  info: TInfo;
  l, r: PTree;
begin
  result := 0;
  if not IsEmpty(an) then begin
    info := GetInfo(an);
    if f(info) then 
      result += 1;
    MoveLeft(an, l);
    MoveRight(an, r);
    result += GetAmountByCondition(l, f) + GetAmountByCondition(r, f);
  end;
end;

{function GetAmountByCondition(var an: PTree; f: filterFunc; index: integer): integer;
var 
  info: TInfo;
  lIndex, rIndex: integer;
begin
  lIndex := index;
  rIndex := index;
  result := 0;
  if not IsEmpty(an, index) then begin
    info := GetInfo(an, index);
    if f(info) then 
      result += 1;
    MoveLeft(an, lIndex);
    MoveRight(an, rIndex);
    result += GetAmountByCondition(an, f, lIndex) + GetAmountByCondition(an, f, rIndex);
  end;
end;

procedure PrintTree(var fout: TextFile; var an: PTree; index: integer);
var 
  info: TInfo;
  lIndex, rIndex: integer;
begin
  lIndex := index;
  rIndex := index;
  if not IsEmpty(an, index) then begin
    MoveLeft(an, lIndex);
    PrintTree(fout, an, lIndex);
    info := GetInfo(an, index);
    write(fout, info);
    MoveRight(an, rIndex);
    PrintTree(fout, an, rIndex);
  end;
end;

procedure ReadTree(var fin: TextFile; var an: PTree);
var 
  ch: TInfo;
  index: integer;
begin
  index := 0;
  read(fin, ch);
  Init(an, ch);
  while not eof(fin) do begin
    index += 1;
    read(fin, ch);
    if an.l <= 1 then begin
      SetLength(an.x, an.n + an.l + 10);
      an.l += 10;
    end;
    an.x[index] := ch;
    tree.n += 1;
    tree.l -= 1;
  end;
end;}



begin
  
  AssignFile(fin, 'input.txt');
  reset(fin);
  AssignFile(fout, 'output.txt');
  append(fout);
  
  ReadTree(fin, tree);
  writeln(fout);
  PrintTree(fout, tree);
  writeln(fout);
  writeln(fout, 'elements by condition: ', GetAmountByCondition(tree, filter1));
  CloseFile(fin);
  CloseFile(fout);
  
  {ReadTree(fin, tree);
  writeln(fout);
  PrintTree(fout, tree, 0);
  writeln(fout);
  writeln(fout, 'elements by condition: ', GetAmountByCondition(tree, filter1, 0));
  CloseFile(fin);
  CloseFile(fout);}
end.