unit ctfStandardTests;

interface

implementation

uses
  OpenCTF,
  TestFrameWork,
  SysUtils, Classes;

// an example test collector implementation ----------------------------------
(*
  the collector knows all forms
  the collector is responsible for building tests
  the collector is not responsible for building a test hierarchy

  *)

type
  TExampleCollector = class(TTestCollector)
  public
    procedure Build; override;
  end;

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
  C: TComponent;
begin
  inherited;

  for I := 0 to Component.ComponentCount - 1 do
  begin
    C := Component.Components[I];
    if HasDefaultName(C) then
    begin
      S := S + (C.Name + '(' + C.ClassName + ')') + #13#10;
    end;
  end;

  if S <> '' then
    Fail(SIllegalName + #13#10 + S);
end;

// test for required properties ----------------------------------------------

type
  TRequiredPropertiesTest = class(TComponentTest)
  private
    FCheckAssigned: Boolean;
    FProperties: TStrings;

  protected
    (**
     * \brief Run the test.
     *)
    procedure RunTest(testResult: TTestResult); override;

  public
    (**
     * \brief Creates a TRequiredPropertiesTest instance.
     * \param Component the component to be tested.
     * \param PropertyNames array of the names of properties
     * \param CheckAssigned if true, the test fails if at least one property
     * is unassigned; if false, the test fails if at least one property
     * is assigned
     *)
    constructor Create(Component: TComponent;
      const PropertyNames: array of string; const CheckAssigned: Boolean =
      True);

    destructor Destroy; override;

  end;

constructor TRequiredPropertiesTest.Create(Component: TComponent;
  const PropertyNames: array of string; const CheckAssigned: Boolean = True);
var
  I: Integer;
begin
  inherited Create(Component);

  FCheckAssigned := CheckAssigned;
  FProperties := TStringlist.Create;

  for I := 0 to Length(PropertyNames) - 1 do
    FProperties.Add(PropertyNames[I]);
end;

destructor TRequiredPropertiesTest.Destroy;
begin
  FProperties.Clear;
  FProperties.Free;

  inherited;
end;

procedure TRequiredPropertiesTest.RunTest(testResult: TTestResult);
var
  I: Integer;
  N: Integer;
  C: TComponent;
  S: string;
  P: string;
begin
  inherited;

  for N := 0 to Component.ComponentCount - 1 do
  begin
    C := Component.Components[N];

    for I := 0 to FProperties.Count - 1 do
    begin
      P := FProperties[I];
      if HasProperty(C, P) then
      begin
        if FCheckAssigned <> HasPropValue(C, P) then
        begin
          if FCheckAssigned then
            S := S + (C.Name + '.' + P + ' is not assigned.') + #13#10
          else
            S := S + (C.Name + '.' + P + ' is assigned.') + #13#10;
          Break;
        end;
      end;
    end;
  end;

  if S <> '' then
    Fail('Missing properties:' + #13#10 + S);
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
    Tests.Add(TRequiredPropertiesTest.Create(F, ['DataSource', 'DataField']));
  end;
end;

initialization

  OpenCTF.Add(TExampleCollector.Create);

end.

