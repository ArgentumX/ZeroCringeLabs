object Form4: TForm4
  Left = 0
  Top = 0
  Caption = 'Form4'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  FormStyle = fsMDIForm
  Visible = True
  OnClose = FormClose
  TextHeight = 15
  object Button1: TButton
    Left = 256
    Top = 192
    Width = 105
    Height = 25
    Caption = 'Coff'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 256
    Top = 223
    Width = 105
    Height = 25
    Caption = 'Odd row nulls'
    TabOrder = 1
    OnClick = Button2Click
  end
end
