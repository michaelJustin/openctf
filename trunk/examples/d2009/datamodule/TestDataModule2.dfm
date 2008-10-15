object DataModule2: TDataModule2
  OldCreateOrder = False
  Height = 294
  Width = 464
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 232
    Top = 24
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = SQLQuery1
    Left = 136
    Top = 24
  end
  object DataSetProvider2: TDataSetProvider
    DataSet = SQLQuery2
    Left = 136
    Top = 88
  end
  object ClientDataSet2: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 232
    Top = 88
  end
  object DataSetProvider3: TDataSetProvider
    Left = 136
    Top = 152
  end
  object ClientDataSet3: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 232
    Top = 152
  end
  object DataSetProvider4: TDataSetProvider
    Left = 136
    Top = 216
  end
  object ClientDataSet4: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 232
    Top = 216
  end
  object SQLQuery1: TSQLQuery
    Params = <>
    Left = 48
    Top = 24
  end
  object SQLQuery2: TSQLQuery
    Params = <>
    Left = 48
    Top = 88
  end
  object DataSource1: TDataSource
    Left = 328
    Top = 24
  end
  object DataSource2: TDataSource
    DataSet = ClientDataSet2
    Left = 328
    Top = 88
  end
  object DataSource3: TDataSource
    Left = 328
    Top = 152
  end
  object DataSource4: TDataSource
    DataSet = ClientDataSet4
    Left = 328
    Top = 216
  end
end
