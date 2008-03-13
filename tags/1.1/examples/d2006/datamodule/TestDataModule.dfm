object DataModule1: TDataModule1
  OldCreateOrder = False
  Left = 322
  Top = 351
  Height = 183
  Width = 457
  object BoundDataSource1: TDataSource
    DataSet = BoundQuery1
    Left = 240
    Top = 24
  end
  object Database1: TDatabase
    AliasName = 'DBDEMOS'
    Connected = True
    DatabaseName = 'EMPLOYEE.GDB'
    SessionName = 'Default'
    Left = 32
    Top = 24
  end
  object BoundQuery1: TQuery
    BeforeOpen = BoundQuery1BeforeOpen
    OnCalcFields = BoundQuery1CalcFields
    DatabaseName = 'EMPLOYEE.GDB'
    SQL.Strings = (
      'select * from employee')
    Left = 120
    Top = 24
    object BoundQuery1EmpNo: TIntegerField
      FieldName = 'EmpNo'
      Origin = '"EMPLOYEE.GDB"."employee.DB".EmpNo'
    end
    object BoundQuery1LastName: TStringField
      FieldName = 'LastName'
      Origin = '"EMPLOYEE.GDB"."employee.DB".LastName'
    end
    object BoundQuery1FirstName: TStringField
      FieldName = 'FirstName'
      Origin = '"EMPLOYEE.GDB"."employee.DB".FirstName'
      Size = 15
    end
    object BoundQuery1PhoneExt: TStringField
      FieldName = 'PhoneExt'
      Origin = '"EMPLOYEE.GDB"."employee.DB".PhoneExt'
      Size = 4
    end
    object BoundQuery1HireDate: TDateTimeField
      FieldName = 'HireDate'
      Origin = '"EMPLOYEE.GDB"."employee.DB".HireDate'
    end
    object BoundQuery1Salary: TFloatField
      FieldName = 'Salary'
      Origin = '"EMPLOYEE.GDB"."employee.DB".Salary'
    end
    object BoundQuery1test: TStringField
      FieldKind = fkCalculated
      FieldName = 'test'
      Size = 5
      Calculated = True
    end
  end
  object UnboundQuery2: TQuery
    SQL.Strings = (
      'select * from employee'
      'where name=:name and firstname=:firstname')
    Left = 120
    Top = 80
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'name'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'firstname'
        ParamType = ptInput
      end>
    object UnboundQuery2EmpNo: TIntegerField
      FieldName = 'EmpNo'
      Origin = '"EMPLOYEE.GDB"."employee.DB".EmpNo'
    end
    object UnboundQuery2LastName: TStringField
      FieldName = 'LastName'
      Origin = '"EMPLOYEE.GDB"."employee.DB".LastName'
    end
    object UnboundQuery2FirstName: TStringField
      FieldName = 'FirstName'
      Origin = '"EMPLOYEE.GDB"."employee.DB".FirstName'
      Size = 15
    end
    object UnboundQuery2PhoneExt: TStringField
      FieldName = 'PhoneExt'
      Origin = '"EMPLOYEE.GDB"."employee.DB".PhoneExt'
      Size = 4
    end
    object UnboundQuery2HireDate: TDateTimeField
      FieldName = 'HireDate'
      Origin = '"EMPLOYEE.GDB"."employee.DB".HireDate'
    end
    object UnboundQuery2Salary: TFloatField
      FieldName = 'Salary'
      Origin = '"EMPLOYEE.GDB"."employee.DB".Salary'
    end
    object UnboundQuery2test2: TStringField
      FieldKind = fkCalculated
      FieldName = 'test2'
      Size = 10
      Calculated = True
    end
  end
  object UnboundDataSource2: TDataSource
    Left = 240
    Top = 80
  end
end
