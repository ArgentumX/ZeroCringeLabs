object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  FormStyle = fsMDIForm
  Position = poMainFormCenter
  OnClose = FormClose
  TextHeight = 15
  object Label1: TLabel
    Left = 88
    Top = 259
    Width = 19
    Height = 15
    Caption = 'size'
  end
  object SG: TStringGrid
    Left = 88
    Top = 56
    Width = 393
    Height = 185
    Color = clGreen
    ColCount = 3
    FixedCols = 0
    RowCount = 3
    FixedRows = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing, goFixedRowDefAlign]
    TabOrder = 0
    OnClick = SGClick
    OnExit = SGExit
  end
  object Edit1: TEdit
    Left = 136
    Top = 256
    Width = 89
    Height = 23
    TabOrder = 1
    Text = '3'
    OnChange = Edit1Change
  end
end
