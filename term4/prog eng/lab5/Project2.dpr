program Project2;

uses
  Vcl.Forms,
  Main in 'Main.pas' {Form2},
  Input in 'Input.pas' {Form3},
  Output in 'Output.pas' {Form4},
  Actions in 'Actions.pas' {Form6},
  ABOUT in 'ABOUT.pas' {AboutBox},
  Matrix in 'Matrix.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TForm6, Form6);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.Run;
end.
