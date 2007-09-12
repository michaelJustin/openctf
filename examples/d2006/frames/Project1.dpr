program Project1;
{$APPTYPE CONSOLE}
uses
  OpenCTF,
  ctfTestFrame,
  ctfTestNames,
  ctfTestControls,
  TextTestRunner,
  GUITestRunner,
  TestFramework,
  SysUtils,
  Unit1 in 'Unit1.pas' {Form1},
  Unit2 in 'Unit2.pas' {Frame2: TFrame};

{$R *.res}

var
  TestFrame2 : TFrame2;

begin
  // First, create a Form instance:
  Form1 := TForm1.Create(nil);
  TestFrame2 := TFrame2.Create(nil);
  try
    // now create and add all tests for this form instance
    OpenCTF.RegisterForms([Form1, TestFrame2]);
    // run the tests

    if FindCmdLineSwitch('console') then
      TextTestRunner.RunRegisteredTests(rxbHaltOnFailures)
    else
      GUITestRunner.RunRegisteredTests;
  finally
    // cleanup
    TestFrame2.Free;
    Form1.Free;
  end

end.
