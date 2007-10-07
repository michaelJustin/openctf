program Project1;

uses
  OpenCTF,
  ctfTestDBX,
  GUITestRunner,
  Unit1 in 'Unit1.pas' {DataModule1: TDataModule};

{$R *.res}

begin
{$WARN SYMBOL_PLATFORM OFF}
  ReportMemoryLeaksOnShutDown := debughook<>0;
{$WARN SYMBOL_PLATFORM ON}

  OpenCTF.RegisterFormClasses([TDataModule1]);

  // run the tests
  GUITestRunner.RunRegisteredTests;

end.
