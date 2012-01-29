program Project1;

uses
  OpenCTF,
  GUITestRunner,
  ctfStandardTests,
  TestForm in 'TestForm.pas' {Form1};

begin
  ReportMemoryLeaksOnShutdown := True;

  // Register Form classes
  RegisterFormClasses([TForm1]);

  // Build DUnit tests
  BuildTests;

  // run the tests
  RunRegisteredTests;
end.

