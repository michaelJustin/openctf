program Project1;

uses
  OpenCTF,
  OpenCTFRunner,
  ctfTestDB,
  TestDataModule in 'TestDataModule.pas' {DataModule1: TDataModule},
  TestDataModule2 in 'TestDataModule2.pas' {DataModule2: TDataModule},
  TestForm in 'TestForm.pas' {Form1},
  TestForm2 in 'TestForm2.pas' {Form2};

begin
  // Register Form classes
  OpenCTF.RegisterFormClasses([TDataModule1, TDataModule2, TForm1, TForm2]);
  // run the tests
  OpenCTFRunner.Run;
end.

