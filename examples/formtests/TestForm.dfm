object Form1: TForm1
  Left = 367
  Top = 295
  Caption = 'Form1'
  ClientHeight = 294
  ClientWidth = 454
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object ButtonOne: TButton
    Left = 102
    Top = 136
    Width = 75
    Height = 25
    Action = ActionOne
    TabOrder = 0
  end
  object PageControlOne: TPageControl
    Left = 8
    Top = 205
    Width = 438
    Height = 81
    ActivePage = TabSheetTwo
    MultiLine = True
    TabOrder = 1
    object TabSheetTwo: TTabSheet
      Caption = 'TabSheetTwo'
    end
    object TabSheetOne: TTabSheet
      Caption = 'TabSheetOne'
      ImageIndex = 1
      TabVisible = False
    end
  end
  object ButtonTwo: TButton
    Left = 21
    Top = 136
    Width = 75
    Height = 25
    Hint = 'Hint'
    Caption = 'ButtonTwo'
    TabOrder = 2
  end
  object Button3: TButton
    Left = 183
    Top = 128
    Width = 75
    Height = 25
    Caption = 'Button3'
    TabOrder = 3
  end
  object ActList: TActionList
    Left = 24
    Top = 16
    object ActionOne: TAction
      Caption = 'Action1'
      ImageIndex = 2
      ShortCut = 16451
      OnExecute = ActionOneExecute
    end
    object ActionTwo: TAction
      Caption = 'Action2'
      ShortCut = 16451
    end
  end
  object ImageList: TImageList
    Left = 152
    Top = 16
  end
  object MainMenu: TMainMenu
    Images = ImageList
    Left = 88
    Top = 16
    object File1: TMenuItem
      Caption = 'File'
      object Quit1: TMenuItem
        Caption = 'Quit'
        OnClick = Quit1Click
      end
    end
    object Edit1: TMenuItem
      Caption = 'Edit'
      object Copy1: TMenuItem
        Caption = 'Copy'
        OnClick = Quit1Click
      end
      object Paste1: TMenuItem
        Caption = 'Paste'
        OnClick = Quit1Click
      end
      object Cut1: TMenuItem
        Caption = 'Cut'
        OnClick = Quit1Click
      end
      object Unassigned1: TMenuItem
        Caption = 'Unassigned'
      end
    end
    object Options1: TMenuItem
      Caption = 'Options'
      object Action11: TMenuItem
        Action = ActionOne
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Action21: TMenuItem
        Action = ActionTwo
      end
    end
  end
end
