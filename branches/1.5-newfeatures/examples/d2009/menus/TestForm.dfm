object Form1: TForm1
  Left = 82
  Top = 128
  Caption = 'Form1'
  ClientHeight = 203
  ClientWidth = 331
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenuOk
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenuOk: TMainMenu
    Left = 112
    Top = 16
    object a1: TMenuItem
      Caption = 'a'
      object b1: TMenuItem
        Caption = 'b'
        OnClick = b1Click
      end
      object g1: TMenuItem
        Action = ActionNotOk1
      end
      object x1: TMenuItem
        Caption = 'x'
      end
    end
  end
  object MainActionList: TActionList
    Left = 32
    Top = 16
    object ActionNotOk1: TAction
      Caption = 'Action1'
    end
    object ActionOk: TAction
      Caption = 'ActionOk'
      OnExecute = ActionOkExecute
    end
    object ActionNotOk2: TAction
      Caption = 'ActionNotOk2'
    end
  end
end
