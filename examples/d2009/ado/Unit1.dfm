object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 346
  Width = 510
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=ADsDSOObject;Encrypt Password=False;Mode=Read;Bind Flag' +
      's=0;ADSI Flag=-2147483648'
    Mode = cmRead
    Provider = 'ADsDSOObject'
    Left = 64
    Top = 24
  end
  object ADODataSet1: TADODataSet
    Parameters = <>
    Left = 64
    Top = 96
  end
  object ADOTable1: TADOTable
    Connection = ADOConnection1
    Left = 144
    Top = 96
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 232
    Top = 96
  end
  object ADOStoredProc1: TADOStoredProc
    Parameters = <>
    Left = 320
    Top = 96
  end
end
