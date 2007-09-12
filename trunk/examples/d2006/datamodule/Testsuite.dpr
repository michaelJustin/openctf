program Testsuite;

uses
  // FastMM4,
{$REGION 'OpenCTF'}
  // OpenCTF main unit
  OpenCTF,
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
  // create datamodule instances
  DataModule1 := TDataModule1.Create(nil);
  DataModule2 := TDataModule2.Create(nil);

  // create form instances
  Form1 := TForm1.Create(nil);
  Form2 := TForm2.Create(nil);

  try
    // the next line creates OpenCTF test suites for
    // each form and datamodule and registers the test suite
    // in DUnit:
    RegisterForms([DataModule1, DataModule2, Form1, Form2]);

    // use GUI runner to run the tests
    TGUITestRunner.RunRegisteredTests;

  finally

    // cleanup
    Form2.Free;
    Form1.Free;
    DataModule2.Free;
    DataModule1.Free;
  end;

end.

