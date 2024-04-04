unit DirectMergeSortingUnit;

interface

uses UnitTypes;

const
  MAIN_RIBBON_FILE_NAME = 'mainRibbon.txt';
  FIRST_RIBBON_FILE_NAME = 'BRibbon.txt';
  SECOND_RIBBON_FILE_NAME = 'CRibbon.txt';
  

procedure DirectMergeSort(inputFName, outputFName: String; var permutations: integer);

implementation

procedure MergeSortedRibbons(mergeSize: integer; var permutation: integer);
var
  a, b, c: TextFile;
  mergedAll, readB, readC, mergedB, mergedC: boolean;
  bValue, cValue: T;
  i, j: integer;
begin
  AssignFile(a, MAIN_RIBBON_FILE_NAME);
  AssignFile(b, FIRST_RIBBON_FILE_NAME);
  AssignFile(c, SECOND_RIBBON_FILE_NAME);
  Rewrite(a);
  Reset(b);
  Reset(c);
  mergedAll := False;
  
  while not mergedAll do begin
    
    i := 0;
    j := 0;
    readB := False;
    readC := False;
    mergedB := eof(b);
    mergedC := eof(c);
    
    while (not mergedB) or (not mergedC) do begin
      if (not readB) and (not mergedB) then begin
        readln(b, bValue);
        readB := True;
      end;
      if (not readC) and (not mergedC) then begin
        readln(c, cValue);
        readC := True;
      end;
      
      if (not mergedB) and (not mergedC) then begin
        if (bValue < cValue) then begin
          writeln(a, bValue);
          readB := False;
          i += 1;
          permutation += 1;
        end
        else begin
          writeln(a, cValue);
          readC := False;
          j += 1;
          permutation += 1;
        end;
      end
      else begin
        if (not mergedB) and mergedC then begin
          writeln(a, bValue);
          readB := False;
          i += 1;
          permutation += 1;
        end
        else begin
          writeln(a, cValue);
          readC := False;
          j += 1;
          permutation += 1;
        end;
      end;
      mergedB := (i = mergeSize) or (eof(b) and (not readB));
      mergedC := (j = mergeSize) or (eof(c) and (not readC));
    end;
    mergedAll := eof(b) and eof(c);
  end;
  
  CloseFile(a);
  CloseFile(b);
  CloseFile(c);
end;

procedure DistributeСouples(coupleSize: integer; var permutation: integer);
var 
  mainRibbon, bRibbon, cRibbon: TextFile;
  i: integer;
  distributed, coupleStage: boolean;
  currentValue: T;
begin
  AssignFile(mainRibbon, 'mainRibbon.txt');
  AssignFile(bRibbon, 'BRibbon.txt');
  AssignFile(cRibbon, 'CRibbon.txt'); 
  Reset(mainRibbon);
  Rewrite(bRibbon);
  Rewrite(cRibbon);
  distributed := false;
  coupleStage := false;
  while (not distributed) do
  begin
    i := 1;
    while (i <= coupleSize) and (not distributed) do begin
      if (not eof(mainRibbon)) then begin
        readln(mainRibbon, currentValue);
        if (not coupleStage) then begin
          writeln(bRibbon, currentValue);
          permutation += 1;
        end
        else begin
          writeln(cRibbon, currentValue); 
          permutation += 1;
        end;
        if (i = coupleSize) then
          coupleStage := not coupleStage;
      end
      else begin
        distributed := true;
      end;
      i += 1;
    end;
  end;
  CloseFile(mainRibbon);
  CloseFile(bRibbon);
  CloseFile(cRibbon);
end;

procedure CopyFileRibbon(var fin, fout: TextFile; var rowAmount: integer; ignoreFirst: boolean);
var
  currentValue: T;
begin
  rowAmount := 0;
  Reset(fin);
  Rewrite(fout);
  if ignoreFirst then
    readln(fin);
  while not eof(fin) do begin
    readln(fin, currentValue);
    writeln(fout, currentValue);
    rowAmount += 1;
  end;
end;

procedure DirectMergeSort(inputFName, outputFName: String; var permutations: integer);
var
  fin, fout, mainRibbon, bRibbon, cRibbon: TextFile; 
  coupleSize, rowAmount: integer;
begin
  permutations := 0;
  AssignFile(fin, inputFName);
  AssignFile(mainRibbon, MAIN_RIBBON_FILE_NAME);
  CopyFileRibbon(fin, mainRibbon, rowAmount, True);
  CloseFile(fin);
  CloseFile(mainRibbon);
  coupleSize := 1;
  while (coupleSize <= round(exp((trunc(log(rowAmount) / log(2))) * log(2)))) do begin
    DistributeСouples(coupleSize, permutations);
    MergeSortedRibbons(coupleSize, permutations);
    coupleSize *= 2;
  end;
  AssignFile(fout, outputFName);
  AssignFile(mainRibbon, MAIN_RIBBON_FILE_NAME);
  Rewrite(fout);
  CopyFileRibbon(mainRibbon, fout, rowAmount, False);
  CloseFile(fout);
  CloseFile(mainRibbon);
end;

end.