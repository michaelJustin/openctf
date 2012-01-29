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

type
  TExampleCollector = class(TTestCollector)
  public
  procedure Build; override;
  end;
implementation

uses
  TestFrameWork,
  SysUtils;

// test for empty form -------------------------------------------------------

resourcestring
  SEmpty = 'Empty form (or datamodule).';

type
  TEmptyFormTest = class(TComponentTest)
  protected
    procedure RunTest(testResult: TTestResult); override;
  end;

procedure TEmptyFormTest.RunTest;
begin
  if Component.ComponentCount = 0 then
    Fail(SEmpty);
end;

// test for default component names ------------------------------------------
resourcestring
  SIllegalName = 'Avoid default names for components (e.g. Button1: TButton)';

type
  TComponentNameTest = class(TComponentTest)
  protected
    procedure RunTest(testResult: TTestResult); override;
  end;

procedure TComponentNameTest.RunTest;
var
  I: Integer;
  S: string;
begin
  inherited;

  for I := 0 to Component.ComponentCount - 1 do
  begin
    if HasDefaultName(Component.Components[I]) then
    begin
      S := S + (Component.Components[I].Name) + #13#10;
    end;
  end;

  if S <> '' then
    Fail(SIllegalName + #13#10 + S);
end;

{ TExampleCollector }

procedure TExampleCollector.Build;
var
  F: TComponent;
begin
  for F in Forms do
  begin
    Tests.Add(TEmptyFormTest.Create(F));
    Tests.Add(TComponentNameTest.Create(F));
  end;
end;

initialization

  OpenCTF.Add(TExampleCollector.Create);



end.

