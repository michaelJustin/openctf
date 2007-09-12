program OneFormTest;

uses
  // FastMM4,
  // OpenCTF main unit
  OpenCTF,
  // auto-register tests (see unit initialization)
  ctfTestActnList,
  ctfTestControls,
  ctfTestMenus,
  // the form to be tested
  TestForm in 'TestForm.pas' {Form1},
  // DUnit units
  GUITestRunner, TestFramework
  ;
begin
  // create a form instance:
  Form1 := TForm1.Create(nil);
  try
    // the next line creates a OpenCTF test suite for the form
    // and registers the test suite in DUnit
    RegisterForm(Form1);
    // use GUI runner to run the tests
    TGUITestRunner.RunRegisteredTests;
  finally
    Form1.Free;
  end;
end.

