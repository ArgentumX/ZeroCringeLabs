unit BetaHashUnit;

interface

const
  HASH_FUNCTION_NAME = '[BetaHash]';

function Hash(const s: String): integer;

implementation

function Hash(const s: String): integer;
var 
  i, j: integer;
  ch: char;
begin
  i := 1;
  j := 1;
  foreach ch in s do
  begin
    if (i mod 2 = 0) then
      j += i div 10;
    result += ((ord(ch) + i) shl (256 - ord(ch))) * j;
    i += ord(ch) mod 4;
  end;

end;
end.