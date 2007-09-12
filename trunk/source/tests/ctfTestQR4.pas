(** license **)
unit ctfTestQR4;

interface
uses OpenCTF, TestFrameWork, Classes;

type
  TQR4TestHandler = class(TComponentHandler)
  protected
    function Accepts(const Component: TComponent): Boolean; override;
    procedure AddTests; override;
  end;

  TQR4ProjectTest = class(TComponentTest)
  protected
    procedure RunTest(testResult: TTestResult); override;
  end;

implementation
uses SysUtils;

{ TQR4TestHandler }

function TQR4TestHandler.Accepts(const Component: TComponent):
  Boolean;
begin
  Result := inherited Accepts(Component) and (Copy(Component.ClassName, 1, 5) =
    'TQRDB');
end;

procedure TQR4TestHandler.AddTests;
begin
  inherited;

  if HasProperty(CurrentComponent, 'DataField') then
    CheckProperties(['DataField']);

  if HasProperty(CurrentComponent, 'DataSet') then
    CheckProperties(['DataSet'])

end;

{ TQR4ProjectTest }

procedure TQR4ProjectTest.RunTest(testResult: TTestResult);
begin
  inherited;
end;

initialization
  OpenCTF.Add(TQR4TestHandler.Create(TComponent));

end.

