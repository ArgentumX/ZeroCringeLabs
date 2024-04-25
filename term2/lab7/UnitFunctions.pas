unit UnitFunctions;

interface

uses UnitTypes;

function GetMidMark(student: Tstud): real;
function SortAge(x1, x2: Tstud): integer;
function SortFullName(x1, x2: Tstud): integer;
function SortHard(x1, x2: Tstud): boolean;
function filter(student: Tstud): boolean;

implementation

function GetMidMark(student: Tstud): real;
begin
  result := (student.marks[1] + student.marks[2] + student.marks[3]) / 3;
end;

function SortAge(x1, x2: Tstud): integer;
begin
  if (x1.born < x2.born) then begin
    result := 1;
  end
  else if (x1.born > x2.born) then begin
    result := -1
  end
  else 
    result := 0;
end;

function SortFullName(x1, x2: Tstud): integer;
begin
  if (x1.fullname > x2.fullname) then
  begin
    result := 1;
  end
  else if (x1.fullname < x2.fullname) then begin
    result := -1
  end
  else 
    result := 0;
end;

function SortHard(x1, x2: Tstud): boolean;
var g: integer;
begin
  g := SortAge(x1, x2);
  if (SortAge(x1, x2) <> 0) then begin
    result := g = 1
  end
  else 
    result := SortFullName(x1, x2) > 0;
end;

function filter(student: Tstud): boolean;
begin
  result := (student.sex = 'F') and (2024 - student.born > 20);
end;

end.