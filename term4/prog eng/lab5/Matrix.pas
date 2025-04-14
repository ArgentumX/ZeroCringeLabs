unit Matrix;

interface

type
  TMatrixData = array of array of Integer;

  TMatrix = class
  private
    FRows: Integer;
    FCols: Integer;
    FData: TMatrixData;
  public
    constructor Create(Rows, Cols: Integer); overload;
    constructor Create(const Data: TMatrixData); overload;

    function GetRows: Integer;
    function GetCols: Integer;
    function GetData: TMatrixData;

    function GetColNullCount(Col: Integer): Integer;
    function GetNullCount: Integer;
    function GetMaxNullCol: Integer;
    function IsNullOrdered: Boolean;
    procedure Display;

    // Lab 2
    function GetRowSum(I: Integer): Integer;
    function GetRowNulls(I: Integer): Integer;
    function GetCoff: Single;
    function GetEvenRowsNulls: Integer;

    procedure InitializeMatrix;

    property Rows: Integer read GetRows;
    property Cols: Integer read GetCols;
    property Data: TMatrixData read GetData;
  end;

var
  AMatrix: TMatrix;
  matrixSize: Integer;

implementation

uses
  SysUtils;

constructor TMatrix.Create(Rows, Cols: Integer);
var
  I: Integer;
begin
  FRows := Rows;
  FCols := Cols;
  SetLength(FData, Rows, Cols);
end;

constructor TMatrix.Create(const Data: TMatrixData);
begin
  FData := Data;
  FRows := Length(Data);
  if FRows > 0 then
    FCols := Length(Data[0])
  else
    FCols := 0;
end;

function TMatrix.GetRows: Integer;
begin
  Result := FRows;
end;

function TMatrix.GetCols: Integer;
begin
  Result := FCols;
end;

function TMatrix.GetData: TMatrixData;
begin
  Result := FData;
end;

function TMatrix.GetColNullCount(Col: Integer): Integer;
var
  I: Integer;
begin
  Result := 0;
  for I := 0 to FRows - 1 do
    if FData[I, Col] = 0 then
      Inc(Result);
end;

function TMatrix.GetNullCount: Integer;
var
  I: Integer;
begin
  Result := 0;
  for I := 0 to FCols - 1 do
    Result := Result + GetColNullCount(I);
end;

function TMatrix.GetMaxNullCol: Integer;
var
  I, ColVal, MaxVal: Integer;
begin
  Result := 0;
  MaxVal := GetColNullCount(0);

  for I := 1 to FCols - 1 do
  begin
    ColVal := GetColNullCount(I);
    if MaxVal < ColVal then
    begin
      MaxVal := ColVal;
      Result := I;
    end;
  end;
end;

function TMatrix.IsNullOrdered: Boolean;
var
  I, PrevVal, Val: Integer;
begin
  PrevVal := GetColNullCount(0);

  for I := 1 to FCols - 1 do
  begin
    Val := GetColNullCount(I);
    if Val < PrevVal then
    begin
      Result := False;
      Exit;
    end;
    PrevVal := Val;
  end;
  Result := True;
end;

procedure TMatrix.Display;
var
  I, J: Integer;
begin
  for I := 0 to FRows - 1 do
  begin
    for J := 0 to FCols - 1 do
      Write(FData[I, J], ' ');
    Writeln;
  end;
end;

procedure TMatrix.InitializeMatrix;
var
  i, j: Integer;
begin
  if Assigned(AMatrix) then
    AMatrix.Free;
  AMatrix := TMatrix.Create(matrixSize, matrixSize);
  for i := 0 to matrixSize - 1 do
    for j := 0 to matrixSize - 1 do
      AMatrix.Data[i, j] := Random(10); // Заполняем случайными числами от 0 до 9
end;

// Lab 2

function TMatrix.GetRowSum(I: Integer): Integer;
var
  J: Integer;
begin
  Result := 0;
  if (I < 0) or (I >= FRows) then
    Exit;

  for J := 0 to FCols - 1 do
    Result := Result + FData[I, J];
end;

function TMatrix.GetRowNulls(I: Integer): Integer;
var
  J: Integer;
begin
  Result := 0;
  if (I < 0) or (I >= FRows) then
    Exit;

  for J := 0 to FCols - 1 do
    if FData[I, J] = 0 then
      Inc(Result);
end;

function TMatrix.GetCoff: Single;
var
  I, EvenSum, OddSum: Integer;
begin
  EvenSum := 0;
  OddSum := 0;

  for I := 0 to FRows - 1 do
  begin
    if I mod 2 = 0 then
      EvenSum := EvenSum + GetRowSum(I)
    else
      OddSum := OddSum + GetRowSum(I);
  end;

  if OddSum = 0 then
    Result := 0
  else
    Result := EvenSum / OddSum;
end;

function TMatrix.GetEvenRowsNulls: Integer;
var
  I: Integer;
begin
  Result := 0;
  for I := 0 to FRows - 1 do
    if I mod 2 = 0 then
      Result := Result + GetRowNulls(I);
end;
end.
