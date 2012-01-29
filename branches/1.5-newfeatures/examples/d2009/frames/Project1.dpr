program Project1;

uses
  OpenCTF,
  OpenCTFRunner,
  ctfStandardTests,
  Unit1 in 'Unit1.pas' {Form1},
  Unit2 in 'Unit2.pas' {Frame2: TFrame};

{$R *.res}

begin
  // Register Form classes
  OpenCTF.RegisterFormClasses([TForm1, TFrame2]);
  OpenCTF.BuildTests;
  // run the tests
  OpenCTFRunner.Run;

  ReportMemoryLeaksOnShutdown := True;
end.
