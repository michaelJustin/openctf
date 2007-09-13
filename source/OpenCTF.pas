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
	
(**
 * \file OpenCTF.pas
 * \brief The Open Component Test Framework main unit.
 *)
unit OpenCTF;

interface
uses CTFInterfaces, TestFramework, TypInfo, Contnrs, Classes;

const
  CTF_NAME = 'OpenCTF';
  CTF_VER = '0.9.6';
  CTF_NAME_VER = CTF_NAME + ' ' + CTF_VER;

type
  (**
   * \class TComponentHandler
   * \brief A test handler for a given type of components.
   *
   * \li The method TComponentHandler#Accepts controls which components will
   * be tested, it can be overriden to change the default behaviour.
   *
   *)
  TComponentHandler = class(TInterfacedObject, IComponentHandler)
  private
    FComponent: TComponent;
    FComponentClass: TClass;
    FSuiteName: string;
    procedure SetForm(const Value: TComponent);
    function GetForm: TComponent;

  protected
    CurrentSuite: ITestSuite;
    CurrentComponent: TComponent;

    (**
     * \brief This methods decides if the passed component should be included in the
     * test suite. The default implementation checks if the component class
     * is a subclass of the handled class. This method may be overriden to add
     * more filter conditions.
     *
     *
     * \param Component the component to be checked
     *)
    function Accepts(const Component: TComponent): Boolean; virtual;

    (**
     * \brief this method is a shortcut for CurrentSuite.AddTest(...));
     * \param Test the test that will be added to the CurrentSuite
     *)
    procedure AddTest(const Test: ITest);

    (**
     * \brief Adds all component tests for the component to the test suite.
     *
     * \li If you write a new component handler, you have to provide an
     * implementation of this method.
     *
     * Example:
     *
     * \code
     * procedure TMenuItemHandler.AddTests;
     * begin
     *   inherited;
     *   CurrentSuite.AddTest(TMenuItemTest.Create(CurrentComponent));
     * end;
     * \endcode
     *
     *)
    procedure AddTests; virtual; abstract;

    (**
     * \brief Adds tests for the form to the test suite.
     *
     * \li To add tests for the form, overwrite the empty default declaration of this method.
     *
     *)
     procedure AddFormTests; virtual;

    (**
     * \brief Checks for assigned event handlers.
     *
     * \code
     * procedure TCustomClientDataSetTestHandler.AddTests(const SubComponent: TComponent);
     * begin
     *   inherited;
     *   // check if the OnReconcileError event handler is assigned
     *   CheckEvents(['OnReconcileError']);
     *   // check if the ProviderName property is assigned
     *   CheckProperties(['ProviderName']);
     * end;
     * \endcode
     *)
    procedure CheckEvents(const Events: array of string);

    (**
     * \brief Checks for unassigned event handlers.
     * \sa CheckEvents
     *)
    procedure CheckUnassignedEvents(const Events: array of string);

    (**
     * \brief Checks for assigned properties.
     *
     * \code
     * procedure TDbAwareComponentTestHandler.AddTests(const
     *   SubComponent: TComponent);
     * begin
     *   CheckProperties(['DataSource', 'DataField']);
     * end;
     * \endcode
     *)
    procedure CheckProperties(const Properties: array of string);

    (**
    * \brief Check for unassigned properties.
    * \sa CheckProperties
    *)
    procedure CheckUnassignedProperties(const Properties: array of string);

    (**
     * \brief Form filter method.
     * This method decides if the handler will generate test cases for the
     * given form.
     *
     * The default implementation always returns True.
     *
     * If you write a component handler, you can overwrite this method to
     * allow only special form classes to be processed.
     *
     * For example, a component handler for visual components can overwrite
     * this method and check if the passed parameter is a subclass of
     * TCustomForm:
     * \code
     * Result := Form is TCustomForm;
     * \endcode
     *
     * \param Form The form (or datamodule) to be tested.
     *)
    function Handles(const Form: TComponent): Boolean; virtual;

    (**
     * \brief Checks for the existence of a property.
     *)
    function HasProperty(const Component: TComponent; const PropName: string;
      const AKinds: TTypeKinds = []): Boolean;

    (**
     * \property Form
     * \brief The form or datamodule which will be tested
     *)
    property Form: TComponent read GetForm write SetForm;

  public
    (**
     * \brief Creates a handler instance.
     * This constructor will create a handler instance which will by default
     * generate a test for every component in the form (or datamodule) which
     * is a subtype of the given component class.
     *
     * \param ComponentClass the component class which will be accepted (and
     * tested).
     * \param Suitename optional test suite name
     *)
    constructor Create(const ComponentClass: TClass; const Suitename: string =
      '');

    destructor Destroy; override;

    (**
     * \brief Get the test suite.
     *)
    function GetSuite: ITestSuite;

  end;

  (**
   * \class THandlerManager
   * \brief An instance of class contains a list of registered test handlers
   * (objects which implement IComponentHandler) and iterates over this list
   * to build the DUnit test suite with all component tests.
   *
   * The only instance of this class is declared and initialized in the OpenCTF
   * main unit (OpenCTF.pas).
   *
   *)
  THandlerManager = class(TObject)
  private
    HandlerList: TInterfaceList;

    (**
     * \constructor Create
     *)
    constructor Create;

    (**
     * \brief Iterate over test handler list and add test suites to main suite
     * \param Suite the TComponentTestSuite instance.
     * \param Form the form or datamodule which will be tested
     * \sa TComponentTestSuite#Create
     *)
    procedure AddSuites(const Suite: ITestSuite; const Form: TComponent);

  public
    (**
     * \destructor Destroy
     *)
    destructor Destroy; override;

    (**
     * \brief Add a component handler.
     *
     * The method THandlerManager#Add adds a new component handler to the
     * handler list.
     *
     * This procedure usually appears in the initialization section of
     * units which contain specialized subclasses of TComponentHandler and
     * TComponentTest.
     *
     * \code
     * initialization
     * OpenCTF.Add(TCustomActionListTestHandler.Create(TCustomActionList));
     * \endcode
     *
     *)
    procedure Add(const Handler: IComponentHandler);

  end;

  (**
   * \class TFormTest
   * \brief The base class for all unit test classes for a given form.
   *)
  TFormTest = class(TAbstractTest)
  private
    FForm: TComponent;

  protected
    (**
     * \property Form
     * \brief the Form to be tested.
     *)
    property Form: TComponent read FForm;

  public
    (**
     * \brief Creates a TFormTest instance.
     * \param Form the form to be tested.
     * \param Testname optional test name.
     *)
    constructor Create(Form: TComponent; const Testname: string = '');

  end;

  (**
   * \class TComponentTest
   * \brief The base class for all unit test classes for a given component.
   * Subclasses of this class implement component-specific tests.
   * Two subclasses (TRequiredEventsTest and TRequiredPropertiesTest) are
   * already included in the OpenCTF core.
   *
   * \sa TRequiredEventsTest
   * \sa TRequiredPropertiesTest
   *)
  TComponentTest = class(TAbstractTest)
  private
    FComponent: TComponent;

  protected
    (**
     * \property Component
     * \brief the component to be tested.
     *)
    property Component: TComponent read FComponent;

  public
    (**
     * \brief Creates a TComponentTest instance.
     * \param Component the component to be tested.
     * \param Testname optional test name.
     *)
    constructor Create(Component: TComponent; const Testname: string = '');

  end;

  (**
   * \class TComponentTestSuite
   *
   * \brief This class creates the complete test suite for a given form or
   * datamodule.
   *
   * It is used internally by the procedures RegisterForm and RegisterForms.
   *
   * \sa RegisterForm
   * \sa RegisterForms
   *)
  TComponentTestSuite = class(TTestSuite)
  private
    (**
     * \brief Creates a TComponentTestSuite instance.
     * \param Form the form (or datamodule) to be tested.
     *)
    constructor Create(const Form: TComponent);
  end;

  (**
   * \class TRequiredEventsTest
   * \brief Tests the existence of an event handler.
   *)
  TRequiredEventsTest = class(TComponentTest)
  private
    FCheckAssigned: Boolean;
    FEvents: TStrings;

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
    constructor Create(Component: TComponent; const EventNames: array of string;
      const CheckAssigned: Boolean = True);

    destructor Destroy; override;

  end;

  (**
   * \class TRequiredPropertiesTest
   * \brief Tests the existence of a property.
   *)
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

  (**
   * \brief Create a OpenCTF test suite for the given form and register it with DUnit.
   *
   * \code
   * RegisterForm(Form1);
   * \endcode
   *
   * This is a shortcut for this DUnit procedure call:
   *
   * \code
   * TestFramework.RegisterTest(OpenCTF.TComponentTestSuite.Create(Form1));
   * \endcode
   *)
