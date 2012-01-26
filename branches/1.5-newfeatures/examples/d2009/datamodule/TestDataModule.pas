unit TestDataModule;

interface

uses
  SysUtils, Classes, DB, DBTables;

type
  TDataModule1 = class(TDataModule)
    BoundDataSource1: TDataSource;
    Database1: TDatabase;
    BoundQuery1: TQuery;
    BoundQuery1EmpNo: TIntegerField;
    BoundQuery1LastName: TStringField;
    BoundQuery1FirstName: TStringField;
    BoundQuery1PhoneExt: TStringField;
    BoundQuery1HireDate: TDateTimeField;
    BoundQuery1Salary: TFloatField;
    BoundQuery1test: TStringField;
    UnboundQuery2: TQuery;
    UnboundQuery2EmpNo: TIntegerField;
    UnboundQuery2LastName: TStringField;
    UnboundQuery2FirstName: TStringField;
    UnboundQuery2PhoneExt: TStringField;
    UnboundQuery2HireDate: TDateTimeField;
    UnboundQuery2Salary: TFloatField;
    UnboundQuery2test2: TStringField;
    UnboundDataSource2: TDataSource;
    procedure BoundQuery1BeforeOpen(DataSet: TDataSet);
    procedure BoundQuery1CalcFields(DataSet: TDataSet);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  DataModule1: TDataModule1;

implementation

uses TestForm, TestForm2;

{$R *.dfm}

procedure TDataModule1.BoundQuery1BeforeOpen(DataSet: TDataSet);
begin
  Form2.CalledByDataModule;
end;

procedure TDataModule1.BoundQuery1CalcFields(DataSet: TDataSet);
begin
  BoundQuery1test.AsString := 'test';
end;

end.
