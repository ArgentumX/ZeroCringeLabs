program lab8;

uses UnitTypes, UnidirectionalArrayList;

var
  f: TextFile;

procedure PrintList(an: PElem);
var 
  bn: PElem;
  ch: TInfo;
begin
  bn := an;
  while not IsEmpty(bn) do begin
    ch := GetInfo(bn, 0);
    MoveForward(bn);
    write(ch, ' ');
  end;
end;


begin
  if ParamCount < 2 then begin
      writeln('Недостаточно параметров!');
    end
  else
    begin
      if not FileExists(ParamStr(1)) then
      begin
        writeln('Невозможно открыть файл ''', ParamStr(1), ''' для чтения')
      end
      else
      begin
       { AssignFile(f, ParamStr(1));
        
        AssignFile(f, ParamStr(2));
        Append(f);
        writeln(f);
        writeln(f, 'New start');}
        
        var an, bn: PElem;
        var i: integer;
        var r: TInfo;
        r.val := 222;
        Init(an, r);
        for i := 0 to 10 do begin
          r.val := i;
          AddToEnd(an, r);
        end;
        PrintList(an)
      end;
    end;
end.