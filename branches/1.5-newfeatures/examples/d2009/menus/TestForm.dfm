object Form1: TForm1
  Left = 82
  Top = 128
  Width = 347
  Height = 259
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    Left = 96
    Top = 16
    object a1: TMenuItem
      Caption = 'a'
      object b1: TMenuItem
        Caption = 'b'
        OnClick = b1Click
      end
      object g1: TMenuItem
        Action = Action1
      end
      object x1: TMenuItem
        Caption = 'x'
      end
    end
  end
  object ActionList1: TActionList
    Left = 32
    Top = 16
    object Action1: TAction
      Caption = 'Action1'
    end
    object Action2: TAction
      Caption = 'Action2'
      OnExecute = Action2Execute
    end
    object Action3: TAction
      Caption = 'Action3'
    end
  end
end
