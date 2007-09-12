(** license **)
unit ctfTestIBO;

interface
uses OpenCTF, TestFrameWork, Classes;

type
  TIBOComponentTestHandler = class(TComponentHandler)
  protected
    function Accepts(const Component: TComponent): Boolean; override;
    procedure AddTests; override;
  end;

implementation

{ TIBXComponentTestHandler }

function TIBOComponentTestHandler.Accepts(const Component: TComponent): Boolean;
var
  HasConnection, HasTransaction: Boolean;
begin
  Result := False;
  if inherited Accepts(Component) then
  begin
    HasConnection := HasProperty(Component, 'IB_Connection');
    HasTransaction := HasProperty(Component, 'IB_Transaction');
    Result := HasConnection and HasTransaction;
  end;
end;

procedure TIBOComponentTestHandler.AddTests;
begin
  inherited;
  CheckProperties(['IB_Connection', 'IB_Transaction']);
end;

initialization
  OpenCTF.Add(TIBOComponentTestHandler.Create(TComponent, 'TIBOComponentTestHandler Tests'));

end.
