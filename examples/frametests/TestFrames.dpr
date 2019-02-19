program TestFrames;

uses
  OpenCTF,
  OpenCTFRunner,
  Unit1 in 'Unit1.pas' {Form1},
  Unit2 in 'Unit2.pas' {Frame2: TFrame},
  ctfStandardTests;

{$R *.res}

begin
  // register form and frame classes
  OpenCTF.RegisterFormClasses([TForm1, TFrame2]);

  // run the tests
  OpenCTFRunner.Run;
end.
