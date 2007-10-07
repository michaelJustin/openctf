program Project1;

uses
  OpenCTF,
  ctfTestActnList,
  ctfTestMenus,
  TestForm in 'TestForm.pas' {Form1},
  GUITestRunner;
begin
  OpenCTF.RegisterFormClasses([TForm1]);

  // run the tests
  GUITestRunner.RunRegisteredTests;
end.

