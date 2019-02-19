program FormTests;

uses
  OpenCTF, OpenCTFRunner, ctfStandardTests,
  TestForm in 'TestForm.pas' {Form1};

begin
  // register form classes
  OpenCTF.RegisterFormClasses([TForm1]);

  // run the tests
  OpenCTFRunner.Run;
end.