procedure RegisterForm(const Form: TComponent);

(**
 * \brief For each form, create a OpenCTF test suite and register it with DUnit
 * \sa RegisterForm
 *)
procedure RegisterForms(const Forms: array of TComponent); overload;

(**
 * \brief For each form which has been created using Application.CreateForm,
 * create a OpenCTF test suite and register it with DUnit
 * \sa UnregisterForms
 *)
procedure RegisterForms; overload;

(**
 * \brief Free all forms which have been created using Application.CreateForm
 * in reverse order.
 * \sa RegisterForms
 *)
procedure UnregisterForms;

function GetStringProperty(const Instance: TComponent; PropName: string): string;
function HasPropValue(Instance: TComponent; PropName: string): Boolean;

var
  HandlerManager: THandlerManager;

procedure Add(const Handler: IComponentHandler);

implementation
uses Controls, Forms, Variants, SysUtils;

procedure Add(const Handler: IComponentHandler);
begin
  HandlerManager.Add(Handler);
end;

procedure RegisterForm(const Form: TComponent);
begin
  Assert(Assigned(Form));
  TestFramework.RegisterTest(TComponentTestSuite.Create(Form));
end;

procedure RegisterForms(const Forms: array of TComponent); overload;
var
  I: Integer;
begin
  for I := 0 to Length(Forms) - 1 do
    RegisterForm(Forms[I]);
