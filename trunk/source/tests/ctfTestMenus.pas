(** license **)
unit ctfTestMenus;

interface
uses OpenCTF, TestFrameWork, Classes;

type
  TMenuItemHandler = class(TComponentHandler)
  protected
    function Accepts(const Component: TComponent): Boolean; override;
    procedure AddTests; override;
  end;

implementation
uses Menus;

{ TMenuItemHandler }

function TMenuItemHandler.Accepts(const Component: TComponent): Boolean;
begin
  Result := inherited Accepts(Component);

  // exclude menu items if they are separator lines or have submenu entries
  if Result then with TMenuItem(Component) do
    Result := (not IsLine) and (Count=0)
    
end;

procedure TMenuItemHandler.AddTests;
begin
  inherited;
  CheckProperties(['OnClick']);
end;

initialization
  OpenCTF.Add(TMenuItemHandler.Create(TMenuItem));

end.

