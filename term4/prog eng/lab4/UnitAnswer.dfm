object FormAnswer: TFormAnswer
  Left = 0
  Top = 0
  Caption = 'FormAnswer'
  ClientHeight = 286
  ClientWidth = 370
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object LabelAnswer: TLabel
    Left = 200
    Top = 116
    Width = 9
    Height = 15
    Caption = '...'
  end
  object LabelComment: TLabel
    Left = 24
    Top = 116
    Width = 9
    Height = 15
    Caption = '...'
  end
  object Label1: TLabel
    Left = 24
    Top = 20
    Width = 68
    Height = 15
    Caption = #1042#1074#1077#1076#1080' '#1087#1086#1088#1086#1075
  end
  object ButtonAnswer: TButton
    Left = 24
    Top = 70
    Width = 75
    Height = 25
    Caption = 'Get answer'
    TabOrder = 0
    OnClick = ButtonAnswerClick
  end
  object ButtonClose: TButton
    Left = 296
    Top = 253
    Width = 75
    Height = 25
    Caption = 'Close'
    TabOrder = 1
    OnClick = ButtonCloseClick
  end
  object EditThreshold: TEdit
    Left = 24
    Top = 41
    Width = 121
    Height = 23
    TabOrder = 2
    Text = '300'
  end
end
