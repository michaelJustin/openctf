program Project1;

uses
  OpenCTF,
  ctfStandardTests,
  GUITestRunner,
  Unit1 in 'Unit1.pas' {Form1},
  Unit2 in 'Unit2.pas' {Form2};

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;

  // Register Form classes
  RegisterFormClasses([TForm1, TForm2]);

  // Build DUnit tests
  BuildTests;

  // run the tests
  RunRegisteredTests;
end.

