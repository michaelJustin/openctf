program Project1;

uses
  OpenCTF,
  ctfTestActnList,
  ctfTestMenus,
  Unit1 in 'Unit1.pas' {Form1},
  GUITestRunner;
begin
  OpenCTF.RegisterFormClasses([TForm1]);

  // run the tests
  GUITestRunner.RunRegisteredTests;
end.
