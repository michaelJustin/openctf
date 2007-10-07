program Project1;

uses
  OpenCTF,
  ctfTestJvUIB,
  ctfTestDB,
  GUITestRunner,
  Unit1 in 'Unit1.pas' {DataModule1: TDataModule};

{$R *.res}

begin
  OpenCTF.RegisterFormClasses([TDataModule1]);

  // run the tests
  GUITestRunner.RunRegisteredTests;

end.