end;

procedure RegisterForms; overload;
var
  I: Integer;
begin
  for I := 0 to Application.ComponentCount - 1 do
  begin
    // skip the default HintWindow class
    if Application.Components[I].ClassNameIs('THintWindow')
      and (Application.Components[I].ClassParent = Controls.TCustomControl)
     then Continue;

    RegisterForm(Application.Components[I]);
  end;
end;

procedure UnregisterForms;
var
  I: Integer;
begin
  for I := Application.ComponentCount - 1 downto 0 do
    Application.Components[I].Free;
end;

function HasEventHandler(Instance: TObject; const PropName: string): Boolean;
var
  PropInfo: PPropInfo;
begin
  PropInfo := GetPropInfo(Instance, PropName);
  if PropInfo = nil then
    raise Exception.Create('Not found: ' + PropName)
  else
    Result := Assigned(GetMethodProp(Instance, PropInfo).Code);
end;

function GetStringProperty(const Instance: TComponent; PropName: string): string;
var
  PropInfo: PPropInfo;
begin
  Result := '';
  // get the prop info
  PropInfo := GetPropInfo(Instance, PropName);
  if PropInfo = nil then
    // raise Exception.Create('Not found: ' + PropName)
  else
  begin
    // return the right type
    case PropInfo.PropType^.Kind of
      tkString, tkLString:
        Result := GetStrProp(Instance, PropInfo);
    end;
  end;
end;

function HasPropValue(Instance: TComponent; PropName: string): Boolean;
var
  PropInfo: PPropInfo;
  SubComponentName: string;
  SubComponent: TObject;
