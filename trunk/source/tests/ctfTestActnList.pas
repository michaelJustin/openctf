(** license **)
unit ctfTestActnList;

interface
uses OpenCTF, TestFrameWork, ActnList, Classes;
 
type
  TCustomActionListTestHandler = class(TComponentHandler)
  protected
    procedure AddTests; override;
  end;

  TContainedActionTest = class(TComponentTest)
  protected
    procedure RunTest(testResult: TTestResult); override;
  end;

implementation
uses SysUtils;

{ TCustomActionListTestHandler }

procedure TCustomActionListTestHandler.AddTests;
var
  I: Integer;
  TmpAction: TContainedAction;
  TmpSuite: ITestSuite;
begin
  inherited;
  TmpSuite := TTestSuite.Create(CurrentComponent.Name + ' actions');

  with TCustomActionList(CurrentComponent) do
  begin
    for I := 0 to ActionCount - 1 do
    begin
      TmpAction := Actions[I];
      if TmpAction.ClassNameIs('TAction') then
        // check if the OnExecute event handler is assigned
        TmpSuite.AddTest(TRequiredEventsTest.Create(TmpAction, ['OnExecute']));
        // special checks for the Action
        // todo needs a filter and a test item description text
        // TmpSuite.AddTest(TContainedActionTest.Create(TmpAction));
    end;
  end;

  if TmpSuite.CountTestCases > 0 then
    CurrentSuite.AddSuite(TmpSuite);

end;

{ TContainedActionTest }

procedure TContainedActionTest.RunTest(testResult: TTestResult);
var
  TmpAction: TContainedAction;
  Name: TComponentName;
  ImageIndex: Integer;
begin
  inherited;

  TmpAction := TContainedAction(Component);
  Name := Component.Name;

  if TmpAction is TCustomAction then
  begin
    ImageIndex := TCustomAction(TmpAction).ImageIndex;
    if ImageIndex <> -1 then
      Check(Assigned(TmpAction.ActionList.Images),
        Name + '.ImageIndex=' + IntToStr(ImageIndex)
          + ' but ' + TmpAction.ActionList.Name
          + '.Images property is not assigned.');
  end;

end;

initialization
  OpenCTF.Add(TCustomActionListTestHandler.Create(TCustomActionList));

end.

