program Project1;

{$APPTYPE CONSOLE}

uses
  // FastMM4,
{$REGION 'OpenCTF'}
  // OpenCTF main unit
  OpenCTF,
  //
  // To activate a required tests, uncomment the line with the test unit name:
  //
  ctfTestTabOrder,
{$ENDREGION}
  TextTestRunner,
  GUITestRunner,
  Forms,
  SysUtils,
  Unit1 in 'Unit1.pas' {Form1};

{$R *.res}

begin
  // Register Form classes:
  OpenCTF.RegisterFormClasses([TForm1]);

  // run the tests
  GUITestRunner.RunRegisteredTests;

end.

