object OKRightDlg: TOKRightDlg
  Left = 227
  Top = 108
  BorderStyle = bsDialog
  Caption = 'Dialog'
  ClientHeight = 179
  ClientWidth = 384
  Color = clBtnFace
  ParentFont = True
  Position = poScreenCenter
  TextHeight = 15
  object OKBtn: TButton
    Left = 276
    Top = 136
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 0
    OnClick = OKBtnClick
  end
  object RadioGroup: TRadioGroup
    Left = 8
    Top = 21
    Width = 281
    Height = 92
    Caption = 'Select the task: '
    ItemIndex = 0
    Items.Strings = (
      #1053#1072#1083#1080#1095#1080#1077' '#1089#1090#1088#1086#1082#1080' '#1080#1079' '#1085#1091#1083#1077#1074#1099#1093' '#1101#1083#1077#1084#1077#1085#1090#1086#1074
      #1050#1086#1083'-'#1074#1086' '#1085#1091#1083#1077#1074#1099#1093' '#1101#1083#1077#1084#1077#1085#1090#1086#1074' '#1074' '#1095#1077#1090#1085#1099#1093' '#1089#1090#1086#1083#1073#1094#1072#1093)
    TabOrder = 1
  end
end
