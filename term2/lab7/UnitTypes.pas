unit UnitTypes;

interface

type
  Tstud = Record
    group: string[10];
    fullname: string[40];
    born: integer;
    sex: char;
    marks: array[1..3] of integer;
    stipend: integer;
  end;
  Tmas = array of Tstud;
  compareFunc = function(x1, x2: Tstud): boolean;
  filterFunc = function(x: Tstud): boolean;
implementation

end.
