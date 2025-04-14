unit Input;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Matrix;

type
  TForm3 = class(TForm)
    SG: TStringGrid;
    Edit1: TEdit;
    size: TLabel;
    procedure Edit1Change(Sender: TObject);
    procedure SGExit(Sender: TObject);
    procedure SGClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure UpdateMatrixView;
    procedure UpdateMatrixBackend;
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

procedure TForm3.UpdateMatrixView;
var
  i, j: Integer;
begin
  if not Assigned(SG) then
  begin
    ShowMessage('Grid is not available!');
    Exit;
  end;

  SG.RowCount := matrixSize;
  SG.ColCount := matrixSize;
  for i := 0 to matrixSize - 1 do
    for j := 0 to matrixSize - 1 do
      SG.Cells[j, i] := IntToStr(AMatrix.Data[i, j]);
end;

procedure TForm3.Edit1Change(Sender: TObject);
var
  value: Integer;
begin
  if TryStrToInt(Edit1.Text, value) then
  begin
    matrixSize := value;
    AMatrix.InitializeMatrix;
    UpdateMatrixView;
  end;
end;

procedure TForm3.SGClick(Sender: TObject);
begin
   UpdateMatrixBackend;
end;

procedure TForm3.SGExit(Sender: TObject);
begin
  UpdateMatrixBackend;
end;

procedure TForm3.UpdateMatrixBackend;
var
  i, j: Integer;
begin
  if not Assigned(SG) then
  begin
    ShowMessage('Grid is not available!');
    Exit;
  end;

  if Assigned(AMatrix) then
    AMatrix.Free;
  AMatrix := TMatrix.Create(matrixSize, matrixSize);
  for i := 0 to matrixSize - 1 do
    for j := 0 to matrixSize - 1 do
      AMatrix.Data[i, j] := StrToIntDef(SG.Cells[j, i], 0);
end;

end.
