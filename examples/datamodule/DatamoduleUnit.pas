unit DatamoduleUnit;

interface

uses
  SysUtils, Classes, Provider, DB, DBClient, ExtCtrls;

type
  TDataModule1 = class(TDataModule)
    MyDataSource: TDataSource;
    ClientDataSet2: TClientDataSet;
    MyDataSetProvider: TDataSetProvider;
    ClientDataSet1: TClientDataSet;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

{$R *.dfm}

procedure TDataModule1.DataModuleCreate(Sender: TObject);
begin
  // detected at test run time -> uncomment to see it fails
  // MyDataSource.DataSet := nil;
end;

end.
