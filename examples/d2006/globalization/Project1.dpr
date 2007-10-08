program Project1;

uses
  OpenCTF,
  OpenCTFRunner,
  ctfTestGlobalization,
  GUITestRunner,
  Unit1 in 'Unit1.pas' {Form1},
  Unit2 in 'Unit2.pas' {DataModule2: TDataModule};

{$R *.res}

begin
  OpenCTF.RegisterFormClasses([TForm1]);
  // run the tests
  OpenCTFRunner.Run;
end.
