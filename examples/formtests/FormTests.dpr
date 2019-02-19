program FormTests;

uses
  OpenCTF, ctfStandardTests,
  GUITestRunner,
  TestForm in 'TestForm.pas' {Form1};

begin
  OpenCTF.RegisterFormClasses([TForm1]);

  RunRegisteredTests;
end.

