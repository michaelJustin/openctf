unit ctfStandardTests;

interface

implementation

uses
  OpenCTF,
  TestFrameWork,
  Generics.Collections,
  Windows, SysUtils, Classes;

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

procedure Log(const Msg: string);
begin
  OutputDebugString(PWideChar('OpenCTF ' + Msg));
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
  TRequiredPropMap = TObjectDictionary<string, TStrings>;

  TRequiredPropertiesTest = class(TComponentTest)
  private
    FCheckAssigned: Boolean;
    FProperties: TRequiredPropMap;

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
    constructor Create(Component: TComponent);

    destructor Destroy; override;

  end;

constructor TRequiredPropertiesTest.Create(Component: TComponent);
var
  SL: TStrings;
begin
  inherited Create(Component);

  FCheckAssigned := True;
  FProperties := TRequiredPropMap.Create([doOwnsValues]);

  // DBControls: check for DataSource / DataField
  SL := TStringlist.Create;
  SL.Add('DataField');
  SL.Add('DataSource');
  FProperties.Add('DBCtrls', SL);

  // DBClient: check for ProviderName
  SL := TStringlist.Create;
  SL.Add('ProviderName');
  FProperties.Add('DBClient', SL);

  // SqlExpr: check for Connection
  SL := TStringlist.Create;
  SL.Add('SQLConnection');
  FProperties.Add('SqlExpr', SL);

  // Provider: check for DataSet
  SL := TStringlist.Create;
  SL.Add('DataSet');
  FProperties.Add('Provider', SL);
end;

destructor TRequiredPropertiesTest.Destroy;
begin
  FProperties.Clear;
  FProperties.Free;

  inherited;
end;

procedure TRequiredPropertiesTest.RunTest(testResult: TTestResult);
var
  CI: Integer;
  I: Integer;
  UnitName: string;
  Comp: TComponent;
  S: string;
  PropName: string;
  SL: TStrings;
begin
  inherited;

  for CI := 0 to Component.ComponentCount - 1 do
  begin
    Comp := Component.Components[CI];

    for UnitName in FProperties.Keys do
    begin

      // skip components in wrong units
      if (Comp.UnitName <> UnitName) then
      begin
        // Log(Comp.UnitName +' '+UnitName);
        Continue;
      end;

      // get required property names for components in this unit
      FProperties.TryGetValue(UnitName, SL);

      for I := 0 to SL.Count - 1 do
      begin
        PropName := SL[I];
        if HasProperty(Comp, PropName) then
        begin
          if FCheckAssigned <> HasPropValue(Comp, PropName) then
          begin
            if FCheckAssigned then
              S := S + (Comp.Name + '.' + PropName + ' is not assigned.') +
                #13#10
            else
              S := S + (Comp.Name + '.' + PropName + ' is assigned.') + #13#10;
          end;
        end;
      end;
    end;
  end;

  if S <> '' then
    Fail('Missing properties:' + #13#10 + S);
end;

type
  TRequiredEvtMap = TObjectDictionary<string, TStrings>;

  (**
     * \class TRequiredEventsTest
     * \brief Tests the existence of an event handler.
     *)
  TRequiredEventsTest = class(TComponentTest)
  private
    FCheckAssigned: Boolean;
    FEvents: TRequiredEvtMap;

  protected
    (**
     * \brief Run the test.
     *)
    procedure RunTest(testResult: TTestResult); override;

  public
    (**
     * \brief Creates a TRequiredEventsTest instance.
     * \param Component the component to be tested.
     * \param EventNames array of the names of events
     * \param CheckAssigned if true, the test fails if at least one event
     * handler is missing (unassigned);
     * if false, the test fails if at least one event handler is assigned
     *)
    constructor Create(Component: TComponent);

    destructor Destroy; override;

  end;

  { TRequiredEventsTest }

constructor TRequiredEventsTest.Create(Component: TComponent);
var
  SL: TStrings;
begin
  inherited Create(Component);

  FCheckAssigned := True;
  FEvents := TRequiredEvtMap.Create([doOwnsValues]);

  // DBClient: check for OnPostError OnReconcileError
  SL := TStringlist.Create;
  SL.Add('OnPostError');
  SL.Add('OnReconcileError');
  FEvents.Add('DBClient', SL);
end;

destructor TRequiredEventsTest.Destroy;
begin
  FEvents.Clear;
  FEvents.Free;

  inherited;
end;

procedure TRequiredEventsTest.RunTest(testResult: TTestResult);
var
  CI: Integer;
  I: Integer;
  UnitName: string;
  Comp: TComponent;
  S: string;
  PropName: string;
  SL: TStrings;
begin
  inherited;

  for CI := 0 to Component.ComponentCount - 1 do
  begin
    Comp := Component.Components[CI];

    for UnitName in FEvents.Keys do
    begin

      // skip components in wrong units
      if (Comp.UnitName <> UnitName) then
      begin
        // Log(Comp.UnitName +' '+UnitName);
        Continue;
      end;

      // get required property names for components in this unit
      FEvents.TryGetValue(UnitName, SL);

      for I := 0 to SL.Count - 1 do
      begin
        PropName := SL[I];
        if HasProperty(Comp, PropName) then
        begin
          if FCheckAssigned <> HasEventHandler(Comp, PropName) then
          begin
            if FCheckAssigned then
              S := S + (Comp.Name + '.' + PropName + ' is not assigned.') +
                #13#10
            else
              S := S + (Comp.Name + '.' + PropName + ' is assigned.') + #13#10;
          end;
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
    Tests.Add(TRequiredPropertiesTest.Create(F));
    Tests.Add(TRequiredEventsTest.Create(F));
  end;
end;

initialization

  OpenCTF.Add(TExampleCollector.Create);

end.

