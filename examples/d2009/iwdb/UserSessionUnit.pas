unit UserSessionUnit;

{
  This is a DataModule where you can add components or declare fields that are specific to 
  ONE user. Instead of creating global variables, it is better to use this datamodule. You can then
  access the it using UserSession.
}
interface

uses
  IWUserSessionBase, SysUtils, Classes, DBXpress, WideStrings, DB, SqlExpr,
  FMTBcd, DBClient, Provider;

type
  TIWUserSession = class(TIWUserSessionBase)
    SQLConnection1: TSQLConnection;
    DataSource1: TDataSource;
    SQLQuery1: TSQLQuery;
    DataSetProvider1: TDataSetProvider;
    ClientDataSet1: TClientDataSet;
    procedure IWUserSessionBaseCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TIWUserSession.IWUserSessionBaseCreate(Sender: TObject);
begin
  ClientDataSet1.Open;
end;

end.