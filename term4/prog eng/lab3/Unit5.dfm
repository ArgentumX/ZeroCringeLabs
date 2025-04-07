object SetWind: TSetWind
  Left = 0
  Top = 0
  Caption = 'Settings'
  ClientHeight = 273
  ClientWidth = 422
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Arial'
  Font.Style = []
  DesignSize = (
    422
    273)
  TextHeight = 15
  object Label1: TLabel
    Left = 184
    Top = 8
    Width = 45
    Height = 23
    Anchors = []
    Caption = #1062#1074#1077#1090
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object closeB: TButton
    Left = 271
    Top = 216
    Width = 138
    Height = 41
    Anchors = [akRight, akBottom]
    Caption = #1047#1072#1082#1088#1099#1090#1100
    TabOrder = 0
    OnClick = closeBClick
  end
  object colBox: TColorBox
    Left = 63
    Top = 55
    Width = 298
    Height = 22
    DefaultColorColor = clBtnHighlight
    Selected = clBtnFace
    Anchors = []
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object CBL1: TCheckListBox
    Left = 144
    Top = 91
    Width = 129
    Height = 89
    Anchors = []
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = []
    ItemHeight = 17
    Items.Strings = (
      #1043#1083#1072#1074#1085#1086#1077' '#1054#1082#1085#1086
      #1042#1074#1086#1076
      #1056#1077#1078#1080#1084
      #1042#1099#1074#1086#1076)
    ParentFont = False
    TabOrder = 2
  end
  object applyB: TButton
    Left = 15
    Top = 216
    Width = 138
    Height = 41
    Anchors = [akLeft, akBottom]
    Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
    TabOrder = 3
    OnClick = applyBClick
  end
end
