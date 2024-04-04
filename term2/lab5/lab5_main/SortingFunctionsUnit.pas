unit SortingFunctionsUnit;

interface

uses UnitTypes;

procedure BubbleSort(var arr: vector; const m: integer; var permutations: integer);
procedure ChoiceSort(var arr: vector; const m: integer; var permutations: integer);
procedure IncludeSort(var arr: vector; const m: integer; var permutations: integer);
procedure QuickSort(var arr: vector; const m: integer; var permutations: integer);

implementation

function compare(const x1, x2: Real): boolean;
begin
  result := x1 > x2;
end;

function compare(const x1, x2: string): boolean;
begin
  result := x1 > x2;
end;

function FindMaxIndex(const arr: array of real; const m: integer): integer;
var
  max: real;
begin
  result := 0;
  max := arr[0];
  for var i := 0 to m - 1 do
    if arr[i] > max then
    begin
      max := arr[i];
      result := i;
    end;
end;

function FindMaxIndex(const arr: array of string; const m: integer): integer;
var
  max: string;
begin
  result := 0;
  max := arr[0];
  for var i := 0 to m - 1 do
    if arr[i] > max then
    begin
      max := arr[i];
      result := i;
    end;
end;

procedure BubbleSort(var arr: vector; const m: integer; var permutations: integer);
var 
  ordered: boolean;
  i, j: integer;
begin
  permutations := 0;
  ordered := False;
  i := 0;
  while (i <= m - 2) and (not ordered) do begin
    ordered := True;
    for j := 0 to m - i - 2 do begin
      if (compare(arr[j], arr[j+1])) then begin
        swap(arr[j], arr[j+1]);
        permutations += 1;
        ordered := False;
      end;
    end;
    i += 1;
  end;
end;

procedure ChoiceSort(var arr: vector; const m: integer; var permutations: integer);
var
  idMax, j: integer;
begin
  permutations := 0;
  for j := m - 1 downto 1 do
  begin
    idMax := FindMaxIndex(arr, j+1);
    if not (idMax = j) then begin
      Swap(arr[idMax], arr[j]);
      permutations += 1;
      end;
  end;
end;

procedure IncludeSort(var arr: vector; const m: integer; var permutations: integer);
var 
  i, j: integer;
  included: boolean;
begin
  permutations := 0;
  for i := 0 to m - 2 do begin
    j := i + 1;
    included := False;
    while (not included) and (j >= 1) do begin
      if (arr[j] < arr[j - 1]) then begin
        swap(arr[j], arr[j-1]);
        permutations += 1;
      end
      else 
        included := True;
      j -= 1;
    end;
  end;
end;

procedure QuickSortCore(var arr: vector; n, m: integer; var permutations: integer);
var mid, i, j: integer;
begin
  if (n < m) then
  begin
    i := n;
    j := m;
    mid := (n + m) div 2;
    while (i <= j) do begin
      while arr[i] < arr[mid] do
        i += 1;
      while arr[j] > arr[mid] do
        j -= 1;
      if (i <= j) then
      begin
        permutations += 1;
        swap(arr[i], arr[j]);
        i := i + 1;
        j := j - 1;
      end;
    end;
    if n < j then
      QuickSortCore(arr, n, j, permutations);
    if i < m then
      QuickSortCore(arr, i, m, permutations);
  end;
end;

procedure QuickSort(var arr: vector; const m: integer; var permutations: integer);
begin
  permutations := 0;
  QuickSortCore(arr, 0, m-1, permutations);
end;

end.