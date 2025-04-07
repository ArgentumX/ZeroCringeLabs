object OutputWind: TOutputWind
  Left = 0
  Top = 0
  Caption = 'Output Window'
  ClientHeight = 279
  ClientWidth = 380
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -21
  Font.Name = 'Arial'
  Font.Style = []
  FormStyle = fsMDIChild
  Visible = True
  OnClose = FormClose
  DesignSize = (
    380
    279)
  TextHeight = 24
  object OUTPUT: TLabel
    Left = 144
    Top = 8
    Width = 81
    Height = 32
    Anchors = []
    Caption = #1042#1099#1074#1086#1076
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 56
    Top = 46
    Width = 221
    Height = 24
    Anchors = []
    Caption = #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100' '#1084#1072#1089#1089#1080#1074
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object minout: TLabel
    Left = 56
    Top = 168
    Width = 247
    Height = 24
    Anchors = []
    Caption = #1042#1099#1095#1080#1089#1083#1077#1085#1086' '#1101#1083#1077#1084#1077#1085#1090#1086#1074': ...'
  end
  object SGout: TStringGrid
    Left = 8
    Top = 77
    Width = 353
    Height = 65
    Anchors = []
    DefaultRowHeight = 48
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    TabOrder = 0
  end
  object calcB: TButton
    Left = 107
    Top = 208
    Width = 145
    Height = 41
    Anchors = [akLeft, akBottom]
    Caption = #1042#1099#1095#1080#1089#1083#1080#1090#1100
    TabOrder = 1
    OnClick = calcBClick
  end
end
