program Project1;

{$APPTYPE CONSOLE}

uses
{$REGION 'OpenCTF'}
  // OpenCTF main unit
  OpenCTF,
  //
  // To activate a required tests, uncomment the line with the test unit name:
  //
  ctfTestTabOrder,
{$ENDREGION}
  TextTestRunner,
  GUITestRunner,
  Forms,
  SysUtils,
  Unit1 in 'Unit1.pas' {Form1};

{$R *.res}

begin
  // First, create Form instances:

  Application.CreateForm(TForm1, Form1);

  try
    // now create and add all tests for this form instance
    OpenCTF.RegisterForms;

    // run the tests
    if SysUtils.FindCmdLineSwitch('console') then
      TextTestRunner.RunRegisteredTests(rxbHaltOnFailures)
    else
      GUITestRunner.RunRegisteredTests;
      
  finally
    // cleanup
    OpenCTF.UnregisterForms;
  end

end.
