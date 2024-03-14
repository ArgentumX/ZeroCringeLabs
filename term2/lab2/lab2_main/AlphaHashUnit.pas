unit AlphaHashUnit;

interface

const
  HASH_FUNCTION_NAME = '[AlpahHash]';

function Hash(const s: String): integer;

implementation

function Hash(const s: String): integer;
var 
  A, i, j: integer;
  ch: char;
begin
  A := 10;
  i := 1;
  foreach ch in s do begin
    if (ord(ch) mod 2 = 0) then begin
      j := ord(ch) * ord(ch);
    end
    else begin
      j := (256 - ord(ch)) * (256 - ord(ch));
    end;
    result += i * ord(ch) * A + j;
    i += 1;
  end;
end;
end.