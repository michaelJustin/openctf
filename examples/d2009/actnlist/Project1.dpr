program Project1;

{$APPTYPE CONSOLE}

uses
  OpenCTF,
  OpenCTFRunner,
  ctfStandardTests in '..\..\..\source\ctfStandardTests.pas',
  TestForm in 'TestForm.pas' {Form1};

begin
  // Register Form classes
  OpenCTF.RegisterFormClasses([TForm1]);
  // run the tests
  OpenCTFRunner.Run;

end.

