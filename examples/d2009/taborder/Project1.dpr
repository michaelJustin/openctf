program Project1;

uses
  OpenCTF,
  OpenCTFRunner,
  ctfTestTabOrder,
  Unit1 in 'Unit1.pas' {Form1},
  Controls;

{$R *.res}

begin
  OpenCTF.Add(TTabOrderTestHandler.Create(TWinControl));

  // Register Form classes
  OpenCTF.RegisterFormClasses([TForm1]);
  // run the tests
  OpenCTFRunner.Run;
end.

