program lab_02;

uses
  UnitTypes, Func;
  
var
  a: mas;
  maxk,k,n,m:integer;
  strue,sfalse:real;
  otr:boolean;
  fin,fout: TextFile;
begin
  writeln('Введите размер матрицы');
  readln(n,m);
  if (n>10) or (m>10) then
    writeln('Неверный размер матрицы. Размер не может превышать 10*10.')
  else if ParamCount < 2 then
    writeln('Недостаточно параметров.')
  else
  begin
    if not FileExists(ParamStr(1)) then	       { Проверяем существование файла }
      writeln('Невозможно открыть файл ''', ParamStr(1), ''' для чтения')
    else
    begin
      AssignFile(fin, ParamStr(1));	       { Открываем файл }
      Reset(fin);
      Vvod(a,n,m,fin);
      CloseFile(fin);
    end;
    
    k:=Laststr(a,n,m);
    if k>-1 then
    begin
      strue:=Sumpol(a,k,m);
      maxk:=NomerStr(a, k, m);
    end
    else
      sfalse:=Obsum(a,m,n,otr);
    
    if not FileExists(ParamStr(2)) then	       { Проверяем существование файла }
      writeln('Невозможно открыть файл ''', ParamStr(2), ''' для записи')
    else
    begin
      AssignFile(fout, ParamStr(2));	       { Открываем файл }
      Rewrite(fout);
      writeln(fout, 'Матрица А размером ',n,'*',m,' :');
      Vuvod(a,n,m,fout);
      if k>-1 then
      begin
        writeln(fout, 'Номер последней строки матрицы, не упорядоченной по убыванию: ', k+1);
        writeln (fout, 'Сумма положительных элементов: ',strue);
        writeln (fout,'Номер строки, неупорядоченной по убыванию, с максимальной суммой положительных элементов: ',maxk+1);
      end
      else
      begin
        writeln(fout, 'Нет строк не упорядоченных по убыванию');
        if otr then
          writeln(fout,'Общая сумма элементов тех строк матрицы, в которых отрицателен первый элемент: ', sfalse)
        else
          writeln(fout,'Нет строк, начинающихся с отрицательного элемента');
      end;
      CloseFile(fout);
    end;
  end;
      
end.      