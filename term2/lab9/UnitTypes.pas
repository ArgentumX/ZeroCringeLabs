unit UnitTypes;

interface

type
  T = real;
  TInfo = record
    val: T;
  end;
  filterFunc = function(x: TInfo): boolean;
  
implementation

end.