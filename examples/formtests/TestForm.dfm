object Form1: TForm1
  Left = 367
  Top = 295
  Caption = 'Form1'
  ClientHeight = 390
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
  object Label1: TLabel
    Left = 24
    Top = 88
    Width = 32
    Height = 13
    Caption = 'Label1'
  end
  object PageControlOne: TPageControl
    Left = 8
    Top = 205
    Width = 438
    Height = 81
    ActivePage = TabSheetTwo
    MultiLine = True
    TabOrder = 0
    object TabSheetTwo: TTabSheet
      Caption = 'TabSheetTwo'
    end
    object TabSheetOne: TTabSheet
      Caption = 'TabSheetOne'
      ImageIndex = 1
      TabVisible = False
    end
  end
  inline Frame11: TFrame1
    Left = 0
    Top = 0
    Width = 454
    Height = 80
    Align = alTop
    TabOrder = 1
  end
  object ButtonOne: TButton
    Left = 8
    Top = 303
    Width = 75
    Height = 25
    Action = ActionOne
    TabOrder = 2
  end
  object ButtonTwo: TButton
    Left = 8
    Top = 135
    Width = 75
    Height = 25
    Hint = 'Hint'
    Caption = 'ButtonTwo'
    TabOrder = 3
  end
  object Button3: TButton
    Left = 87
    Top = 134
    Width = 75
    Height = 26
    Caption = 'Button3'
    TabOrder = 4
  end
  object Panel1: TPanel
    Left = -40
    Top = 357
    Width = 185
    Height = 41
    Caption = 'Panel1'
    TabOrder = 5
  end
  object Panel2: TPanel
    Left = 500
    Top = 119
    Width = 185
    Height = 41
    Caption = 'Panel2'
    TabOrder = 6
  end
  object ActList: TActionList
    Left = 24
    Top = 16
    object ActionOne: TAction
      Caption = 'ActionOne'
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
