program Project1;

uses
  OpenCTF,
  OpenCTFRunner,
  ctfTestIBX,
  ctfTestDB,
  Unit2 in 'Unit2.pas' {DataModule2: TDataModule};

{$R *.res}

begin
  // Register Form classes
  OpenCTF.RegisterFormClasses([TDataModule2]);
  // run the tests
  OpenCTFRunner.Run;
end.
