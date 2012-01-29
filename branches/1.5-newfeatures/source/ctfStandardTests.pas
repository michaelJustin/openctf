unit ctfStandardTests;

interface

  (*
    the collector knows all forms
    the collector is responsible for building tests
    the collector is not responsible for building a test hierarchy

    *)

uses
  OpenCTF,
  CTFInterfaces,
  Classes;
(*ctfTestForm,
ctfTestFrame,
ctfTestNames,
ctfTestControls,
ctfTestComCtrls*)

type
  TExampleCollector = class(TTestCollector)
  public
  procedure Build; override;
  end;
implementation

uses
  TestFrameWork,
  SysUtils;

resourcestring
  SEmpty = 'Empty form (or datamodule).';

type
  TEmptyFormTest = class(TComponentTest)
  protected
    procedure RunTest(testResult: TTestResult); override;
  end;

  { TEmptyFormTest }

procedure TEmptyFormTest.RunTest;
begin
  if Component.ComponentCount = 0 then
    Fail(SEmpty);
end;

{ TExampleCollector }

procedure TExampleCollector.Build;
var
  F: TComponent;
begin
  for F in Forms do
    Tests.Add(TEmptyFormTest.Create(F, F.Name));
end;

initialization

  OpenCTF.Add(TExampleCollector.Create);

  // OpenCTF.Add(TTComponentHandler.Create(TComponent, 'Empty form'));

  // OpenCTF.Add(TComponentNameTestHandler.Create(TComponent, 'Component name tests'));

  // OpenCTF.Add(TFrameTestHandler.Create(TFrame, 'Frame tests'));

  // OpenCTF.Add(TImageListHandler.Create(TImageList, 'TImageList tests'));

  // OpenCTF.Add(TTabSheetHandler.Create(TTabSheet));

end.

