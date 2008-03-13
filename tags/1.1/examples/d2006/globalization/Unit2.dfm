object DataModule2: TDataModule2
  OldCreateOrder = False
  Height = 150
  Width = 215
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 88
    Top = 56
    object ClientDataSet1abc: TStringField
      DisplayLabel = 'Abc'
      FieldKind = fkCalculated
      FieldName = 'abc'
      Size = 25
      Calculated = True
    end
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 120
    Top = 72
  end
end
