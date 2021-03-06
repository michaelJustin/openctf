# OpenCTF - Open component test framework

The OpenCTF component test framework helps to build automatic tests for all (visual and non-visual) VCL components in a Delphi application. It is based on the DUnit framework, and it integrates well with existing test projects.

### Example test project ###

This example test project contains one form and one frame. 

```pascal
program FormTests;

uses
  OpenCTF,
  ctfConfig, // configure OpenCTF with our test classes
  GUITestRunner,
  TestForm in 'TestForm.pas' {Form1},
  TestFrame in 'TestFrame.pas' {Frame1: TFrame};

begin
  OpenCTF.RegisterFormClasses([TForm1, TFrame1]);

  RunRegisteredTests;
end.
```

### Example: verify that a TImageList contains images

#### Step 1: create a TComponentHandler who will add all our tests to the current test suite

The framework uses customized TComponentHandler subclasses to build the component tests. 

In this example, we want to test only TImageList components, so we override the constructor to specifiy the classes to be tested.

```pascal
TImageListTests = class(TComponentHandler)
protected
  procedure AddTests; override;
public
  constructor Create;
end;
  ...
constructor TImageListTests.Create;
begin
  inherited Create(Controls.TImageList); // test only this class (and subclasses)
end;

procedure TImageListTests.AddTests;
begin
  inherited;

  CurrentSuite.AddTest(TImageListMustContainImages.Create(CurrentComponent)); // see below
  // add more tests ...
end;
  
```

#### Step 2: write the class which does the actual test 

Our custom test class is derived from TComponentTest (which in turn is a DUnit TAbstractTest).
So we can use all CheckEquals / CheckNotEquals / ...  methods of DUnit.
For our example we only test that the number of images in the ImageList is not equal to zero.
Note that for every component on the form, one TComponentTest instance will be created, and its Component property points to the component under test. 

```pascal
TImageListMustContainImages = class(TComponentTest)
protected
  procedure RunTest(testResult: TTestResult); override;
end;

procedure TImageListMustContainImages.RunTest;
begin
  inherited;

  CheckNotEquals(0, (Component as TImageList).Count, 'ImageList is empty');
end;
```

#### Step 3: register

Now we need to add the test to our setup. This must happen before registering the form classes. 

```pascal
program FormTests;

uses
  OpenCTF,
  ctfTestControls, // unit containing my custom TImageList tests
  GUITestRunner,
  TestForm in 'TestForm.pas' {Form1},
  TestFrame in 'TestFrame.pas' {Frame1: TFrame};

begin
  OpenCTF.Add(TImageListTests.Create);

  OpenCTF.RegisterFormClasses([TForm1, TFrame1]);

  RunRegisteredTests;
end.
```

#### Step 4: move your custom setup to a ctfConfig unit (optional)

Instead of placing the configuration in the project source file (dpr), you can write a unit and include all tests (and required units) there.

```pascal
program FormTests;

uses
  OpenCTF,
  ctfConfig, // unit containing my custom configuration
  GUITestRunner,
  TestForm in 'TestForm.pas' {Form1},
  TestFrame in 'TestFrame.pas' {Frame1: TFrame};

begin
  OpenCTF.RegisterFormClasses([TForm1, TFrame1]);

  RunRegisteredTests;
end.
```

#### Example for configuration unit ctfConfig

The configuration example performs all setup in the initialization section. 
This saves typing in the project source code, only add the ctfConfig unit and tests will be added to the framework.

```pascal
unit ctfConfig;

interface

implementation

uses
  OpenCTF,
  ctfTestForm, ctfTestNames, ctfTestTabOrder, ctfTestMenus,
  StdCtrls, ExtCtrls, Forms, Classes;

initialization
  OpenCTF.Add(TBasicFormTests.Create);
  OpenCTF.Add(TComponentNameTests.Create);
  OpenCTF.Add(TTabOrderTests.Create);
  OpenCTF.Add(TMenuItemTests.Create);
end.  
```

### Excluding classes from tests

In some cases there, tests may be skipped for some classes. For example, the strict rule that every component must have a non-default name ('Button1' and 'Button2') may be too strict. 

The configuration allows to exclude some classes from a specific test. Here is the initialization section with additional excludes: 

```pascal
initialization
  OpenCTF.Add(TBasicFormTests.Create);
  OpenCTF.Add((TComponentNameTests.Create)
    .Exclude(StdCtrls.TLabel) // exclude TLabel 
    .Exclude(Forms.TFrame)    // exclude TFrame
    .Exclude(ExtCtrls.TPanel) // exclude TPanel
    );
  OpenCTF.Add(TTabOrderTests.Create);
  OpenCTF.Add(TMenuItemTests.Create);
end.  
```


### Requirements ###

Compiled and tested with Delphi 2009.

A compatible version of Delphi and DUnit is required to use the framework.

### API documentation (generated with doxygen and pas2dox) ###

https://michaeljustin.github.io/openctf/

### Building docs and distribution binaries ###

OpenCTF can be used without running the build script. The build scripts are useful for OpenCTF developers. They generate the API documentation, compile the example projets, and build a source distribution package.

### Required tools for building API docs ###

- to run the build script, Apache Ant 1.7 or newer is required
- doxygen and pas2dox are required to build the documentation (copy pas2dox.exe to the "make" folder)

Apache Ant: 
https://ant.apache.org

Doxygen:
http://www.doxygen.nl

pas2dox 0.41:
https://sourceforge.net/projects/pas2dox/
