program Project1;

{$APPTYPE CONSOLE}

uses
  OpenCTF,
  ctfTestADO,
  TextTestRunner,
  GUITestRunner,
  TestFramework,
  ActiveX,
  SysUtils,
  Unit1 in 'Unit1.pas' {DataModule1: TDataModule};

{$R *.res}

begin
  CoInitialize(nil);

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
