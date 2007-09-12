unit Unit1;

interface

uses
  SysUtils, Classes, IB_Components, IBODataset, DB;

type
  TDataModule1 = class(TDataModule)
    IBODatabase1: TIBODatabase;
    IBOTable1: TIBOTable;
    IBOQuery1: TIBOQuery;
    IBOStoredProc1: TIBOStoredProc;
    IBOTransaction1: TIBOTransaction;
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
