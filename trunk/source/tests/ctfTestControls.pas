(** license **)
unit ctfTestControls;

interface
uses OpenCTF, TestFrameWork, Classes;

type
  TTabSheetHandler = class(TComponentHandler)
  protected
    procedure AddTests; override;
  end;

  TTabSheetTest = class(TComponentTest)
  protected
    procedure RunTest(testResult: TTestResult); override;
  end;

  TImageListHandler = class(TComponentHandler)
  protected
    procedure AddTests; override;
  end;

  TImageListTest = class(TComponentTest)
  protected
    procedure RunTest(testResult: TTestResult); override;
  end;

implementation
uses ComCtrls, Controls, SysUtils;

{ TTabSheetHandler }

procedure TTabSheetHandler.AddTests;
begin
  inherited;
  CurrentSuite.AddTest(TTabSheetTest.Create(CurrentComponent));
end;

{ TTabSheetTest }

procedure TTabSheetTest.RunTest(testResult: TTestResult);
begin
  inherited;
  if not TTabSheet(Component).TabVisible then
    Fail('TabSheet is invisible, should be hidden at run time');
end;

{ TImageListHandler }

procedure TImageListHandler.AddTests;
begin
  inherited;
  CurrentSuite.AddTest(TImageListTest.Create(CurrentComponent));
end;

{ TImageListTest }

procedure TImageListTest.RunTest(testResult: TTestResult);
begin
  inherited;
  if TImageList(Component).Count=0 then
    Fail('ImageList is empty');
end;

initialization
  OpenCTF.Add(TTabSheetHandler.Create(TTabSheet));
  OpenCTF.Add(TImageListHandler.Create(TImageList));

end.

