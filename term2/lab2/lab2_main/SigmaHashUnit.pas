unit SigmaHashUnit;

interface

const
  HASH_FUNCTION_NAME = '[SigmaHash]';

function Hash(const s: String): integer;

implementation

function Hash(const s: String): integer;
begin
  result := 0;
end;
end.