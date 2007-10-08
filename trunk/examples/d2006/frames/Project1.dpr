program Project1;
{$APPTYPE CONSOLE}
uses
  OpenCTF,
  OpenCTFRunner,
  ctfTestFrame,
  ctfTestNames,
  ctfTestControls,
  GUITestRunner,
  Unit1 in 'Unit1.pas' {Form1},
  Unit2 in 'Unit2.pas' {Frame2: TFrame};

{$R *.res}

begin
  OpenCTF.RegisterFormClasses([TForm1, TFrame2]);
  // run the tests
  OpenCTFRunner.Run;
end.
