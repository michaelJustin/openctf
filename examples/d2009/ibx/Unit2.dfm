object DataModule2: TDataModule2
  OldCreateOrder = False
  Height = 293
  Width = 617
  object IBDatabase1: TIBDatabase
    Params.Strings = (
      'user_name=sysdba'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = IBTransaction1
    Left = 48
    Top = 32
  end
  object IBDataSet1: TIBDataSet
    Database = IBDatabase1
    Transaction = IBTransaction1
    SelectSQL.Strings = (
      'select * from rdb$database')
    Left = 48
    Top = 152
    object IBDataSet1RDBDESCRIPTION: TMemoField
      FieldName = 'RDB$DESCRIPTION'
      Origin = '"RDB$DATABASE"."RDB$DESCRIPTION"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
    object IBDataSet1RDBRELATION_ID: TSmallintField
      FieldName = 'RDB$RELATION_ID'
      Origin = '"RDB$DATABASE"."RDB$RELATION_ID"'
    end
    object IBDataSet1RDBSECURITY_CLASS: TIBStringField
      FieldName = 'RDB$SECURITY_CLASS'
      Origin = '"RDB$DATABASE"."RDB$SECURITY_CLASS"'
      FixedChar = True
      Size = 31
    end
    object IBDataSet1RDBCHARACTER_SET_NAME: TIBStringField
      FieldName = 'RDB$CHARACTER_SET_NAME'
      Origin = '"RDB$DATABASE"."RDB$CHARACTER_SET_NAME"'
      FixedChar = True
      Size = 31
    end
  end
  object IBTransaction1: TIBTransaction
    Left = 48
    Top = 96
  end
  object IBTable1: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    FieldDefs = <
      item
        Name = 'COLLECTION_ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'FK_PROJECT_ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'COLLECTION_NAME'
        DataType = ftString
        Size = 128
      end
      item
        Name = 'COLLECTION_TEXT'
        DataType = ftMemo
        Size = 8
      end
      item
        Name = 'COLLECTION_ABSTRACT'
        DataType = ftString
        Size = 254
      end
      item
        Name = 'LAST_UPDATED'
        DataType = ftDateTime
      end
      item
        Name = 'COLLECTION_CODE'
        DataType = ftString
        Size = 64
      end
      item
        Name = 'FK_PAGE_ID'
        DataType = ftInteger
      end
      item
        Name = 'COLLECTION_SORTBY'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'COLLECTION_SORTDESC'
        Attributes = [faRequired]
        DataType = ftSmallint
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY1'
        Fields = 'COLLECTION_ID'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'RDB$FOREIGN11'
        Fields = 'FK_PROJECT_ID'
      end
      item
        Name = 'RDB$FOREIGN12'
        Fields = 'FK_PAGE_ID'
      end
      item
        Name = 'CMS_COLLECTION_CODE'
        Fields = 'COLLECTION_CODE;FK_PROJECT_ID'
        Options = [ixUnique]
      end
      item
        Name = 'CMS_COLLECTION_NAME'
        Fields = 'FK_PROJECT_ID;COLLECTION_NAME'
        Options = [ixUnique]
      end>
    StoreDefs = True
    TableName = 'CMS_COLLECTION'
    Left = 120
    Top = 152
  end
  object IBQuery1: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    Left = 184
    Top = 152
  end
  object IBStoredProc1: TIBStoredProc
    Left = 256
    Top = 152
  end
  object IBUpdateSQL1: TIBUpdateSQL
    Left = 336
    Top = 152
  end
  object IBSQL1: TIBSQL
    Database = IBDatabase1
    Transaction = IBTransaction1
    Left = 416
    Top = 152
  end
  object IBConnectionBroker1: TIBConnectionBroker
    TransactionIdleTimer = 0
    Left = 504
    Top = 152
  end
  object IBScript1: TIBScript
    Database = IBDatabase1
    Terminator = ';'
    Left = 48
    Top = 208
  end
end
