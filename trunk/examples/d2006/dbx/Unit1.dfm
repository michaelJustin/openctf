object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 246
  Width = 388
  object SQLConnection1: TSQLConnection
    DriverName = 'Interbase'
    GetDriverFunc = 'getSQLDriverINTERBASE'
    LibraryName = 'dbxint30.dll'
    Params.Strings = (
      'BlobSize=-1'
      'CommitRetain=False'
      'Database=database.gdb'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'Password=masterkey'
      'RoleName=RoleName'
      'ServerCharSet='
      'SQLDialect=3'
      'Interbase TransIsolation=ReadCommited'
      'User_Name=sysdba'
      'WaitOnLocks=True'
      'Trim Char=False')
    VendorLib = 'GDS32.DLL'
    Left = 40
    Top = 24
  end
  object SQLDataSet1: TSQLDataSet
    MaxBlobSize = 0
    Params = <>
    Left = 40
    Top = 104
  end
  object SQLQuery1: TSQLQuery
    NoMetadata = True
    MaxBlobSize = 0
    Params = <>
    Left = 112
    Top = 104
  end
  object SQLStoredProc1: TSQLStoredProc
    SQLConnection = SQLConnection1
    Params = <>
    Left = 184
    Top = 104
  end
  object SQLTable1: TSQLTable
    SQLConnection = SQLConnection1
    Left = 256
    Top = 104
  end
end
