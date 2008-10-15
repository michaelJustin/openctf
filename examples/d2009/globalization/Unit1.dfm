object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 223
  ClientWidth = 426
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object ActionMainMenuBar1: TActionMainMenuBar
    Left = 0
    Top = 0
    Width = 426
    Height = 24
    UseSystemFont = False
    ActionManager = ActionManager1
    Caption = 'ActionMainMenuBar1'
    ColorMap.HighlightColor = 14410210
    ColorMap.BtnSelectedColor = clBtnFace
    ColorMap.UnusedColor = 14410210
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Spacing = 0
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 80
    Width = 401
    Height = 121
    DataSource = DataModule2.DataSource1
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'abc'
        Title.Caption = 'def'
        Visible = True
      end
      item
        Expanded = False
        Visible = True
      end
      item
        Expanded = False
        Visible = True
      end>
  end
  object ActionManager1: TActionManager
    ActionBars = <
      item
        Items = <
          item
            Items = <
              item
                Action = FileExit1
                ImageIndex = 43
              end>
            Action = FileFile1
          end
          item
            Items = <
              item
                Action = EditCopy1
                ImageIndex = 1
                ShortCut = 16451
              end>
            Caption = '&Bearbeiten'
          end>
        ActionBar = ActionMainMenuBar1
      end
      item
        Visible = False
      end
      item
        Visible = False
      end
      item
        Items = <
          item
            Action = EditCopy1
            ImageIndex = 1
            ShortCut = 16451
          end>
      end>
    Left = 104
    Top = 96
    StyleName = 'XP Style'
    object FileExit1: TFileExit
      Category = 'Datei'
      Caption = '&Beenden'
      Hint = 'Beenden|Anwendung beenden'
      ImageIndex = 43
    end
    object EditCopy1: TEditCopy
      Category = 'Bearbeiten'
      Caption = '&Kopieren'
      Hint = 'Kopieren|Markiertes Objekt in die Zwischenablage kopieren'
      ImageIndex = 1
      ShortCut = 16451
    end
    object FileFile1: TAction
      Caption = 'File'
    end
  end
end
