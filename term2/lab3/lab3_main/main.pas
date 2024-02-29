Program main;

uses MatrixOperationsUnit, UnitTypes;

var
  f: TextFile;
  A, B: matrix;
  nA, mA, nB, mB: integer;
  number, ASum, BSum: real;
  ASuccessful, BSuccessful, AOrderedRow, BOrderedRow: boolean;
  
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
      { Reading data }
      AssignFile(f, ParamStr(1));
      Reset(f);
      read(f, number);
      readln(f);
      ReadMatrix(f, A, nA, mA);
      ReadMatrix(f, B, nB, mB);
      CloseFile(f);
      
      
      
      { Handling matrices }
      AssignFile(f, ParamStr(2));
      Append(f);
      writeln(f, '');
      writeln(f, '{ New start ', ParamStr(1), ' }');
      
      ASum := GetSpecialСonditionSum(A, nA, mA, number, ASuccessful, AOrderedRow);
      BSum := GetSpecialСonditionSum(B, nB, mB, number, BSuccessful, BOrderedRow);
      
      WriteMatrix(f, A, nA, mA, 'MATRIX A');
      if (not ASuccessful) then
        writeln(f, '[A] Строки по условию не найдено, количество упорядоченных строк: ', GetOrderedRowsAmount(A, nA, mA))
      else begin
        writeln(f, '[A] Сумма элементов по условию в искомой строке: ', ASum);
        writeln(f, '[A] Элементы в искомой строке упорядочены: ', AOrderedRow);
        end;
      
      
      writeln(f, '');
      
      WriteMatrix(f, B, nB, mB, 'MATRIX B');
      if (not BSuccessful) then
        writeln(f, '[B] Строки по условию не найдено, количество упорядоченных строк: ', GetOrderedRowsAmount(B, nB, mB))
      else begin
        writeln(f, '[B] Сумма элементов по условию в искомой строке: ', BSum);
        writeln(f, '[B] Элементы в искомой строке упорядочены: ', BOrderedRow);
        end;
      
      CloseFile(f);
      
    end;
  end;

end.