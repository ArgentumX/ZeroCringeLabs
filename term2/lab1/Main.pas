program Main;

uses UnitCharArraySet, UnitLogger;

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

function ToString(const x: TCharSet): String;
var
  res: String;
  i: Integer;
begin
  res := '[';
  for i := ord('0') to ord('z') do
  begin
    if Contains(x, chr(i)) then
    begin
      res += ' ' + chr(i);
    end;
  end;
  res += ' ]';
  ToString := res;
end;

procedure Union(const x1, x2: TCharSet; var z: TCharSet);
var 
  i: Integer;
begin
  Log('start new union operation', '');
  Init(z);
  for i := ord('0') to ord('z') do
  begin
    if (Contains(x1, chr(i)) or Contains(x2, chr(i))) then
    begin
      Log('union add: ', chr(i));
      Add(z, chr(i));
    end;
  end;
end;

procedure Intersection(const x1, x2: TCharSet; var z: TCharSet);
var 
  i: Integer;
begin
  Log('start new intersection operation', '');
  Init(z);
  for i := ord('0') to ord('z') do
  begin
    if (Contains(x1, chr(i)) and Contains(x2, chr(i))) then
    begin
      Log('intersection add: ', chr(i));
      Add(z, chr(i));
    end;
  end;
end;

procedure Difference(const x1, x2: TCharSet; var z: TCharSet);
var 
  i: Integer;
begin
  Log('start new difference operation', '');
  Init(z);
  for i := ord('0') to ord('z') do
  begin
    if (Contains(x1, chr(i)) and not Contains(x2, chr(i))) then
    begin
      Log('difference add: ', chr(i));
      Add(z, chr(i));
    end;
  end;
end;

var
  A, B, C: TCharSet;
  Z1, Z2, Z3: TCharSet;
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
      Union(A, B, Z1);
      writeln(f, 'Union:', ToString(Z1));
      
      Intersection(A, B, Z1);
      writeln(f, 'Intersection:', ToString(Z1));
      
      Difference(A, B, Z1);
      Difference(C, A, Z2);
      Union(Z1, Z2, Z3);
      writeln(f, 'Difference:', ToString(Z1));
      writeln(f, 'Custom:', ToString(Z3));
      CloseFile(f);
    end;
  end;

end.