program OneFormTest;
{.$APPTYPE CONSOLE}
uses
  OpenCTF,
  OpenCTFRunner,
  ctfTestActnList,
  ctfTestControls,
  ctfTestMenus,
  GUITestRunner,
  TestForm in 'TestForm.pas' {Form1};

begin
  OpenCTF.RegisterFormClasses([TForm1]);
  OpenCTFRunner.Run;
end.

