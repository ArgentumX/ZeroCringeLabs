program Main;

uses MD5HashUnit;

var
  f: TextFile;
  n: integer;
  arr: array of String;

procedure CopyArray(const fromArr: array of String; var toArr: Array of String; const n: integer);
var i: integer;
begin
  SetLength(toArr, n);
  for i := 0 to n -1 do begin
    toArr[i] := fromArr[i];
  end;
end;

function equals(const s1, s2: String): boolean;
begin
  result := Hash(s1) = Hash(s2);
end;

function GetRepeatAmount(const base: array of String; const n: integer): integer;
var 
  i, j, currentHash: integer;
  arr: array of String;
begin
  CopyArray(base, arr, n);
  result := 0;
  for i := 0 to n - 1 do begin
  if (arr[i] <> '') then begin
    currentHash := Hash(arr[i]);
    for j := i + 1 to n - 1 do begin
        if (Hash(arr[j]) = currentHash) then
        begin
          arr[j] := '';
          result += 1;
        end
      end;
    end;
  end;
end;

function GetCollisionAmount(const base: array of String; const n: integer): integer;
var 
  i, j, currentHash: integer;
  arr: array of String;
begin
  CopyArray(base, arr, n);
  result := 0;
  for i := 0 to n - 1 do begin
  if (arr[i] <> '') then begin
    currentHash := Hash(arr[i]);
    for j := i + 1 to n - 1 do begin
        if (Hash(arr[j]) = currentHash) and (arr[j] <> arr[i]) then
        begin
            arr[j] := '';
            result += 1;
        end;
      end;
    end;
  end;
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
      AssignFile(f, ParamStr(1));
      Reset(f);
      n := 0;
      while not eof(f) do begin
        SetLength(arr, n+1);
        readln(f, arr[n]);
        n += 1;
      end;
      CloseFile(f);
      
      AssignFile(f, ParamStr(2));
      Append(f);
      writeln(f, 'Исследуемый массив: ', arr);
      writeln(f, HASH_FUNCTION_NAME, ' Количество повторов: ', GetRepeatAmount(arr, n));
      writeln(f, HASH_FUNCTION_NAME, ' Количество коллизий: ', GetCollisionAmount(arr, n));
      writeln(f, '');
      CloseFile(f);
      
    end;
  end;
end.