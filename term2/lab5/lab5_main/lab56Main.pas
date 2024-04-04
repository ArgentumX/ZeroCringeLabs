program lab56Main;

uses UnitTypes, SortingFunctionsUnit, Utils, NaturalMergeSortingUnit, DirectMergeSortingUnit;

const
  EXTERNAL_FOUT = 'external_sorted.txt';
  EXTERNAL_SORTS: array[1..2] of externalSortProc = (NaturalMergeSort, DirectMergeSort);
  INTERNAL_SORTS: array[1..4] of internalSortProc = (BubbleSort, ChoiceSort, IncludeSort, QuickSort);

procedure ReadArray(var f: TextFile; var arr: vector; var m: integer);
var i: integer;
begin
  readln(f, m);
  SetLength(arr, m);
  for i := 0 to m - 1 do begin
    readln(f, arr[i]);
  end;
end;

procedure TestInternalSorts(inputFName, outputFName: String);
var
  fin, f: TextFile;
  arr: vector;
  permutations, m, startTime, endTime: integer;
  sort: internalSortProc;
begin
    
    { Handling arrays }
    AssignFile(f, outputFName);
    Append(f);
    foreach sort in INTERNAL_SORTS do begin
      AssignFile(fin, inputFName);
      Reset(fin);
      ReadArray(fin, arr, m);
      CloseFile(fin);
      
      writeln(f, '');
      writeln(f, '{ New start ', inputFName,' ', sort.Method.Name ,' }');
      writeln(f, 'input array: ', arr);
      startTime := Milliseconds;
      sort(arr, m, permutations);
      endTime := Milliseconds;
      writeln(f, 'sorted array: ', arr);
      writeln(f, 'array size: ', m);
      writeln(f, 'permutations: ', permutations);
      writeln(f, 'time in ms: ', endTime - startTime);
    end;
    
    
    CloseFile(f);
end;

procedure TestExternalSorts(inputFName, outputFName: String);
var
  fin, f: TextFile;
  permutations, startTime, endTime: integer;
  sort: externalSortProc;
begin
  AssignFile(f, outputFName);
  Append(f);
  foreach sort in EXTERNAL_SORTS do begin
    writeln(f, '');
    writeln(f, '{ New start ', inputFName,' ', sort.Method.Name ,' }');
    startTime := Milliseconds;
    sort(inputFName, EXTERNAL_FOUT, permutations);
    endTime := Milliseconds;
    writeln(f, 'permutations: ', permutations);
    writeln(f, 'time in ms: ', endTime - startTime);
  end;
  CloseFile(f);
end;

begin
  if ParamCount < 2 then begin
      writeln('Недостаточно параметров!');
    end
  else
    begin
      if not FileExists(ParamStr(1)) then
      begin
        writeln('Невозможно открыть файл ''', ParamStr(1), ''' для чтения')
      end
      else
      begin
        TestInternalSorts(ParamStr(1), ParamStr(2));
        TestExternalSorts(ParamStr(1), ParamStr(2));
      end;
    end;
end.