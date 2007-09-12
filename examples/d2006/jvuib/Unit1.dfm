object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 351
  Width = 523
  object JvUIBDataBase1: TJvUIBDataBase
    Params.Strings = (
      'sql_dialect=3'
      'lc_ctype=NONE'
      'sql_role_name=')
    LibraryName = 'gds32.dll'
    Left = 80
    Top = 48
  end
  object JvUIBTransaction1: TJvUIBTransaction
    Left = 184
    Top = 48
  end
  object JvUIBQuery1: TJvUIBQuery
    DataBase = JvUIBDataBase1
    Left = 72
    Top = 144
  end
  object JvUIBDataSet1: TJvUIBDataSet
    Left = 184
    Top = 144
  end
end
