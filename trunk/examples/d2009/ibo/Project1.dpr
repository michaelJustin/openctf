program Project1;

uses
  OpenCTF,
  OpenCTFRunner,
  ctfTestIBO,
  ctfTestDB,
  Unit1 in 'Unit1.pas' {TDataModule1: TDataModule};

{$R *.res}

begin
  // Register Form classes
  OpenCTF.RegisterFormClasses([TDataModule1]);
  // run the tests
  OpenCTFRunner.Run;
end.
