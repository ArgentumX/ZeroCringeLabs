unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Input, Output, Actions, About, Matrix;

type
  TForm2 = class(TForm)
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    File2: TMenuItem;
    Help1: TMenuItem;
    Close1: TMenuItem;
    Input1: TMenuItem;
    Input2: TMenuItem;
    Wrok1: TMenuItem;
    About1: TMenuItem;
    procedure Close1Click(Sender: TObject);
    procedure Input1Click(Sender: TObject);
    procedure Input2Click(Sender: TObject);
    procedure Wrok1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
  private
  public
    constructor Create(AOwner: TComponent); override;
    procedure InitMatrix(size: Integer);
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

constructor TForm2.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  InitMatrix(3);
end;

procedure TForm2.InitMatrix(size: Integer);
begin
  matrixSize := size;
  AMatrix.InitializeMatrix;
end;


procedure TForm2.About1Click(Sender: TObject);
begin
  AboutBox.Show;
end;

procedure TForm2.Close1Click(Sender: TObject);
begin
  Close;
end;

procedure TForm2.Input1Click(Sender: TObject);
begin
  Form3.UpdateMatrixView;
  Form3.Show;
end;

procedure TForm2.Input2Click(Sender: TObject);
begin
  Form4.Show;
end;

procedure TForm2.Wrok1Click(Sender: TObject);
begin
  Form6.Show;
end;

end.
