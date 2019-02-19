object Form1: TForm1
  Left = 367
  Top = 295
  Width = 470
  Height = 181
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 88
    Top = 16
    Width = 75
    Height = 25
    Action = Action1
    TabOrder = 0
  end
  object PageControl1: TPageControl
    Left = 288
    Top = 32
    Width = 153
    Height = 81
    ActivePage = TabSheet1
    MultiLine = True
    TabIndex = 0
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = 'TabSheet1'
    end
    object TabSheet2: TTabSheet
      Caption = 'TabSheet2'
      ImageIndex = 1
      TabVisible = False
    end
  end
  object Button2: TButton
    Left = 88
    Top = 56
    Width = 75
    Height = 25
    Hint = 'Hint'
    Caption = 'Button2'
    TabOrder = 2
  end
  object ActionList1: TActionList
    Left = 24
    Top = 16
    object Action1: TAction
      Caption = 'Action1'
      ImageIndex = 2
      ShortCut = 16451
      OnExecute = Action1Execute
    end
    object Action2: TAction
      Caption = 'Action2'
      ShortCut = 16451
    end
  end
  object ImageList1: TImageList
    Left = 24
    Top = 72
  end
  object MainMenu1: TMainMenu
    Images = ImageList1
    Left = 200
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
        Action = Action1
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Action21: TMenuItem
        Action = Action2
      end
    end
  end
end
