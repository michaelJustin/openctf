program Project1;
{$APPTYPE CONSOLE}
uses
  SysUtils,
  OpenCTF,
  ctfTestIBX,
  ctfTestDB,
  Unit2 in 'Unit2.pas' {DataModule2: TDataModule},
  TextTestRunner,
  GUITestRunner,
  TestFramework;

{$R *.res}

begin
  // First, create a DataModule instance:
  DataModule2 := TDataModule2.Create(nil);
  try
    // now create and add all tests for this form instance
    OpenCTF.RegisterForms([DataModule2]);
    // run the tests
    if FindCmdLineSwitch('console') then
      TextTestRunner.RunRegisteredTests(rxbHaltOnFailures)
    else
      GUITestRunner.RunRegisteredTests;
  finally
    // cleanup
    DataModule2.Free;
  end

end.
