unit Unit1;

interface

uses
  SysUtils, Classes, DBXpress, WideStrings, FMTBcd, SqlExpr, DB;

type
  TDataModule1 = class(TDataModule)
    SQLConnection1: TSQLConnection;
    SQLDataSet1: TSQLDataSet;
    SQLQuery1: TSQLQuery;
    SQLStoredProc1: TSQLStoredProc;
    SQLTable1: TSQLTable;
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  DataModule1: TDataModule1;

implementation

{$R *.dfm}

end.

