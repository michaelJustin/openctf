program Project1;
{$APPTYPE CONSOLE}
uses
  OpenCTF,
  ctfTestQR4,
  TextTestRunner,
  GUITestRunner,
  TestFramework,
  SysUtils,
  Unit2 in 'Unit2.pas' {DataModule2: TDataModule},
  Unit1 in 'Unit1.pas' {Form1};

{$R *.res}

begin
  DataModule2 := TDataModule2.Create(nil);
  Form1 := TForm1.Create(nil);
  try
    // now create and add all tests
    OpenCTF.RegisterForms([DataModule2, Form1]);
    // run the tests
    if FindCmdLineSwitch('console') then
      TextTestRunner.RunRegisteredTests(rxbHaltOnFailures)
    else
      GUITestRunner.RunRegisteredTests;
  finally
    // cleanup
    Form1.Free;
    DataModule2.Free;
  end

end.
