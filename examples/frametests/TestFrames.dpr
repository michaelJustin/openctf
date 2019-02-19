program TestFrames;

uses
  OpenCTF, OpenCTFRunner, ctfStandardTests,
  Unit1 in 'Unit1.pas' {Form1},
  Unit2 in 'Unit2.pas' {Frame2: TFrame};

{$R *.res}

begin
  // register form and frame classes
  OpenCTF.RegisterFormClasses([TForm1, TFrame2]);

  // run the tests
  OpenCTFRunner.Run;
end.
