unit Unit1;

interface

uses
  SysUtils, Classes, ADODB, DB;

type
  TDataModule1 = class(TDataModule)
    ADOConnection1: TADOConnection;
    ADODataSet1: TADODataSet;
    ADOTable1: TADOTable;
    ADOQuery1: TADOQuery;
    ADOStoredProc1: TADOStoredProc;
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
