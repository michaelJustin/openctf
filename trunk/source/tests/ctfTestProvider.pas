(** license **)
unit ctfTestProvider;

interface
uses OpenCTF, TestFrameWork, Provider, Classes;

type
  TCustomProviderTestHandler = class(TComponentHandler)
  protected
    procedure AddTests; override;
  end;

implementation

{ TCustomProviderTestHandler }

procedure TCustomProviderTestHandler.AddTests;
begin
  inherited;
  // check if the Provider is connected to a dataset
  CheckProperties(['DataSet']);
end;

initialization
  OpenCTF.Add(TCustomProviderTestHandler.Create(TCustomProvider));

end.
