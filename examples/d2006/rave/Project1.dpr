program Project1;

uses
  OpenCTF,
  ctfTestRave,
  GUITestRunner,
  Unit1 in 'Unit1.pas' {Form1};

{$R *.res}

begin
  OpenCTF.RegisterFormClasses([TForm1]);

  // run the tests
  GUITestRunner.RunRegisteredTests;

end.