begin
  if Pos('.', PropName) > 0 then
  begin
    SubComponentName := Copy(PropName, 1, Pos('.', PropName) - 1);
    PropName := Copy(PropName, Pos('.', PropName) + 1, Length(PropName));
    Assert(IsValidIdent(SubComponentName));
    Assert(IsValidIdent(PropName));

    PropInfo := GetPropInfo(Instance, SubComponentName);
    SubComponent := TObject(GetOrdProp(Instance, PropInfo));
    Assert(SubComponent is TComponent);
    Instance := TComponent(SubComponent);
  end;

  // get the prop info
  PropInfo := GetPropInfo(Instance, PropName);
  if PropInfo = nil then
    raise Exception.Create('Not found: ' + PropName)
  else
  begin
    // return the right type
    case PropInfo.PropType^.Kind of
      tkInteger, tkChar, tkWChar, tkClass:
        Result := GetOrdProp(Instance, PropInfo) <> 0;
      tkEnumeration:
        Result := GetEnumProp(Instance, PropInfo) <> '';
      tkSet:
        Result := GetSetProp(Instance, PropInfo) <> '';
      tkFloat:
        Result := GetFloatProp(Instance, PropInfo) <> 0;
      tkMethod:
        Result := Assigned(GetMethodProp(Instance, PropInfo).Code);
      tkString, tkLString:
        Result := GetStrProp(Instance, PropInfo) <> '';
      tkWString:
        Result := GetWideStrProp(Instance, PropInfo) <> '';
      tkVariant:
        Result := GetVariantProp(Instance, PropInfo) <> Null;
      tkInt64:
        Result := GetInt64Prop(Instance, PropInfo) <> 0;
      tkDynArray:
        Result := GetOrdProp(Instance, PropInfo) <> 0;
    else
      raise EPropertyConvertError.Create('Invalid property type ' +
        PropInfo.PropType^.Name);
    end;
  end;
end;

{ TFormTest }

constructor TFormTest.Create(Form: TComponent; const Testname: string);
begin
  inherited Create(Form.Name + ' (' + Form.ClassName + ') ' + Testname);
  FForm := Form;
end;

{ TComponentTest }

constructor TComponentTest.Create(Component: TComponent; const Testname: string
  = '');
begin
  inherited Create(Component.Name + ' (' + Component.ClassName + ') '
    + Testname);
  FComponent := Component;
end;

{ THandlerManager }

constructor THandlerManager.Create;
begin
  inherited;
  HandlerList := TInterfaceList.Create;
end;

destructor THandlerManager.Destroy;
begin
  HandlerList.Free;
  inherited;
end;

procedure THandlerManager.Add(const Handler: IComponentHandler);
begin
  HandlerList.Add(Handler);
end;

procedure THandlerManager.AddSuites(const Suite: ITestSuite; const
  Form: TComponent);
var
  I: Integer;
  Handler: IComponentHandler;
  HandlerSuite: ITestSuite;
begin
  for I := 0 to HandlerList.Count - 1 do
  begin
    Handler := IComponentHandler(HandlerList[I]);
    // check the form class
    if Handler.Handles(Form) then
    begin
      // Assign the form / datamodule
      Handler.Form := Form;
      // Get the Test Suite
      HandlerSuite := Handler.GetSuite;
      if HandlerSuite.CountTestCases > 0 then
        Suite.AddSuite(HandlerSuite);
    end;
  end;
end;

{ TComponentHandler }

constructor TComponentHandler.Create(const ComponentClass: TClass; const
  Suitename: string = '');
begin
  inherited Create;
  Assert(Assigned(ComponentClass));

  FComponentClass := ComponentClass;
  
  if Suitename = '' then
    FSuiteName := ClassName
  else
    FSuiteName := Suitename
end;

destructor TComponentHandler.Destroy;
begin

  inherited;
end;

function TComponentHandler.GetForm: TComponent;
begin
  Result := FComponent;
end;

procedure TComponentHandler.SetForm(const Value: TComponent);
begin
  FComponent := Value;
end;

function TComponentHandler.Handles(const Form: TComponent): Boolean;
begin
  Result := True;
end;

function TComponentHandler.Accepts(const Component: TComponent): Boolean;
begin
  Result := Component is FComponentClass;
end;

function TComponentHandler.HasProperty(const Component: TComponent; const
  PropName: string; const AKinds: TTypeKinds = []): Boolean;
