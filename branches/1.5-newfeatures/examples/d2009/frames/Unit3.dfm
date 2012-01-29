object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 310
  Width = 496
  object ClientDataSetNotOk: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 376
    Top = 120
  end
  object SQLConnection1: TSQLConnection
    Left = 56
    Top = 24
  end
  object SQLQueryNotOk: TSQLQuery
    Params = <>
    Left = 56
    Top = 120
  end
  object DataSetProviderNotOk: TDataSetProvider
    Left = 200
    Top = 120
  end
  object ClientDataSetOk: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProviderOk'
    OnPostError = ClientDataSetOkPostError
    OnReconcileError = ClientDataSetOkReconcileError
    Left = 376
    Top = 200
  end
  object DataSetProviderOk: TDataSetProvider
    DataSet = SQLQueryOk
    Left = 200
    Top = 200
  end
  object SQLQueryOk: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 56
    Top = 200
  end
end
