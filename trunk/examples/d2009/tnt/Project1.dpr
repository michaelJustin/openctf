program Project1;

uses
  OpenCTF,
  OpenCTFRunner,
  ctfTestActnList,
  ctfTestMenus,
  Unit1 in 'Unit1.pas' {Form1};
begin
  // Register Form classes
  OpenCTF.RegisterFormClasses([TForm1]);
  // run the tests
  OpenCTFRunner.Run;
end.
