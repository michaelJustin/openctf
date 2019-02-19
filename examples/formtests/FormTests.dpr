program FormTests;

uses
  OpenCTF,
  ctfStandardTests,
  GUITestRunner,
  TestForm in 'TestForm.pas' {Form1},
  TestFrame in 'TestFrame.pas' {Frame1: TFrame};

begin
  OpenCTF.RegisterFormClasses([TForm1, TFrame1]);

  RunRegisteredTests;
end.

