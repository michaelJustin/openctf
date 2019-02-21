program DatamoduleTests;

uses
  OpenCTF,
  ctfConfig,
  GUITestRunner,
  DatamoduleUnit in 'DatamoduleUnit.pas' {DataModule1: TDataModule};

begin
  OpenCTF.RegisterFormClasses([TDataModule1]);

  RunRegisteredTests;
end.

