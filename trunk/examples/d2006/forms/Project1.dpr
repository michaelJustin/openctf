program Project1;

{$APPTYPE CONSOLE}

uses
  OpenCTF,
  ctfTestForm,
  TextTestRunner,
  GUITestRunner,
  Forms,
  SysUtils,
  Unit1 in 'Unit1.pas' {Form1},
  Unit2 in 'Unit2.pas' {Form2},
  Unit3 in 'Unit3.pas' {Form3};

{$R *.res}

begin
  // First, create Form instances:

  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);

  // now create and add all tests for this form instance
  OpenCTF.RegisterForms;

  // run the tests
  if SysUtils.FindCmdLineSwitch('console') then
    TextTestRunner.RunRegisteredTests(rxbHaltOnFailures)
  else
    GUITestRunner.RunRegisteredTests;

end.

