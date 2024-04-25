program lab7_main;

uses UnitTypes, UnitFunctions;


var
  inputMas, outputMas: Tmas;
  sSet, fSet: set of string;
  f: TextFile;
  stud: Tstud;
  n, i: integer;
  
procedure ReadDataFromText(var fin: TextFile; var mas: Tmas);
var
  student: Tstud;
  k, error_code: integer;
  splited: array of String;
  s: String;

begin  
  reset(fin);
  k := 0;
  while not (eof(fin)) do
  begin
    read(fin, s);
    splited := s.split(',');
    student.group := splited[0];
    student.fullname := splited[1];
    val(splited[2], student.born, error_code);
    student.sex := splited[3][1];
    val(splited[4], student.marks[1], error_code);
    val(splited[5], student.marks[2], error_code);
    val(splited[6], student.marks[3], error_code);
    val(splited[7], student.stipend, error_code);
    k:=k+1;
    SetLength(mas, k);
    mas[k-1]:=student;
    readln(fin)
  end;
  close(fin);
end;

procedure WriteData(var fout: TextFile; const mas: Tmas);
var
  stud1: Tstud;
  i: integer;
begin
  for i := 0 to High(mas) do begin
    writeln(fout, mas[i].fullname, ',', mas[i].born, ',', GetMidMark(mas[i]));
  end;
  {foreach stud1 in mas do begin
    writeln(fout, stud1.fullname, ',', stud1.born, ',', GetMidMark(stud1));
  end;}
  close(fout);
end;

function GetName(const stud: Tstud): string;
begin
  result := stud.fullname.Split(' ')[1];
end;

function ContainsName(const namesSet: set of string; name: string): boolean;
begin
  result := name in namesSet;
end;

procedure formFilterSets(const student: Tstud; var startSet, finalSet: set of string);
var 
  name: String;
begin
  name := GetName(student);
  if ContainsName(startSet, name) then begin
    finalSet += [name];
  end
  else
  begin
    startSet += [name];
  end;
end;

function filter3(const student: Tstud; var finalSet: set of string): boolean;
begin
  result := GetName(student) in finalSet;
end;

procedure CustomStudentsSort(var arr: Tmas; const m: integer; f: compareFunc);
var 
  ordered: boolean;
  i, j: integer;
begin
  ordered := False;
  i := 0;
  while (i <= m - 2) and (not ordered) do begin
    ordered := True;
    for j := 0 to m - i - 2 do begin
      if (f(arr[j], arr[j+1])) then begin
        swap(arr[j], arr[j+1]);
        ordered := False;
      end;
    end;
    i += 1;
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
        ReadDataFromText(f, inputMas);
        sSet := [];
        fSet := [];
        foreach stud in inputMas do begin
          formFilterSets(stud, sSet, fSet)
        end;
        n := 0;
        foreach stud in inputMas do begin
          if filter3(stud, fSet) then begin
            n += 1;
            SetLength(outputMas, n);
            outputMas[n-1] := stud;
          end;  
        end;
        CustomStudentsSort(outputMas, n, SortHard);
        AssignFile(f, ParamStr(2));
        Append(f);
        writeln(f);
        writeln(f, 'New start');
        WriteData(f, outputMas);
      end;
    end;
end.