begin
  Result := Assigned(GetPropInfo(Component, PropName, AKinds));
end;

function TComponentHandler.GetSuite: ITestSuite;
var
  I: Integer;
begin
  CurrentSuite := TTestSuite.Create(FSuiteName);
  // add form tests
  AddFormTests;
  // add component tests
  for I := 0 to Form.ComponentCount - 1 do
  begin
    CurrentComponent := Form.Components[I];
    if Accepts(CurrentComponent) then
    begin
      AddTests;
    end;
  end;
  Result := CurrentSuite;
end;

procedure TComponentHandler.AddFormTests;
begin
  // empty default implementation
end;

procedure TComponentHandler.AddTest(const Test: ITest);
begin
  CurrentSuite.AddTest(Test);
end;

procedure TComponentHandler.CheckEvents(const Events: array of string);
begin
  CurrentSuite.AddTest(TRequiredEventsTest.Create(CurrentComponent, Events));
end;

procedure TComponentHandler.CheckUnassignedEvents(const Events: array of
  string);
begin
  CurrentSuite.AddTest(TRequiredEventsTest.Create(CurrentComponent, Events,
    False));
end;

procedure TComponentHandler.CheckProperties(const Properties: array of string);
begin
  CurrentSuite.AddTest(TRequiredPropertiesTest.Create(CurrentComponent,
    Properties));
end;

procedure TComponentHandler.CheckUnassignedProperties(const Properties: array of
  string);
begin
  CurrentSuite.AddTest(TRequiredPropertiesTest.Create(CurrentComponent,
    Properties, False));
end;

{ TComponentTestSuite }

constructor TComponentTestSuite.Create(const Form: TComponent);
begin
  inherited Create(Form.Name + ' (' + Form.ClassName + ') tests' + ' [' + CTF_NAME_VER + ']');
  HandlerManager.AddSuites(Self, Form);
end;

{ TRequiredEventsTest }

constructor TRequiredEventsTest.Create(Component: TComponent;
  const EventNames: array of string; const CheckAssigned: Boolean = True);
var
  I: Integer;
begin
  FCheckAssigned := CheckAssigned;
  FEvents := TStringlist.Create;
  for I := 0 to Length(EventNames) - 1 do
    FEvents.Add(EventNames[I]);

  inherited Create(Component, 'Events: ' + FEvents.CommaText);
end;

destructor TRequiredEventsTest.Destroy;
begin
  FEvents.Clear;
  FEvents.Free;

  inherited;
end;

procedure TRequiredEventsTest.RunTest(testResult: TTestResult);
var
  I: Integer;
begin
  inherited;

  for I := 0 to FEvents.Count - 1 do
  begin
    if FCheckAssigned <> HasEventHandler(Component, FEvents[I]) then
    begin
      if FCheckAssigned then
        Fail(Component.Name + '.' + FEvents[I] + ' is not assigned.')
      else
        Fail(Component.Name + '.' + FEvents[I] + ' is assigned.');
      Break;
    end;
  end;
end;

{ TRequiredPropertiesTest }

constructor TRequiredPropertiesTest.Create(Component: TComponent;
  const PropertyNames: array of string; const CheckAssigned: Boolean = True);
var
  I: Integer;
begin
  FCheckAssigned := CheckAssigned;
  FProperties := TStringlist.Create;
  for I := 0 to Length(PropertyNames) - 1 do
    FProperties.Add(PropertyNames[I]);
  inherited Create(Component, 'Properties: ' + FProperties.CommaText);
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
begin
  inherited;

  for I := 0 to FProperties.Count - 1 do
  begin
    if FCheckAssigned <> HasPropValue(Component, FProperties[I]) then
    begin
      if FCheckAssigned then
        Fail(Component.Name + '.' + FProperties[I] + ' is not assigned.')
      else
        Fail(Component.Name + '.' + FProperties[I] + ' is assigned.');
      Break;
    end;
  end;
end;

