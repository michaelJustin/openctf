program Project1;

uses
  OpenCTF,
  OpenCTFRunner,
  ctfTestADO,
  GUITestRunner,
  ActiveX,
  Unit1 in 'Unit1.pas' {DataModule1: TDataModule};

{$R *.res}

begin

{$WARN SYMBOL_PLATFORM OFF}
  ReportMemoryLeaksOnShutDown := debughook<>0;
{$WARN SYMBOL_PLATFORM ON}

  CoInitialize(nil);

  // Register Form classes:
  OpenCTF.RegisterFormClasses([TDataModule1]);

  // run the tests
  OpenCTFRunner.Run;

end.
