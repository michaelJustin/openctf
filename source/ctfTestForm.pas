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
  TBasicFormTests = class(TComponentHandler)
  protected
    procedure AddTests; override;
    procedure AddFormTests; override;
    function Handles(const Form: TComponent): Boolean; override;
  end;

  TEmptyFormTest = class(TFormTest)
  protected
    procedure RunTest(testResult: TTestResult); override;
  end;

  TDefaultNameTest = class(TFormTest)
  protected
    procedure RunTest(testResult: TTestResult); override;
  end;

  TComponentPlacementTest = class(TFormTest)
  protected
    procedure RunTest(testResult: TTestResult); override;
  end;

  (*
  TInvalidFormParentTest = class(TFormTest)
  protected
    procedure RunTest(testResult: TTestResult); override;
  end;
  *)

implementation

uses
  ctfUtils,
  Controls, Forms, SysUtils;

resourcestring
  SIllegalName = 'Avoid default names for forms (e.g. Form1)';
  SEmpty = 'Empty form (or datamodule).';
  // SInvalidFormParent = 'Invalid form parent class: %s should not inherit directly from %s.';

{ TBasicFormTests }

procedure TBasicFormTests.AddFormTests;
begin
  inherited;

  AddTest(TEmptyFormTest.Create(Form, 'TestEmptyForm'));

  AddTest(TDefaultNameTest.Create(Form, 'Test default name'));

  AddTest(TComponentPlacementTest.Create(Form));

  //  if Form is TCustomForm then
  //  AddTest(TInvalidFormParentTest.Create(Form, 'TestFormParent'));
end;

procedure TBasicFormTests.AddTests;
begin
  inherited;
end;

function TBasicFormTests.Handles(const Form: TComponent): Boolean;
begin
  Result := (Form is TCustomForm) or (Form is TDataModule) or (Form is TCustomFrame);
end;

{ TBasicFormTest }

procedure TEmptyFormTest.RunTest;
begin
  inherited;

  if Form.ComponentCount = 0 then
    Fail(SEmpty);
end;

{ TInvalidFormParentTest }
(*
procedure TInvalidFormParentTest.RunTest;
begin
  inherited;

  if Form.ClassParent.ClassName = TForm.ClassName then
    Fail(Format(SInvalidFormParent, [Form.ClassName, Form.ClassParent.ClassName]));

end;
*)

{ TBasicFormNameTest }

procedure TDefaultNameTest.RunTest(testResult: TTestResult);
begin
  inherited;

  if HasDefaultName(Form) then
    Fail(SIllegalName);
end;

{ TComponentPlacementTest }

procedure TComponentPlacementTest.RunTest(testResult: TTestResult);
var
  F: TScrollingWinControl;
  I: Integer;
  C: TWinControl;
  S: string;
begin
  inherited;

  S := '';

  F := Form as TScrollingWinControl;

  for I := 0 to Form.ComponentCount - 1 do begin
    if Form.Components[I] is TWinControl then begin
      C := Form.Components[I] as TWinControl;
      if (C.Left < 0) or (C.Top < 0) then begin
        S := S + C.Name + ' is outside of form (T/L) ';
      end;
      if (C.Left > F.Width) or (C.Top > F.Height) then begin
        S := S + C.Name + ' is outside of form (B/R) ';
      end;
    end;
  end;

  if S <> '' then Fail (S);
end;

end.
