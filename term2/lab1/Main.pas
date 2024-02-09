program Main;

uses UnitBooleanArraySet;
var
  A, B, C, R: TCharSet;
  fin, fout: TextFile;
  ch: Char;
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
      AssignFile(fin, ParamStr(1));
      Reset(fin);
      AssignFile(fout, ParamStr(2));
      Rewrite(fout);
      
      { Reading of sets }
      Init(A);
      while not eoln(fin) do
      begin
        read(fin, ch);
        Add(A, ch);
      end;
      readln(fin);
      Init(B);
      while not eoln(fin) do
      begin
        read(fin, ch);
        Add(B, ch);
      end;
      readln(fin);
      Init(C);
      while not eoln(fin) do
      begin
        read(fin, ch);
        Add(C, ch);
      end;
      CloseFile(fin);
      
      { Calculating and saving of results}
      R := Union(A, B);
      writeln(fout, 'Union:', ToString(R));
      R := Intersection(A, B);
      writeln(fout, 'Intersection:', ToString(R));
      R := Difference(A, B);
      writeln(fout, 'Difference:', ToString(R));
      R := Union(Difference(A, B), Difference(C, A));
      writeln(fout, 'Custom:', ToString(R));
      CloseFile(fout);
    end;
  end;

end.