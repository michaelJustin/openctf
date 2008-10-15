program Project1;

uses
  OpenCTF,
  OpenCTFRunner,
  ctfTestRave,
  Unit1 in 'Unit1.pas' {Form1};

{$R *.res}

begin
  // Register Form classes
  OpenCTF.RegisterFormClasses([TForm1]);
  // run the tests
  OpenCTFRunner.Run;
end.
