program Main;

uses UnitStandartSet;

procedure ReadSet(var fin: TextFile; var X: TCharSet);
var ch: Char;
begin
    Init(X);
    while not eoln(fin) do
    begin
      read(fin, ch);
      Add(X, ch);
    end;
    readln(fin);
end;

var
  A, B, C: TCharSet;
  f: TextFile;
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
      { Reading of sets }
      AssignFile(f, ParamStr(1));
      Reset(f);
      ReadSet(f, A);
      ReadSet(f, B);
      ReadSet(f, C);
      CloseFile(f);
      
      { Calculating and saving of results}
      AssignFile(f, ParamStr(2));
      Rewrite(f);
      writeln(f, 'Union:', ToString(Union(A, B)));
      writeln(f, 'Intersection:', ToString(Intersection(A, B)));
      writeln(f, 'Difference:', ToString(Difference(A, B)));
      writeln(f, 'Custom:', ToString(Union(Difference(A, B), Difference(C, A))));
      CloseFile(f);
    end;
  end;

end.