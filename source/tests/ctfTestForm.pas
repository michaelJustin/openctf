(** license **)
unit ctfTestForm;

interface
uses OpenCTF, TestFrameWork, Classes;

type
  TBasicFormTestHandler = class(TComponentHandler)
  protected
    procedure AddTests; override;
    procedure AddFormTests; override;
    function Handles(const Form: TComponent): Boolean; override;
  end;

  TBasicFormTest = class(TFormTest)
  protected
    procedure RunTest(testResult: TTestResult); override;
  end;

  TInvalidFormParentTest = class(TFormTest)
  protected
    procedure RunTest(testResult: TTestResult); override;
  end;

implementation
uses ctfUtils, Forms, SysUtils;

resourcestring
  SIllegalName = 'Avoid default names for forms (e.g. Form1)';
  SEmpty = 'Empty form (or datamodule).';
  SInvalidFormParent = 'Invalid form parent class: %s should not inherit directly from %s.';

{ TBasicFormTestHandler }

procedure TBasicFormTestHandler.AddFormTests;
begin
  inherited;

  AddTest(TBasicFormTest.Create(Form, 'TestEmptyForm'));

  if Form is TCustomForm then
    AddTest(TInvalidFormParentTest.Create(Form, 'TestFormParent'));

end;

procedure TBasicFormTestHandler.AddTests;
begin
  inherited;
end;

function TBasicFormTestHandler.Handles(const Form: TComponent): Boolean;
begin
  Result := (Form is TCustomForm) or (Form is TDataModule) or (Form is TCustomFrame);
end;

{ TBasicFormTest }

procedure TBasicFormTest.RunTest(testResult: TTestResult);
begin
  inherited;

  if Form.ComponentCount = 0 then
    Fail(SEmpty);
    
end;

{ TInvalidFormParentTest }

procedure TInvalidFormParentTest.RunTest(testResult: TTestResult);
begin
  inherited;
  
  if Form.ClassParent.ClassName = TForm.ClassName then
    Fail(Format(SInvalidFormParent, [Form.Name, Form.ClassParent.ClassName]));

end;

initialization
  OpenCTF.Add(TBasicFormTestHandler.Create(TComponent));

end.