(** \mainpage OpenCTF Documentation
 *
 * \section intro Introduction
 * OpenCTF is a test framework add-on for Borland(tm) Delphi(tm) which performs
 * automatic checks of all components in Forms (or DataModules).
 * It provides an easy way to build automatic quality checks for large projects
 * where many components have to pass repeated tests.
 * Adding OpenCTF tests to a DUnit test suite requires only a few lines of code.
 * Writing your own custom component tests needs only a few seconds.
 *
 * \image html oslogo.gif
 *
 * OpenCTF is based on the DUnit open source test framework and extends it
 * by specialized test classes and helper functions.
 * Read about DUnit: http://dunit.sourceforge.net/ An Xtreme testing framework
 * for Delphi programs.
 *
 * \li \ref howto
 *
 * OpenCTF (c) 2007 betasoft Michael Justin http://www.mikejustin.com/
 *
 * Coming soon: \c CTF.NET - component test framework for Delphi.NET
 *
 * \ref credits
 *
 * \section warranty Limited Warranty
 * THIS SOFTWARE IS PROVIDED ON AN "AS IS" BASIS. BETASOFT DISCLAIMS ALL
 * WARRANTIES RELATING TO THIS SOFTWARE, WHETHER EXPRESS OR IMPLIED, INCLUDING
 * BUT NOT LIMITED TO ANY IMPLIED WARRANTIES OF MERCHANTABILITY OR FITNESS FOR
 * A PARTICULAR PURPOSE. NEITHER BETASOFT NOR ANYONE ELSE WHO HAS BEEN INVOLVED
 * IN THE CREATION, PRODUCTION, OR DELIVERY OF THIS SOFTWARE SHALL BE LIABLE
 * FOR ANY INDIRECT, CONSEQUENTIAL, OR INCIDENTAL DAMAGES ARISING OUT OF THE
 * USE OR INABILITY TO USE SUCH SOFTWARE, EVEN IF BETASOFT HAS BEEN ADVISED OF
 * THE POSSIBILITY OF SUCH DAMAGES OR CLAIMS. THE PERSON USING THE SOFTWARE
 * BEARS ALL RISK AS TO THE QUALITY AND PERFORMANCE OF THE SOFTWARE.
 *
 * \section trademarks TRADEMARKS
 * The names of actual companies and products mentioned herein may be the
 * trademarks of their respective owners.
 * Delphi and Kylix are trademarks or registered trademarks of Borland Software
 * Corporation in the U.S. and other countries.
 * Java, JavaBean, JDK, Sun, Sun Microsystems, and the Sun Logo are trademarks
 * or registered trademarks of Sun Microsystems, Inc. in the U.S. and other
 * countries.
 * Microsoft, Windows, Windows NT, and/or other Microsoft products referenced
 * herein are either registered trademarks or trademarks of Microsoft
 * Corporation in the United States and/or other countries.
 *)

(**
 * \page howto Users guide
 *
 * \section project The project file
 *
 * OpenCTF is based on the DUnit open source test framework and extends it
 * by specialized test classes and helper functions.
 *
 * In addition to a normal DUnit project source file, the following steps
 * are required:
 *
 * \li add the OpenCTF main unit (OpenCTF.pas) to the use clause
 * \li add OpenCTF test units to the use clause
 * \li create an instance of the form(s) or datamodule(s) which you want to test
 * \li register the form(s) or datamodule(s) with OpenCTF
 *
 * The standard DUnit methods to run all tests will be ready to run then.
 *
 * \section detailled A step-by-step description
 *
 * Add the OpenCTF main unit (OpenCTF.pas) to the use clause
 * \code
 * program Testsuite;
 * uses
 * // OpenCTF main unit
 * OpenCTF,
 * \endcode
 *
 * Add OpenCTF test units to the use clause:
 * \code
 * // auto-register tests (see unit initialization)
 * ctfTestActnList, ctfTestDBClient, ctfTestProvider, ctfTestDb
 * \endcode
 *
 * \note The included test definition classes are provided as examples only.
 *
 * Create an instance of the form(s) or datamodule(s) which you want to test
 * \code
 * begin
 * // create form instances
 * Form1 := TForm1.Create(nil);
 * \endcode
 *
 * Register the form(s) or datamodule(s) with OpenCTF
 * \code
 * RegisterForm(Form1);
 * \endcode
 *
 * Now you are ready to go with the DUnit tests:
 * \code
 * // use GUI runner to run the tests
 * TGUITestRunner.RunRegisteredTests;
 * \endcode
 *
 * Running the tests
 * \image html OpenCTF.gif "Example screenshot using GUITestrunner"
 *)

 (**
 * Example project, testing two forms and one datamodule.
 * \example Testsuite.dpr
 * Running the tests
 * \image html OpenCTF.gif "Example screenshot using GUITestrunner"
 *)

