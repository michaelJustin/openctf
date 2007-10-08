program Project1;

uses
{$REGION 'OpenCTF'}
  // OpenCTF main unit
  OpenCTF,
  OpenCTFRunner,
  //
  // To activate a required tests, uncomment the line with the test unit name:
  //
  // ctfTestActnList,
  // ctfTestControls,
  ctfTestDB,
  // ctfTestForm,
  // ctfTestFrame,
  // ctfTestMenus,
  // ctfTestNames,
  // ctfTestRave,
{$ENDREGION}
  GUITestRunner,
  TestDataModule in 'TestDataModule.pas' {DataModule1: TDataModule},
  TestDataModule2 in 'TestDataModule2.pas' {DataModule2: TDataModule},
  TestForm in 'TestForm.pas' {Form1},
  TestForm2 in 'TestForm2.pas' {Form2};

begin
  // Register Form classes:
  OpenCTF.RegisterFormClasses([TDataModule1, TDataModule2, TForm1, TForm2]);
  // run the tests
  OpenCTFRunner.Run;
end.

