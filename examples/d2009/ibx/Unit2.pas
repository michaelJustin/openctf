unit Unit2;

interface

uses
  SysUtils, Classes, DB, IBDatabase, IBCustomDataSet, IBScript,
  IBConnectionBroker, IBSQL, IBUpdateSQL, IBStoredProc, IBQuery, IBTable;

type
  TDataModule2 = class(TDataModule)
    IBDatabase1: TIBDatabase;
    IBDataSet1: TIBDataSet;
    IBTransaction1: TIBTransaction;
    IBDataSet1RDBDESCRIPTION: TMemoField;
    IBDataSet1RDBRELATION_ID: TSmallintField;
    IBDataSet1RDBSECURITY_CLASS: TIBStringField;
    IBDataSet1RDBCHARACTER_SET_NAME: TIBStringField;
    IBTable1: TIBTable;
    IBQuery1: TIBQuery;
    IBStoredProc1: TIBStoredProc;
    IBUpdateSQL1: TIBUpdateSQL;
    IBSQL1: TIBSQL;
    IBConnectionBroker1: TIBConnectionBroker;
    IBScript1: TIBScript;
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
