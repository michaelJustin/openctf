program Project1;

uses
  OpenCTF,
  OpenCTFRunner,
  ctfTestJvUIB,
  ctfTestDB,
  Unit1 in 'Unit1.pas' {DataModule1: TDataModule};

{$R *.res}

begin
  OpenCTF.RegisterFormClasses([TDataModule1]);
  // run the tests
  OpenCTFRunner.Run;
end.
