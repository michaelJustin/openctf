program Project1;

uses
  OpenCTF,
  ctfTestForm,
  GUITestRunner,
  Unit1 in 'Unit1.pas' {Form1},
  Unit2 in 'Unit2.pas' {Form2},
  Unit3 in 'Unit3.pas' {Form3};

{$R *.res}

begin

  OpenCTF.RegisterFormClasses([TForm1, TForm2, TForm3]);

  // run the tests
  GUITestRunner.RunRegisteredTests;

end.

