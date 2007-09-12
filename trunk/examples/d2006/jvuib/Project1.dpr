program Project1;

{$APPTYPE CONSOLE}

uses
  OpenCTF,
  ctfTestJvUIB,
  ctfTestDB,
  SysUtils,
  TextTestRunner,
  GUITestRunner,
  TestFramework,
  Unit1 in 'Unit1.pas' {DataModule1: TDataModule};

{$R *.res}

begin
  // First, create a DataModule instance:
  DataModule1 := TDataModule1.Create(nil);
  try
    // now create and add all tests for this form instance
    OpenCTF.RegisterForms([DataModule1]);
    // run the tests
    if FindCmdLineSwitch('console') then
      TextTestRunner.RunRegisteredTests(rxbHaltOnFailures)
    else
      GUITestRunner.RunRegisteredTests;
  finally
    // cleanup
    DataModule1.Free;
  end

end.