(**
 * Example test handler for action lists.
 * This test iterates over all contained actions in the action list.
 * \example ctfTestActnList.pas
 *)

(**
 * Example test handler for ADO components.
 * This test checks descendants of TCustomADODataSet for an assigned Connection
 * property.
 * \example ctfTestADO.pas
 *)

(**
 * Example test handler for components on the Win32 palette page.
 * \example ctfTestControls.pas
 *)

(**
 * Example test handler for DB components.
 * \example ctfTestDB.pas
 *)

(**
 * Example test handler for DBClient components (TCustomClientDataset).
 * \example ctfTestDBClient.pas
 *)

(**
 * Example test handler for dbExpress components.
 * This test checks TCustomSQLDataSet descendants for an assigned SQLConnection
 * property.
 * \example ctfTestDBX.pas
 *)

(**
 * Example test handler for forms, frames and datamodules.
 * This test checks properties of the form itself.
 * \example ctfTestForm.pas
 *)

(**
 * Example test handler for frames.
 * This test checks properties of all frames in a form.
 * \example ctfTestFrame.pas
 *)

(**
 * Example test handler for IBObjects components.
 * This test checks components for an assigned IB_Connection and IB_Transaction
 * property.
 * \example ctfTestIBO.pas
 *)

(**
 * Example test handler for Interbase Express components.
 * This test checks components for an assigned Database and Transaction
 * property.
 * \example ctfTestIBX.pas
 *)

(**
 * Example test handler for IntraWeb components.
 * \example ctfTestIWDB.pas
 *)

 (**
 * Example test handler for JvUIB components.
 * This test checks components for an assigned DataBase and Transaction
 * property.
 * \example ctfTestJvUIB.pas
 *)

(**
 * Example test handler for TMenuItem components.
 * \example ctfTestMenus.pas
 *)

(**
 * Example test handler for name checks of components.
 * \example ctfTestNames.pas
 *)

(**
 * Example test handler for Provider components (TCustomProvider).
 * \example ctfTestProvider.pas
 *)

(**
 * Example test handler for QuickReport 4 components.
 * \example ctfTestQR4.pas
 *)

(**
 * Example test handler for Rave report components.
 * \example ctfTestRave.pas
 *)

(**
 * Example test handler for tab order.
 * \example ctfTestTabOrder.pas
 *)

(**
 * \page credits Tools used to develop OpenCTF
 *
 * OpenCTF was developed and tested with Turbo Delphi(tm) 2006 Professional using the following open-source tools:
 *
 * \li Apache Ant http://ant.apache.org/ Pure Java build tool, simpler and easier to use than GNU Make.
 * \li doxygen http://www.doxygen.org/ A documentation system for C++, C, Java and IDL.4
 * \li DUnit http://dunit.sourceforge.net/ An Xtreme testing framework for Delphi programs.
 * \li Innosetup (c) Jordan Russel http://www.innosetup.com/ Inno Setup is a free installer for Windows programs.
 * \li pas2dox http://sourceforge.net/projects/pas2dox/ Pas2Dox is a pre-processor addon for the Doxygen documentation generator.
 * \li Subversion http://subversion.tigris.org/ An open-source revision control system.
 * \li TortoiseSVN http://tortoisesvn.tigris.org/ Enables Subversion commands directly in Windows explorer.
 *)

initialization
  HandlerManager := THandlerManager.Create;

finalization
  HandlerManager.Free;

end.

