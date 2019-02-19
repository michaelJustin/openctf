program TestFrames;

uses
  OpenCTF, ctfStandardTests,
  GUITestRunner,
  Unit1 in 'Unit1.pas' {Form1},
  Unit2 in 'Unit2.pas' {Frame2: TFrame};

{$R *.res}

begin
  OpenCTF.RegisterFormClasses([TForm1, TFrame2]);

  RunRegisteredTests;
end.
