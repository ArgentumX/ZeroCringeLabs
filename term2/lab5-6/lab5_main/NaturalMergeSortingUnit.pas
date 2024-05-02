unit NaturalMergeSortingUnit;

interface

uses UnitTypes;

const
  MAIN_RIBBON_FILE_NAME = 'mainRibbon.txt';
  FIRST_RIBBON_FILE_NAME = 'BRibbon.txt';
  SECOND_RIBBON_FILE_NAME = 'CRibbon.txt';
  
procedure NaturalMergeSort(inputFName, outputFName: String; var permutation: integer);

implementation


procedure DistributeSubsequences(var coupleAmount, permutation: integer);
var 
  a, b, c: TextFile;
  stage: boolean;
  oldVal, val: T;
begin
  AssignFile(a, MAIN_RIBBON_FILE_NAME);
  AssignFile(b, FIRST_RIBBON_FILE_NAME);
  AssignFile(c, SECOND_RIBBON_FILE_NAME);
  Reset(a);
  Rewrite(b);
  Rewrite(c);
  stage := True;
  coupleAmount := 1;
  readln(a, val);
  writeln(b, val);
  while (not eof(a)) do begin
    oldVal := val;
    readln(a, val);
    if (oldVal > val) then begin
      stage := not stage;
      coupleAmount += 1;
    end;
    if stage then begin
      writeln(b, val);
    end
    else begin
      writeln(c, val);
    end;
  end;
  
  CloseFile(a);
  CloseFile(b);
  CloseFile(c);
end;

procedure MergeSortedRibbons(var permutation: integer);
var
  a, b, c: TextFile;
  mergedAll, mergedB, mergedC, readB, readC: boolean;
  oldBVal, bVal, oldCVal, cVal: T;
begin
  AssignFile(a, MAIN_RIBBON_FILE_NAME);
  AssignFile(b, FIRST_RIBBON_FILE_NAME);
  AssignFile(c, SECOND_RIBBON_FILE_NAME);
  Rewrite(a);
  Reset(b);
  Reset(c);
  
  
  readln(b, bVal);
  readln(c, cVal);
  readB := False;
  readC := False;
  if (bVal < cVal) then begin
    writeln(a, bVal);
    writeln(a, cVal);
    permutation += 1;
  end
  else begin
    writeln(a, cVal);
    writeln(a, bVal);
    permutation += 1;
  end;
  mergedAll := False;
  mergedB := False;
  mergedC := False;
  
  
  while not mergedAll do begin
    mergedB := eof(b);
    mergedC := eof(c);
    
    while (not mergedB) or (not mergedC) do begin
      
      if (not readB) and (not mergedB) then begin
        oldBVal := bVal;
        readln(b, bVal);
        mergedB := bVal < oldBVal;
        readB := True;
      end;
      if (not readC) and (not mergedC) then begin
        readln(c, cVal);
        mergedC := cVal < oldCVal;
        readC := True;
      end;
      
      if (not mergedB) and (not mergedC) then begin
        if (bVal < cVal) then begin
          writeln(a, bVal);
          readB := False;
          permutation += 1;
        end
        else begin
          writeln(a, cVal);
          readC := False;
          permutation += 1;
        end;
      end
      else begin
        if (not mergedB) and mergedC then begin
          writeln(a, bVal);
          readB := False;
          permutation += 1;
        end
        else begin
          if (not mergedC) and mergedB then begin
            writeln(a, cVal);
            readC := False;
            permutation += 1;
          end;
        end;
      end;
      mergedB := mergedB or (eof(b) and (not readB));
      mergedC := mergedC or (eof(c) and (not readC));
    end;
    mergedAll := eof(b) and eof(c);
  end;
  CloseFile(a);
  CloseFile(b);
  CloseFile(c);
end;

procedure CopyFileRibbon(var fin, fout: TextFile; ignoreFirst: boolean);
var
  currentValue: T;
begin
  Reset(fin);
  Rewrite(fout);
  if ignoreFirst then
    readln(fin);
  while not eof(fin) do begin
    readln(fin, currentValue);
    writeln(fout, currentValue);
  end;
end;

procedure NaturalMergeSort(inputFName, outputFName: String; var permutation: integer);
var 
  coupleAmount: integer;
  completedSortFlag: boolean;
  fin, fout, mainRibbon, bRibbon, cRibbon: TextFile; 
  coupleSize, rowAmount: integer;
begin
  permutation := 0;
  AssignFile(fin, inputFName);
  AssignFile(mainRibbon, MAIN_RIBBON_FILE_NAME);
  CopyFileRibbon(fin, mainRibbon, True);
  CloseFile(fin);
  CloseFile(mainRibbon);
  
  completedSortFlag := false;
  while (not completedSortFlag) do begin
    DistributeSubsequences(coupleAmount, permutation);
    completedSortFlag := coupleAmount = 1;
    if (not completedSortFlag) then
      MergeSortedRibbons(permutation);
  end;
  
  DistributeSubsequences(coupleAmount, permutation);
  if (coupleAmount > 1) then
    MergeSortedRibbons(permutation);
  
  AssignFile(fout, outputFName);
  AssignFile(mainRibbon, MAIN_RIBBON_FILE_NAME);
  Rewrite(fout);
  CopyFileRibbon(mainRibbon, fout, False);
  CloseFile(fout);
  CloseFile(mainRibbon);
end;

end.