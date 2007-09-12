(** license **)
unit ctfTestDBClient;

interface
uses OpenCTF, TestFrameWork, DBClient, Classes;

type
  TCustomClientDataSetTestHandler = class(TComponentHandler)
  protected
    procedure AddTests; override;
  end;

implementation

{ TCustomClientDataSetTestHandler }

procedure TCustomClientDataSetTestHandler.AddTests;
begin
  inherited;
  // check if the OnReconcileError event handler is assigned
  CheckEvents(['OnReconcileError']);
  // check if the ProviderName property is assigned
  CheckProperties(['ProviderName']);
end;

initialization
  OpenCTF.Add(TCustomClientDataSetTestHandler.Create(TCustomClientDataSet));

end.

