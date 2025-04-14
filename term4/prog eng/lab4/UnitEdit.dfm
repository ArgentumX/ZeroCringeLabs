object FormEdit: TFormEdit
  Left = 0
  Top = 0
  Caption = 'TFormEdit'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnShow = FormShow
  TextHeight = 15
  object EditGrid: TStringGrid
    Left = 176
    Top = 96
    Width = 320
    Height = 153
    ColCount = 3
    FixedCols = 0
    RowCount = 3
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing, goFixedRowDefAlign]
    TabOrder = 0
    RowHeights = (
      24
      24
      24)
  end
  object EditButtonChange: TButton
    Left = 88
    Top = 112
    Width = 75
    Height = 25
    Caption = #1048#1079#1084#1077#1085#1080#1090#1100
    TabOrder = 1
    OnClick = EditButtonChangeClick
  end
  object EditButtonDelete: TButton
    Left = 88
    Top = 160
    Width = 75
    Height = 25
    Caption = #1059#1076#1072#1083#1080#1090#1100
    TabOrder = 2
    OnClick = EditButtonDeleteClick
  end
end
