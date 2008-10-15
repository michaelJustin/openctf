object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 278
  Width = 438
  object IBODatabase1: TIBODatabase
    Params.Strings = (
      'USER NAME=sysdba')
    Left = 48
    Top = 32
    SavedPassword = '.JuMbLe.01.432B0639073E0E4B49'
  end
  object IBOTable1: TIBOTable
    IB_Connection = IBODatabase1
    IB_Transaction = IBOTransaction1
    RecordCountAccurate = True
    FieldOptions = []
    Left = 32
    Top = 96
  end
  object IBOQuery1: TIBOQuery
    Params = <>
    IB_Connection = IBODatabase1
    RecordCountAccurate = True
    FieldOptions = []
    Left = 112
    Top = 96
  end
  object IBOStoredProc1: TIBOStoredProc
    Params = <>
    StoredProcHasDML = True
    IB_Transaction = IBOTransaction1
    Left = 200
    Top = 96
  end
  object IBOTransaction1: TIBOTransaction
    IB_Connection = IBODatabase1
    Isolation = tiConcurrency
    Left = 304
    Top = 96
  end
end
