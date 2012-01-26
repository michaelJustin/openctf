object Form2: TForm2
  Left = 322
  Top = 150
  Caption = 'Form2'
  ClientHeight = 195
  ClientWidth = 358
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 144
    Top = 24
    Width = 75
    Height = 25
    Action = Action1
    TabOrder = 0
  end
  object DBEdit1: TDBEdit
    Left = 104
    Top = 104
    Width = 121
    Height = 21
    DataSource = DataSource1
    TabOrder = 1
  end
  object DBEdit2: TDBEdit
    Left = 104
    Top = 144
    Width = 121
    Height = 21
    DataField = 'ABC'
    DataSource = DataModule2.DataSource4
    TabOrder = 2
  end
  object ActionList1: TActionList
    Images = Form1.ImageList1
    Left = 40
    Top = 24
    object Action1: TAction
      Caption = 'Action1'
      ImageIndex = 0
      ShortCut = 16451
    end
    object Action2: TAction
      Caption = 'Action2'
      ShortCut = 16451
    end
  end
  object DataSource1: TDataSource
    Left = 40
    Top = 96
  end
end
