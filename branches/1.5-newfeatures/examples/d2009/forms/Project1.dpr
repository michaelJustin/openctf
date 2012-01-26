program Project1;

uses
  OpenCTF,
  OpenCTFRunner,
  ctfStandardTests,
  Unit1 in 'Unit1.pas' {Form1},
  Unit2 in 'Unit2.pas' {Form2};

{$R *.res}

begin
  // Register Form classes
  OpenCTF.RegisterFormClasses([TForm1, TForm2]);
  // run the tests
  OpenCTFRunner.Run;
end.

