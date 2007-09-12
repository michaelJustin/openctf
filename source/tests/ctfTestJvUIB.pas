(** license **)
unit ctfTestJvUIB;

interface
uses OpenCTF, TestFrameWork, Classes;

type
  TJvUIBComponentTestHandler = class(TComponentHandler)
  protected
    function Accepts(const Component: TComponent): Boolean; override;
    procedure AddTests; override;
  end;

implementation

{ TIBXComponentTestHandler }

function TJvUIBComponentTestHandler.Accepts(const Component: TComponent): Boolean;
var
  HasDatabase, HasTransaction: Boolean;
begin
  Result := False;
  if inherited Accepts(Component) then
  begin
    HasDatabase := HasProperty(Component, 'DataBase');
    HasTransaction := HasProperty(Component, 'Transaction');
    Result := HasDatabase and HasTransaction;
  end;
end;

procedure TJvUIBComponentTestHandler.AddTests;
begin
  inherited;
  CheckProperties(['DataBase', 'Transaction']);
end;

initialization
  OpenCTF.Add(TJvUIBComponentTestHandler.Create(TComponent));

end.
