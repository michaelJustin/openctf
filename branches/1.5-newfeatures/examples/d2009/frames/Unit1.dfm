object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 415
  ClientWidth = 482
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 104
    Width = 31
    Height = 13
    Caption = 'Label1'
  end
  inline Frame21: TFrame2
    Left = 24
    Top = 8
    Width = 129
    Height = 73
    TabOrder = 0
    TabStop = True
    ExplicitLeft = 24
    ExplicitTop = 8
  end
  inline Frame22: TFrame2
    Left = 184
    Top = 8
    Width = 129
    Height = 73
    TabOrder = 1
    TabStop = True
    ExplicitLeft = 184
    ExplicitTop = 8
  end
  inline Frame23: TFrame2
    Left = 336
    Top = 8
    Width = 129
    Height = 73
    TabOrder = 2
    TabStop = True
    ExplicitLeft = 336
    ExplicitTop = 8
  end
  object Button1: TButton
    Left = 24
    Top = 120
    Width = 75
    Height = 25
    Caption = 'Button1'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 3
  end
  object GroupBox1: TGroupBox
    Left = 24
    Top = 280
    Width = 233
    Height = 105
    Caption = 'DB Controls'
    TabOrder = 4
    object DBText1: TDBText
      Left = 8
      Top = 40
      Width = 65
      Height = 17
    end
    object DBTextOk: TDBText
      Left = 8
      Top = 72
      Width = 65
      Height = 17
      DataField = 'FIELDNAME'
      DataSource = DataSource1
    end
    object DBEdit1: TDBEdit
      Left = 81
      Top = 37
      Width = 121
      Height = 21
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 81
      Top = 69
      Width = 121
      Height = 21
      DataField = 'FIELDNAME'
      DataSource = DataSource1
      TabOrder = 1
    end
  end
  object DataSource1: TDataSource
    Left = 312
    Top = 296
  end
  object DataSourceOk: TDataSource
    DataSet = DataModule1.ClientDataSetOk
    Left = 312
    Top = 344
  end
end
