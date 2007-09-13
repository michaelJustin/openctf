(*
    OpenCTF - Component Test Framework
    Copyright (c) 2007  Michael Justin

    This program is free software; you can redistribute it and/or modify it
    under the terms of the GNU General Public License as published by the
    Free Software Foundation; either version 2 of the License, or (at your
    option) any later version.

    This program is distributed in the hope that it will be useful, but
    WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
    or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
    for more details.

    You should have received a copy of the GNU General Public License along
    with this program; if not, write to the Free Software Foundation, Inc.,
    59 Temple Place, Suite 330, Boston, MA 02111-1307 USA

    *)
	
unit ctfTestDB;

interface
uses OpenCTF, TestFrameWork, DB, Classes;

resourcestring
  SMissingParamValue = 'Missing parameter value for input parameter';

type
  TCustomConnectionTestHandler = class(TComponentHandler)
  protected
    procedure AddTests; override;
  end;

  TCustomConnectionTest = class(TComponentTest)
  protected
    procedure RunTest(testResult: TTestResult); override;
  end;

  TDataSetTestHandler = class(TComponentHandler)
  protected
    procedure AddTests; override;
  end;

  TDataSetTest = class(TComponentTest)
  protected
    procedure RunTest(testResult: TTestResult); override;
  end;

  TDataSourceTestHandler = class(TComponentHandler)
  protected
    procedure AddTests; override;
  end;

  TFieldTestHandler = class(TComponentHandler)
  protected
    procedure AddTests; override;
  end;

  TParamTestHandler = class(TComponentHandler)
  protected
    function Accepts(const Component: TComponent): Boolean; override;
    procedure AddTests; override;
  end;

  TParamTest = class(TAbstractTest)
  private
    FParam: TParam;
    FComponent: TComponent;

    property Param: TParam read FParam;
    property Component: TComponent read FComponent;

  protected
    procedure RunTest(testResult: TTestResult); override;

  public
    constructor Create(Component: TComponent; Param: TParam);
  end;

  TDbAwareComponentTestHandler = class(TComponentHandler)
  protected
    function Accepts(const Component: TComponent): Boolean; override;
    function Handles(const Form: TComponent): Boolean; override;
    procedure AddTests; override;
  end;

implementation
uses Forms, TypInfo, SysUtils;

{ TDataSetTestHandler }

procedure TDataSetTestHandler.AddTests;
begin
  CurrentSuite.AddTest(TDataSetTest.Create(CurrentComponent));
end;

{ TDataSetTest }

procedure TDataSetTest.RunTest(testResult: TTestResult);
var
  TmpOnCalc: TDataSetNotifyEvent;
begin
  inherited;

  with TDataSet(Component) do
  begin
    AfterOpen := nil;
    BeforeOpen := nil;
    AfterClose := nil;
    BeforeClose := nil;
    AfterScroll := nil;
    BeforeScroll := nil;
    TmpOnCalc := OnCalcFields;
    OnCalcFields := nil;

    if Assigned(DataSource) then
    begin
      DataSource.OnDataChange := nil;
      DataSource.OnStateChange := nil;
      DataSource.OnUpdateData := nil;
    end;

  end;

  with TDataSet(Component) do
  begin
    try
      Open;
    except
      on E: Exception do
        Fail('TDataSetTest/open: ' + E.Message);
    end;
    try
      Close;
    except
      on E: Exception do
        Fail('TDataSetTest/close: ' + E.Message);
    end;

    OnCalcFields := TmpOnCalc;
  end;
end;

{ TDataSourceTestHandler }

procedure TDataSourceTestHandler.AddTests;
begin
  CheckProperties(['DataSet']);
end;

{ TFieldTestHandler }

procedure TFieldTestHandler.AddTests;
begin
  with TField(CurrentComponent) do
  if Calculated then
    CurrentSuite.AddTest(TRequiredEventsTest.Create(DataSet, ['OnCalcFields']));
end;

