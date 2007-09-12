(** license **)
unit ctfTestIBX;

interface
uses OpenCTF, TestFrameWork, Classes;

type
  TIBXComponentTestHandler = class(TComponentHandler)
  protected
    function Accepts(const Component: TComponent): Boolean; override;
    procedure AddTests; override;
  end;

implementation

{ TIBXComponentTestHandler }

function TIBXComponentTestHandler.Accepts(const Component: TComponent): Boolean;
var
  HasDatabase, HasTransaction: Boolean;
begin
  Result := False;
  if inherited Accepts(Component) then
  begin
    HasDatabase := HasProperty(Component, 'Database');
    HasTransaction := HasProperty(Component, 'Transaction');
    Result := HasDatabase and HasTransaction;
  end;
end;

procedure TIBXComponentTestHandler.AddTests;
begin
  inherited;
  CheckProperties(['Database', 'Transaction']);
end;

initialization
  OpenCTF.Add(TIBXComponentTestHandler.Create(TComponent, 'TIBXComponentTestHandler Tests'));

end.
