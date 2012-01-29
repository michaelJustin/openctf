unit Unit3;

interface

uses
  SysUtils, Classes, DB, DBClient, WideStrings, FMTBcd, Provider, SqlExpr;

type
  TDataModule1 = class(TDataModule)
    ClientDataSetNotOk: TClientDataSet;
    SQLConnection1: TSQLConnection;
    SQLQueryNotOk: TSQLQuery;
    DataSetProviderNotOk: TDataSetProvider;
    ClientDataSetOk: TClientDataSet;
    DataSetProviderOk: TDataSetProvider;
    SQLQueryOk: TSQLQuery;
    procedure ClientDataSetOkReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure ClientDataSetOkPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

uses
  Dialogs;

{$R *.dfm}

procedure TDataModule1.ClientDataSetOkPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  ShowMessage('!');
end;

procedure TDataModule1.ClientDataSetOkReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  ShowMessage('!');
end;

end.
