object InputWind: TInputWind
  Left = 0
  Top = 0
  Anchors = []
  Caption = 'Input Window'
  ClientHeight = 434
  ClientWidth = 370
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Arial'
  Font.Style = []
  FormStyle = fsMDIChild
  Visible = True
  OnClose = FormClose
  DesignSize = (
    370
    434)
  TextHeight = 18
  object Label1: TLabel
    Left = 144
    Top = 9
    Width = 60
    Height = 32
    Anchors = []
    Caption = #1042#1093#1086#1076
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 37
    Top = 286
    Width = 60
    Height = 23
    Anchors = [akLeft, akBottom]
    Caption = #1057#1090#1088#1086#1082':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 37
    Top = 353
    Width = 95
    Height = 23
    Anchors = [akLeft, akBottom]
    Caption = #1057#1090#1086#1083#1073#1094#1086#1074':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object SG1: TStringGrid
    Left = 26
    Top = 52
    Width = 305
    Height = 225
    Anchors = []
    ColCount = 4
    DefaultRowHeight = 48
    FixedCols = 0
    RowCount = 4
    FixedRows = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing, goFixedRowDefAlign]
    TabOrder = 0
  end
  object rowsE: TEdit
    Left = 41
    Top = 319
    Width = 121
    Height = 26
    Anchors = [akLeft, akBottom]
    NumbersOnly = True
    TabOrder = 1
    Text = '4'
    OnChange = rowsEChange
  end
  object colsE: TEdit
    Left = 41
    Top = 380
    Width = 121
    Height = 26
    Anchors = [akLeft, akBottom]
    NumbersOnly = True
    TabOrder = 2
    Text = '4'
    OnChange = colsEChange
  end
  object saveB: TButton
    Left = 193
    Top = 298
    Width = 138
    Height = 47
    Anchors = [akRight, akBottom]
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 3
    OnClick = saveBClick
  end
  object closeB: TButton
    Left = 415
    Top = 355
    Width = 146
    Height = 45
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = 'Close'
    TabOrder = 4
  end
end
