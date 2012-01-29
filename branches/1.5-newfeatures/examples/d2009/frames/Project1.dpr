program Project1;

uses
  OpenCTF,
  ctfStandardTests,
  GUITestRunner,
  Unit1 in 'Unit1.pas' {Form1},
  Unit2 in 'Unit2.pas' {Frame2: TFrame},
  Unit3 in 'Unit3.pas' {DataModule1: TDataModule};

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;

  // Register Form classes
  RegisterFormClasses([TForm1, TFrame2, TDataModule1]);

  // Build DUnit tests
  BuildTests;

  // run the tests
  RunRegisteredTests;

end.
