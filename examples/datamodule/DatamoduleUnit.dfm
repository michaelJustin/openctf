object DataModule1: TDataModule1
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 251
  Width = 712
  object MyDataSource: TDataSource
    DataSet = ClientDataSet2
    Left = 336
    Top = 16
  end
  object ClientDataSet2: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'MyDataSetProvider'
    Left = 248
    Top = 16
  end
  object MyDataSetProvider: TDataSetProvider
    DataSet = ClientDataSet1
    Left = 152
    Top = 16
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'MyDataSetProvider'
    Left = 56
    Top = 16
  end
end
