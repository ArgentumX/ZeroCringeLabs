object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenu1
  TextHeight = 15
  object MainMenu1: TMainMenu
    Left = 304
    Top = 224
    object File1: TMenuItem
      Caption = 'File'
      object Close1: TMenuItem
        Caption = 'Close'
        OnClick = Close1Click
      end
    end
    object File2: TMenuItem
      Caption = 'Window'
      object Input1: TMenuItem
        Caption = 'Input'
        OnClick = Input1Click
      end
      object Input2: TMenuItem
        Caption = 'Output'
        OnClick = Input2Click
      end
      object Wrok1: TMenuItem
        Caption = 'Actions'
        OnClick = Wrok1Click
      end
    end
    object Help1: TMenuItem
      Caption = 'Help'
      object About1: TMenuItem
        Caption = 'About'
        OnClick = About1Click
      end
    end
  end
end
