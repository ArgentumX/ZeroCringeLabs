unit UnitTypes;

interface

type
  T = string;
  vector = array of T;
  matrix = array of vector;
  externalSortProc = procedure(s1, s2: string; var permutation: integer);
  internalSortProc = procedure(var arr: vector; const m: integer; var permutations: integer);
implementation

end.
