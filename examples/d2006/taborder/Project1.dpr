program Project1;

uses
  OpenCTF,
  ctfTestTabOrder,
  GUITestRunner,
  Unit1 in 'Unit1.pas' {Form1};

{$R *.res}

begin
{$WARN SYMBOL_PLATFORM OFF}
  ReportMemoryLeaksOnShutDown := debughook<>0;
{$WARN SYMBOL_PLATFORM ON}

  // Register Form classes:
  OpenCTF.RegisterFormClasses([TForm1]);

  // run the tests
  GUITestRunner.RunRegisteredTests;

end.

