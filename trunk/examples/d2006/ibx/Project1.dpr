program Project1;

uses
  OpenCTF,
  ctfTestIBX,
  ctfTestDB,
  GUITestRunner,
  Unit2 in 'Unit2.pas' {DataModule2: TDataModule};

{$R *.res}

begin
  OpenCTF.RegisterFormClasses([TDataModule2]);

  // run the tests
  GUITestRunner.RunRegisteredTests;

end.
