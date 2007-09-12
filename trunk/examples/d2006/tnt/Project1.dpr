program Project1;
{$APPTYPE CONSOLE}
uses
  SysUtils,
  OpenCTF,
  ctfTestActnList,
  ctfTestMenus,
  Unit1 in 'Unit1.pas' {Form1},
  TextTestRunner,
  GUITestRunner,
  TestFramework;
begin
  // First, create a form instance:
  Form1 := TForm1.Create(nil);
  try
    // now create and add all tests for this form instance
    OpenCTF.RegisterForms([Form1]);
    // run the tests
    if FindCmdLineSwitch('console') then
      TextTestRunner.RunRegisteredTests(rxbHaltOnFailures)
    else
      GUITestRunner.RunRegisteredTests;
  finally
    // cleanup
    Form1.Free;
  end
end.
