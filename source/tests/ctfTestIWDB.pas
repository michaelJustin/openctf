(** license **)
unit ctfTestIWDB;

interface
uses OpenCTF, TestFrameWork, Classes;

type
  TIWDBControlTestHandler = class(TComponentHandler)
  protected
    function Accepts(const Component: TComponent): Boolean; override;
    procedure AddTests; override;
  end;

implementation
uses IWControl;

{ TIWDBControlTestHandler }

function TIWDBControlTestHandler.Accepts(const Component: TComponent): Boolean;
begin
  Result := inherited Accepts(Component) and (Copy(Component.ClassName, 1, 5)='TIWDB');
end;

procedure TIWDBControlTestHandler.AddTests;
begin
  inherited;

  if HasProperty(CurrentComponent, 'DataField') then
    CheckProperties(['DataField', 'DataSource'])
  else
    CheckProperties(['DataSource']);
    
end;

initialization
  OpenCTF.Add(TIWDBControlTestHandler.Create(TIWCustomControl));

end.
