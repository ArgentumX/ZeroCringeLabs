unit RecFunctionsUnit;

interface

uses UnitTypes;

function GetMinSpLinear(const vect: vector; const m: integer): real;

function GetMinSpKaskade(const vect: vector; const m: integer): real;

implementation

function GetMinSpLinearCore(const vect: vector; m: integer; min: real): real;
var
  spValue: real;
begin
  if (m < 0) then begin
    writeln('error');
  end
  else begin
    spValue := Sqrt(Abs(vect[m]));
    if (m = 0) then begin
      if (spValue < min) then begin
        result := spValue;
      end
      else begin
        result := min;
      end;
    end
    else begin
      if (spValue < min) then begin
        result := GetMinSpLinearCore(vect, m-1, spValue);
      end
      else begin
        result := GetMinSpLinearCore(vect, m-1, min);
      end;
    end;
  end;
end;

function GetMinSpKaskadeCore(const vect: vector; const n, m: integer): real;
var
  mid: integer; 
  min1, min2, spValue1, spValue2: real;
begin
  if (n > m) or (m < 0) or (n < 0) then begin
    writeln('error');
  end
  else begin
    spValue1 := Abs(Sqrt(vect[n]));
    spValue2 := Abs(Sqrt(vect[m]));
    if (n = m) then begin
      result := spValue1;
    end
    else begin
      if (m - n = 1) then begin
        if (spValue2 < spValue1) then begin
          result := spValue2;
        end
        else begin
          result := spValue1;
        end;
      end
      else begin
        mid := n + ((m - n) div 2);
        min1 := GetMinSpKaskadeCore(vect, n, mid);
        min2 := GetMinSpKaskadeCore(vect, mid+1, m);
        
        if (min1 < min2) then begin
          result := min1;
        end
        else begin
          result := min2;
        end;
      end;
    end;
  end;
end;

function GetMinSpLinear(const vect: vector; const m: integer): real;
begin
 result := GetMinSpLinearCore(vect, m-2, vect[m-1]);
end;

function GetMinSpKaskade(const vect: vector; const m: integer): real;
begin
  result := GetMinSpKaskadeCore(vect, 0, m-1);
end;

end.