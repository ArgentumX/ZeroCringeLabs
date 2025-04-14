unit Actions;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Output, Matrix;

type
  TForm6 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;

implementation

{$R *.dfm}

procedure TForm6.Button1Click(Sender: TObject);
var
  answer: Single;
begin
  answer := Matrix.AMatrix.GetCoff;
  Form4.Label1.Caption := 'Coff: ' + FloatToStr(answer);
end;



procedure TForm6.Button2Click(Sender: TObject);
var
  nulls: Integer;
  selection: Boolean;
begin
  nulls := Matrix.AMatrix.getEvenRowsNulls;
  selection := True;
  if nulls = 0 then
    selection := False;
  Form4.RadioButton1.Checked := selection;
end;

end.
