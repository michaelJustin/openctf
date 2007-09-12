unit Unit1;

interface

uses
  SysUtils, Classes, DB, JvUIBDataSet, JvUIB, JvComponentBase;

type
  TDataModule1 = class(TDataModule)
    JvUIBDataBase1: TJvUIBDataBase;
    JvUIBTransaction1: TJvUIBTransaction;
    JvUIBQuery1: TJvUIBQuery;
    JvUIBDataSet1: TJvUIBDataSet;
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
