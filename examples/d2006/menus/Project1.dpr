program Project1;

uses
  OpenCTF,
  OpenCTFRunner,
  ctfTestActnList,
  ctfTestMenus,
  TestForm in 'TestForm.pas' {Form1};
begin
  OpenCTF.RegisterFormClasses([TForm1]);
  // run the tests
  OpenCTFRunner.Run;
end.

