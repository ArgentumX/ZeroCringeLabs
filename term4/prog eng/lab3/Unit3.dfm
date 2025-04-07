object ModeWind: TModeWind
  Left = 0
  Top = 0
  Anchors = []
  Caption = 'Mode Wind'
  ClientHeight = 357
  ClientWidth = 520
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
    520
    357)
  TextHeight = 18
  object Label1: TLabel
    Left = 179
    Top = 11
    Width = 197
    Height = 32
    Anchors = []
    Caption = #1042#1099#1073#1088#1072#1090#1100' '#1088#1077#1078#1080#1084
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    ExplicitLeft = 161
    ExplicitTop = 8
  end
  object Label2: TLabel
    Left = 123
    Top = 62
    Width = 301
    Height = 18
    Anchors = []
    Caption = '1. '#1054#1087#1088#1077#1076#1077#1083#1080#1090#1100' '#1095#1080#1089#1083#1086' '#1085#1077#1095#1077#1090#1085#1099#1093' '#1101#1083#1077#1084#1077#1085#1090#1086#1074
  end
  object Label3: TLabel
    Left = 107
    Top = 144
    Width = 285
    Height = 18
    Anchors = []
    Caption = '2. '#1054#1087#1088#1077#1076#1077#1083#1080#1090#1100' '#1095#1080#1089#1083#1086' '#1095#1077#1090#1085#1099#1093' '#1101#1083#1077#1084#1077#1085#1090#1086#1074
  end
  object saveB: TButton
    Left = 191
    Top = 230
    Width = 145
    Height = 41
    Anchors = []
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 0
    OnClick = saveBClick
  end
  object RadioButton1: TRadioButton
    Left = 207
    Top = 104
    Width = 113
    Height = 17
    Anchors = []
    Caption = #1042#1099#1073#1088#1072#1090#1100
    Checked = True
    TabOrder = 1
    TabStop = True
  end
  object RadioButton2: TRadioButton
    Left = 207
    Top = 183
    Width = 113
    Height = 17
    Anchors = []
    Caption = #1042#1099#1073#1088#1072#1090#1100
    TabOrder = 2
  end
end
