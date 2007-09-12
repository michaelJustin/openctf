program Project1;
{$APPTYPE CONSOLE}
uses
  OpenCTF,
  ctfTestIWDB,
  ctfTestDBX,
  TextTestRunner,
  GUITestRunner,
  TestFramework,
  Forms,
  IWMain,
  SysUtils,
  ServerController in 'ServerController.pas'
    {IWServerController: TIWServerControllerBase},
  UserSessionUnit in 'UserSessionUnit.pas' {IWUserSession: TIWUserSessionBase},
  Unit1 in 'Unit1.pas' {IWForm1: TIWAppForm};

{$R *.res}

var
  IWUserSession: TIWUserSession;
  IWForm1: TIWForm1;

begin

  Application.Initialize;
  Application.CreateForm(TformIWMain, formIWMain);

  IWUserSession := TIWUserSession.Create(nil);
  // create a TIWForm1 instance:
  IWForm1 := TIWForm1.Create(nil);

  try
    // now create and add all tests for this form instance
    OpenCTF.RegisterForms([IWUserSession, IWForm1]);
    // run the tests
    if FindCmdLineSwitch('console') then
      TextTestRunner.RunRegisteredTests(rxbHaltOnFailures)
    else
      GUITestRunner.RunRegisteredTests;
  finally
    // cleanup
    IWForm1.Free;
    IWUserSession.Free;
  end

end.

