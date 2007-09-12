(** license **)
unit ctfTestGlobalization;

interface
uses OpenCTF, ActnMan, TestFrameWork, Classes;

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
uses ActnMenus, SysUtils;

{ TCustomActionListTestHandler }

procedure TCustomActionListTestHandler.AddTests;
begin
  inherited;

  AddTest(TContainedActionTest.Create(CurrentComponent));
end;

{ TContainedActionTest }

procedure TContainedActionTest.RunTest(testResult: TTestResult);
var
  I: Integer;
  TmpActionClientItem: TActionClientItem;
begin
  inherited;

  // see http://www.tsilang.com/delphiglobalizationtool_faq.html#10:
  // to localize a TActionMainMenuBar, all TActionClientItems should be
  // linked to a 'fake' Action
  with TActionMainMenuBar(Component) do
  begin
    for I := 0 to ActionClient.Items.Count - 1 do
    begin
      TmpActionClientItem := ActionClient.Items[I];
      if not Assigned(TmpActionClientItem.Action) then
        Fail(TmpActionClientItem.Caption + ' - no Action assigned');
    end;
  end;

end;

initialization
  OpenCTF.Add(TCustomActionListTestHandler.Create(TActionMainMenuBar));

end.

