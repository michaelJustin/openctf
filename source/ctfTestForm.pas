(*
    OpenCTF - Component Test Framework
    Copyright (C) 2016 Michael Justin

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU Affero General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Affero General Public License for more details.

    You should have received a copy of the GNU Affero General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
*)
	
unit ctfTestForm;

interface

uses
  OpenCTF, TestFrameWork, Classes;

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

procedure TBasicFormTest.RunTest;
begin
  inherited;

  if Form.ComponentCount = 0 then
    Fail(SEmpty);
    
end;

{ TInvalidFormParentTest }

procedure TInvalidFormParentTest.RunTest;
begin
  inherited;
  
  if Form.ClassParent.ClassName = TForm.ClassName then
    Fail(Format(SInvalidFormParent, [Form.ClassName, Form.ClassParent.ClassName]));

end;

end.
