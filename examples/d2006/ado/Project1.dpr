program Project1;

uses
  OpenCTF,
  OpenCTFRunner,
  ctfTestADO,
  ActiveX,
  Unit1 in 'Unit1.pas' {DataModule1: TDataModule};

{$R *.res}

begin
  // Initialize the COM library 
  CoInitialize(nil);

  // Register Form classes:
  OpenCTF.RegisterFormClasses([TDataModule1]);

  // run the tests
  OpenCTFRunner.Run;

end.
