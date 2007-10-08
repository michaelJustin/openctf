program Project1;

uses
  OpenCTF,
  OpenCTFRunner,
  ctfTestQR4,
  Unit2 in 'Unit2.pas' {DataModule2: TDataModule},
  Unit1 in 'Unit1.pas' {Form1};

{$R *.res}

begin
  OpenCTF.RegisterFormClasses([TDataModule2, TForm1]);
  // run the tests
  OpenCTFRunner.Run;
end.
