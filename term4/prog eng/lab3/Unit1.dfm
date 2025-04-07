object MainM: TMainM
  Left = 0
  Top = 0
  Caption = 'Main Menu'
  ClientHeight = 683
  ClientWidth = 1023
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = MainMenu1
  TextHeight = 15
  object MainMenu1: TMainMenu
    Left = 696
    Top = 448
    object fileW: TMenuItem
      Caption = 'File'
      object closeBut: TMenuItem
        Caption = 'Close'
        OnClick = closeButClick
      end
    end
    object DataW: TMenuItem
      Caption = 'Data'
      object inputB: TMenuItem
        Caption = 'Input'
        OnClick = inputBClick
      end
      object modeB: TMenuItem
        Caption = 'Mode'
        OnClick = modeBClick
      end
      object outputB: TMenuItem
        Caption = 'Output'
        OnClick = outputBClick
      end
    end
    object workB: TMenuItem
      Caption = 'Work'
      object closeAllB: TMenuItem
        Caption = #1047#1072#1082#1088#1099#1090#1100' '#1074#1089#1077
        OnClick = closeAllBClick
      end
      object cascadeB: TMenuItem
        Caption = #1050#1072#1089#1082#1072#1076
        OnClick = cascadeBClick
      end
      object tilesB: TMenuItem
        Caption = #1058#1072#1081#1083#1080#1085#1075
        OnClick = tilesBClick
      end
      object arrangeB: TMenuItem
        Caption = #1059#1087#1086#1088#1103#1076#1086#1095#1080#1090#1100
        OnClick = arrangeBClick
      end
      object openAllB: TMenuItem
        Caption = #1054#1090#1082#1088#1099#1090#1100' '#1074#1089#1077
        OnClick = openAllBClick
      end
    end
    object helpW: TMenuItem
      Caption = 'Help'
      object aboutB: TMenuItem
        Caption = 'About'
        OnClick = aboutBClick
      end
    end
  end
end
