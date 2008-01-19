program OneFormTest;

{$APPTYPE CONSOLE}

uses
  OpenCTF,
  OpenCTFRunner,
  ctfTestActnList,
  ctfTestControls,
  ctfTestMenus,
  TestForm in 'TestForm.pas' {Form1};

begin
  // Register Form classes
  OpenCTF.RegisterFormClasses([TForm1]);
  // run the tests
  OpenCTFRunner.Run;
end.

