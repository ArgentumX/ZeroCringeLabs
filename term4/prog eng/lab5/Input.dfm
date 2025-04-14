object Form3: TForm3
  Left = 0
  Top = 0
  Caption = 'Form3'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object size: TLabel
    Left = 32
    Top = 269
    Width = 26
    Height = 21
    Caption = 'size'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object SG: TStringGrid
    Left = 32
    Top = 80
    Width = 337
    Height = 137
    FixedCols = 0
    FixedRows = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing, goFixedRowDefAlign]
    TabOrder = 0
    OnClick = SGClick
    OnExit = SGExit
  end
  object Edit1: TEdit
    Left = 80
    Top = 271
    Width = 57
    Height = 23
    TabOrder = 1
    Text = '3'
    OnChange = Edit1Change
  end
end
