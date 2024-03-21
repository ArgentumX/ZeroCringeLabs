Program main;

uses UnitTypes, RecFunctionsUnit;

var
  f: TextFile;
  vect: vector;
  k, m: integer;

procedure ReadVector(var fin: TextFile; var vect: vector; var m: integer);
var i: integer;
begin
  readln(fin, m);
  SetLength(vect, m);
  for i := 0 to m-1 do begin
    read(fin, vect[i]);
  end;
end;

function ContainsSpElement(const vect: vector; const m: integer; const k: real): boolean;
var 
  i: integer;
  flag: boolean;
begin
  i := 0;
  flag := False;
  while (not flag) and (i < m) do begin
    if (Abs(vect[i]) > k) then begin
      flag := True;
    end;
    i += 1;
  end;
  result := flag;
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
      { Reading data }
      AssignFile(f, ParamStr(1));
      Reset(f);
      readln(f, k);
      ReadVector(f, vect, m);
      CloseFile(f);
      
      { Handling vectors }
      AssignFile(f, ParamStr(2));
      Append(f);
      writeln(f, '');
      writeln(f, '{ New start ', ParamStr(1), ' }');
      writeln(f, 'input: k ', k, ' vector ', vect);
      if (ContainsSpElement(vect, m, k)) then begin
        writeln(f, 'Минимальный элемент по условию ', GetMinSpKaskade(vect, m));
      end
      else begin
        writeln(f, 'Строка не удовлетворяет условию');
      end;
      CloseFile(f);
    end;
  end;

end.