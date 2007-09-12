(** license **)
unit ctfTestFrame;

interface
uses OpenCTF, TestFrameWork, Classes;

type
  TFrameTestHandler = class(TComponentHandler)
  protected
    procedure AddTests; override;
  end;

  TFrameTest = class(TFormTest)
  protected
    procedure RunTest(testResult: TTestResult); override;
  end;

implementation
uses ctfUtils, Forms;

resourcestring
  SIllegalName = 'Avoid default names for frames (e.g. Frame21: TFrame2)';

{ TFrameTestHandler }

procedure TFrameTestHandler.AddTests;
begin
  inherited;
  AddTest(TFrameTest.Create(CurrentComponent, 'TestDefaultName'));
end;

{ TFrameTest }

procedure TFrameTest.RunTest(testResult: TTestResult);
begin
  inherited;
  if HasDefaultName(Form) then
    Fail(SIllegalName);
end;

initialization
  OpenCTF.Add(TFrameTestHandler.Create(TFrame));

end.
