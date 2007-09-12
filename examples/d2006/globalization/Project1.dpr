program Project1;
{$APPTYPE CONSOLE}
uses
  OpenCTF,
  ctfTestGlobalization,
  TextTestRunner,
  GUITestRunner,
  TestFramework,
  SysUtils,
  Unit1 in 'Unit1.pas' {Form1},
  Unit2 in 'Unit2.pas' {DataModule2: TDataModule};

{$R *.res}

begin
  // First, create a Form instance:
  Form1 := TForm1.Create(nil);
  try
    // now create and add all tests for this form instance
    OpenCTF.RegisterForms([Form1]);
    // run the tests
    if FindCmdLineSwitch('console') then
      TextTestRunner.RunRegisteredTests(rxbHaltOnFailures)
    else
      GUITestRunner.RunRegisteredTests;
  finally
    // cleanup
    Form1.Free;
  end

end.
