object DataInput: TDataInput
  Left = 0
  Top = 0
  Caption = 'DataInput'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object LabelRow: TLabel
    Left = 48
    Top = 35
    Width = 58
    Height = 15
    Caption = 'Enter rows:'
  end
  object Button: TButton
    Left = 48
    Top = 72
    Width = 75
    Height = 25
    Caption = 'Confirm'
    TabOrder = 0
    OnClick = ButtonClick
  end
  object EditRows: TEdit
    Left = 136
    Top = 32
    Width = 121
    Height = 23
    TabOrder = 1
    Text = 'EditRows'
  end
  object StringGrid: TStringGrid
    Left = 136
    Top = 72
    Width = 320
    Height = 120
    FixedCols = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing, goFixedRowDefAlign]
    TabOrder = 2
  end
  object ButtonInput: TButton
    Left = 48
    Top = 111
    Width = 75
    Height = 25
    Caption = 'Enter'
    TabOrder = 3
    OnClick = ButtonInputClick
  end
end
