program lab7_main;

uses UnitTypes, UnitFunctions;


var
  inputMas, outputMas: file of Tstud;
  f: TextFile;
  stud: Tstud;
  n: integer;
  
procedure ReadDataFromText(var fin: TextFile; var mas: file of Tstud);
var
  student: Tstud;
  k, error_code: integer;
  splited: array of String;
  s: String;

begin  
  reset(fin);
  rewrite(mas);
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
    write(mas, student);
    readln(fin)
  end;
  close(fin);
end;

procedure WriteData(var fout: TextFile; const mas: file of Tstud);
var
  student: Tstud;
begin
  reset(mas);
  while not eof(mas) do begin
    read(mas, student);
    writeln(fout, student.fullname, ',', student.born, ',', GetMidMark(student));
  end;
  close(mas);
  close(fout);
end;

procedure CustomSwap(var typed: file of Tstud; i, j: integer);
var 
  x, y: Tstud;
begin
  
  Seek(typed, i);
  read(typed, x);
  Seek(typed, j);
  read(typed, y);
  Seek(typed, j);
  write(typed, x);
  Seek(typed, i);
  write(typed, y);
end;

procedure GetStudent(var typed: file of Tstud; i: integer; var stud: Tstud);
begin
  Seek(typed, i);
  read(typed, stud);
end;

procedure CustomStudentsSort(var arr: file of Tstud; const m: integer; f: compareFunc);
var 
  ordered: boolean;
  i, j: integer;
  stud1, stud2: Tstud;
begin
  ordered := False;
  i := 0;
  while (i <= m - 2) and (not ordered) do begin
    ordered := True;
    for j := 0 to m - i - 2 do begin
    GetStudent(arr, j, stud1);
    GetStudent(arr, j+1, stud2);
    
      if (f(stud1, stud2)) then begin
        CustomSwap(arr, j, j+1);
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
        assign(inputMas, 'start.txt');
        assign(outputMas, 'filtered.txt');
        ReadDataFromText(f, inputMas);
        n := 0;
        reset(inputMas);
        rewrite(outputMas);
        while not eof(inputMas) do begin
          read(inputMas, stud);
          if filter(stud) then
          begin
            n += 1;
            write(outputMas, stud)
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