unit Matr;

interface

uses 
  UnitTypes;
  
procedure Vvod (var x:mas; const n,m:integer; f:TextFile);

function Check(const x:mas; k, n:integer):boolean;

function Laststr(const x:mas; n,m:integer):integer;

function Sumpol(const x:mas; k,n:integer):real;

function Obsum (const x:mas; n,m:integer; var f:boolean):real;

function NomerStr(const x:mas; k,n:integer): integer;

procedure Vuvod (const x:mas; n,m:integer; var f:TextFile);

  
implementation

procedure Vvod (var x:mas; const  n,m:integer; f:TextFile);
var i,j:integer;
begin
  SetLength(x,n);
  for i:=0 to n-1 do
    SetLength (x[i],m);
  for i:=0 to n-1 do
  begin
    for j:=0 to m-1 do
      read(f,x[i][j]);
    readln(f);
  end;
end;

function Check(const x:mas; k, n:integer):boolean;
var 
  i:integer;
  f:boolean;
begin
  f:=false;
  i:=0;
  while (i<n-1) and not(f) do
    if x[k][i]<=x[k][i+1] then
      f:=true
    else i+=1;
  result:=f;
end;

function Laststr(const x:mas; n,m:integer):integer;
var i:integer;
begin
  i:=n-1;
  while (i>=0) and not(Check(x,i,m)) do
    i-=1;
  result := i;
end;

function Sumpol(const x:mas; k,n:integer):real;
var i:integer;
  s:real;
begin
  s:=0;
  for i:=0 to n-1 do
  begin
    if x[k][i]>0 then
      s+=x[k][i];
  end;
  result:=s;
end;

function Obsum (const x:mas; n,m:integer; var f:boolean):real;
var j,i:integer;
  s:real;
begin
  f:=false;
  s:=0;
  for j:=0 to n-1 do
  begin
    if x[j][0]<0 then
    begin
      for i:=0 to m-1 do
        s+=x[j][i];
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
    if (Check(x,i,n)) and (maxs<Sumpol(x,i,n)) then
    begin
      maxs:=Sumpol(x,i,n);
      nom:=i;
    end;
  end;
  result:=nom;
end;

procedure Vuvod (const x:mas; n,m:integer; var f:TextFile);
var i,j:integer;
begin
  for i:=0 to n-1 do
  begin
    for j:=0 to m-1 do
      write(f,x[i][j],' ');
    writeln(f)
  end;
end;
end.