{ TCustomConnectionTestHandler }

procedure TCustomConnectionTestHandler.AddTests;
begin
  CurrentSuite.AddTest(TCustomConnectionTest.Create(CurrentComponent));
end;

{ TCustomConnectionTest }

procedure TCustomConnectionTest.RunTest(testResult: TTestResult);
begin
  inherited;
  with TCustomConnection(Component) do
  begin
    CheckFalse(Connected, 'Connected at design time');
  end;
end;

{ TParamTest }

constructor TParamTest.Create(Component: TComponent; Param: TParam);
begin
  inherited Create(Param.Name);
  FComponent := Component;
  FParam := Param;
  Param.DataType
end;

procedure TParamTest.RunTest(testResult: TTestResult);
begin
  inherited;

  if Trim(Param.Name)='' then
    Fail( 'Parameter name is empty');
  if Param.DataType = ftUnknown then
    Fail('DataType = ftUnknown');
  if Param.ParamType = ptUnknown then
    Fail('ParamType = ptUnknown');

  if (Param.ParamType = ptInput) and (Param.Text = '') then
  begin
    if Component is TDataSet then
    begin
      with TDataSet(Component) do
      begin
        if Assigned(DataSource) and Assigned(DataSource.DataSet) then
          if Assigned(DataSource.DataSet.FindField(Param.Name)) then
            // found it ! no error !
          else
            Fail(SMissingParamValue)
        else
          Fail(SMissingParamValue);
      end;
    end
    else
      Fail(SMissingParamValue);
  end
end;

{ TParamTestHandler }

function TParamTestHandler.Accepts(const Component: TComponent): Boolean;
var
  Clazz: TClass;
begin
  Result := False;
  if HasProperty(Component, 'Params') then
  begin
    Clazz := GetObjectPropClass(Component, 'Params');
    if Assigned(Clazz) then
      if Clazz = TParams then
        Result := TParams(GetObjectProp(Component, 'Params')).Count > 0;
  end;
end;

procedure TParamTestHandler.AddTests;
var
  I: Integer;
  Params: TParams;
  TmpParam: TParam;
  TmpSuite: ITestSuite;
begin
  inherited;

  TmpSuite := TTestSuite.Create(CurrentComponent.Name + ' params');

  Params := TParams(GetObjectProp(CurrentComponent, 'Params'));
  with Params do
  begin
    for I := 0 to Count - 1 do
    begin
      TmpParam := Params[I];
      TmpSuite.AddTest(TParamTest.Create(CurrentComponent, TmpParam));
    end;
  end;

  CurrentSuite.AddSuite(TmpSuite);

end;

{ TDbAwareComponentTestHandler }

function TDbAwareComponentTestHandler.Accepts(const Component: TComponent):
  Boolean;
var
  HasDataSource, HasDataField: Boolean;
begin
  if inherited Accepts(Component) then
  begin
    HasDataSource := HasProperty(Component, 'DataSource');
    HasDataField := HasProperty(Component, 'DataField');
    Result := HasDataSource and HasDataField;
  end else begin
    Result := False;
  end;
end;

procedure TDbAwareComponentTestHandler.AddTests;
begin
  CheckProperties(['DataSource', 'DataField']);
end;

function TDbAwareComponentTestHandler.Handles(const Form: TComponent): Boolean;
begin
  Result := Form is TCustomForm; // data aware components are only on forms
end;

initialization
  OpenCTF.Add(TCustomConnectionTestHandler.Create(TCustomConnection));
  OpenCTF.Add(TFieldTestHandler.Create(TField));
  OpenCTF.Add(TDataSetTestHandler.Create(TDataSet));
  OpenCTF.Add(TDataSourceTestHandler.Create(TDataSource));
  OpenCTF.Add(TParamTestHandler.Create(TParam));
  OpenCTF.Add(TDbAwareComponentTestHandler.Create(TComponent, 'DbAwareComponent Tests')); 

end.

