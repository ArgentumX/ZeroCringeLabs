unit Func;

interface

uses 
  UnitTypes;
  
procedure Vvod (var x:mas; const  n,m:integer; f:TextFile);

procedure VvodVect (var x:vect; const n:integer; f:TextFile);

function Check(const x:vect; n:integer):boolean;

function Laststr(const x:mas; n,m:integer):integer;

function Sumpol(const x:mas; k,n:integer):real;

function Sumstr(const x:vect; n:integer):real;

function Obsum (const x:mas; n,m:integer; var f:boolean):real;

function NomerStr(const x:mas; k,n:integer): integer;

procedure Vuvod (const x:mas; n,m:integer; var f:TextFile);

procedure VuvodVect (const x:vect; n:integer; var f:TextFile);
  
implementation

procedure Vvod (var x:mas;const n,m:integer; const f:TextFile);
var i:integer;
begin
  SetLength(x,n);
  for i:=0 to n-1 do
  begin
    SetLength (x[i],m);
    VvodVect(x[i],m,f);
    readln(f);
  end;
end;

procedure VvodVect (var x:vect;const n:integer; f:TextFile);
var i:integer;
begin
  SetLength(x,n);
  for i:=0 to n-1 do
    read(f,x[i]);
end;

function Check(const x:vect; n:integer):boolean;
var 
  i:integer;
  f:boolean;
begin
  f:=false;
  i:=0;
  while (i<n-1) and not(f) do
    if x[i]<=x[i+1] then
      f:=true
    else i+=1;
  result:=f;
end;

function Laststr(const x:mas; n,m:integer):integer;
var i:integer;
begin
  i:=n-1;
  while (i>=0) and not(Check(x[i],m)) do
    i-=1;
  result := i;
end;

function Sumpol(const x:mas; k,n:integer):real;
var 
  i:integer;
  y:vect;
  s:real;
begin
  y:=x[k];
  s:=0;
  for i:=0 to n-1 do
  begin
    if y[i]>0 then
      s+=y[i];
  end;
  result:=s;
end;

function Sumstr(const x:vect; n:integer):real;
var i:integer;
  s:real;
begin
  s:=0;
  for i:=0 to n-1 do
    s+=x[i];
  result:=s;
end;

function Obsum (const x:mas; n,m:integer; var f:boolean):real;
var j:integer;
  s:real;
begin
  f:=false;
  s:=0;
  for j:=0 to n-1 do
  begin
    if x[j][0]<0 then
    begin
      s+=Sumstr(x[j],m);
      f:=true;
    end;
  end;
  result:=s;
end;

function NomerStr(const x:mas; k,n:integer): integer;
var
  i,nom:integer;
  maxs:real;
begin
  maxs:=Sumpol(x,k,n);
  nom:=k;
  for i:=k downto 0 do
  begin
    if (Check(x[i],n)) and (maxs<Sumpol(x,i,n)) then
    begin
      maxs:=Sumpol(x,i,n);
      nom:=i;
    end;
  end;
  result:=nom;
end;

procedure Vuvod (const x:mas; n,m:integer; var f:TextFile);
var i:integer;
begin
  for i:=0 to n-1 do
  begin
    VuvodVect(x[i],m,f);
    writeln(f)
  end;
end;

procedure VuvodVect (const x:vect; n:integer; var f:TextFile);
var i:integer;
begin
  for i:=0 to n-1 do
    write(f,x[i],' ');
end;

end.