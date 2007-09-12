(** license **)
unit ctfTestRave;

interface
uses OpenCTF, TestFrameWork, Classes;

type
  TComponentNameTestHandler = class(TComponentHandler)
  protected
    function Accepts(const Component: TComponent): Boolean; override;
    procedure AddTests; override;
  end;

  TRvProjectTest = class(TComponentTest)
  protected
    procedure RunTest(testResult: TTestResult); override;
  end;

implementation
uses RpRave, SysUtils;

{ TComponentNameTestHandler }

function TComponentNameTestHandler.Accepts(const Component: TComponent):
  Boolean;
begin
  Result := inherited Accepts(Component) and (Copy(Component.ClassName, 1, 3) = 'TRv');
end;

procedure TComponentNameTestHandler.AddTests;
begin
  inherited;
  if CurrentComponent is TRvProject  then
  begin
    CheckProperties(['Engine']);
    AddTest(TRvProjectTest.Create(CurrentComponent, 'TestRvProjectFile'));
  end;
end;

{ TRvProjectTest }

procedure TRvProjectTest.RunTest(testResult: TTestResult);
var
  P: TRvProject;
begin
  inherited;
  P := TRvProject(Component);

  if P.ProjectFile = '' then
    Fail('ProjectFile not specified');

  if not FileExists(P.ProjectFile) then
    Fail('ProjectFile does not exist');

  if ExtractFileDrive(P.ProjectFile) <> '' then
    Fail('ProjectFile should not use an absolute path');


end;

initialization
  OpenCTF.Add(TComponentNameTestHandler.Create(TComponent));

end.

