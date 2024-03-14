unit MD5HashUnit;

interface

const
  HASH_FUNCTION_NAME = '[MD_5]';

function Hash(const s: String): integer;

implementation

function f1(const x, y, z: byte): byte;
begin
  result := x + y + z;
end;

function f2(const x, y, z: byte): byte;
begin
  result := -x + y + z;
end;

function f3(const x, y, z: byte): byte;
begin
  result := x - y + z;
end;

function f4(const x, y, z: byte): byte;
begin
  result := x - y - z;
end;

function Hash(const s: String): integer;
var
  ch: char;
  a: byte = 5;
  b: byte = 59;
  c: byte = 167;
  d: byte = 211;
begin
  foreach ch in s do
  begin
    a := a + f1(b, c, d) + ord(ch);
    a := (a shl 1) or (a shr 7);
    b := b + f2(c, d, a) + ord(ch);
    b := (b shl 3) or (b shr 5);
    c := c + f3(d, a, b) + ord(ch);
    c := (c shl 5) or (c shr 3);
    d := d + f4(a, b, c) + ord(ch);
    d := (d shl 7) or (d shr 1);
  end;
  result := a;
  result := (result shl 8) or b;
  result := (result shl 8) or c;
  result := (result shl 8) or d;
end;
end.