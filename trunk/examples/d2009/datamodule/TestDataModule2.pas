unit TestDataModule2;

interface

uses
  SysUtils, Classes, Provider, DB, DBClient, FMTBcd, SqlExpr;

type
  TDataModule2 = class(TDataModule)
    ClientDataSet1: TClientDataSet;
    DataSetProvider1: TDataSetProvider;
    DataSetProvider2: TDataSetProvider;
    ClientDataSet2: TClientDataSet;
    DataSetProvider3: TDataSetProvider;
    ClientDataSet3: TClientDataSet;
    DataSetProvider4: TDataSetProvider;
    ClientDataSet4: TClientDataSet;
    SQLQuery1: TSQLQuery;
    SQLQuery2: TSQLQuery;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    DataSource3: TDataSource;
    DataSource4: TDataSource;
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  DataModule2: TDataModule2;

implementation

{$R *.dfm}

end.
