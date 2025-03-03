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
  TextHeight = 15
  object Label1: TLabel
    Left = 33
    Top = 46
    Width = 77
    Height = 21
    Caption = 'Matrix size:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 128
    Top = 320
    Width = 4
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object SG: TStringGrid
    Left = 33
    Top = 88
    Width = 353
    Height = 209
    ColCount = 10
    FixedCols = 0
    FixedRows = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing, goFixedRowDefAlign]
    ParentShowHint = False
    ShowHint = False
    TabOrder = 0
    OnExit = SGExit
  end
  object MatrixSize: TEdit
    Left = 128
    Top = 48
    Width = 49
    Height = 23
    TabOrder = 1
    Text = '3'
    OnChange = MatrixSizeChange
  end
  object Check: TButton
    Left = 35
    Top = 320
    Width = 75
    Height = 25
    Caption = 'Check'
    TabOrder = 2
    OnClick = CheckClick
  end
  object Button1: TButton
    Left = 311
    Top = 320
    Width = 75
    Height = 25
    Caption = 'Close'
    TabOrder = 3
    OnClick = Button1Click
  end
end
