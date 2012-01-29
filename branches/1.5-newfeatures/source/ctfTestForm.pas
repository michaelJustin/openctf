(*
    OpenCTF - Component Test Framework
    Copyright (c) 2007  Michael Justin

    This program is free software; you can redistribute it and/or modify it
    under the terms of the GNU General Public License as published by the
    Free Software Foundation; either version 2 of the License, or (at your
    option) any later version.

    This program is distributed in the hope that it will be useful, but
    WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
    or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
    for more details.

    You should have received a copy of the GNU General Public License along
    with this program; if not, write to the Free Software Foundation, Inc.,
    59 Temple Place, Suite 330, Boston, MA 02111-1307 USA

    *)
	
unit ctfTestForm;

interface

uses
  OpenCTF, TestFrameWork, Classes;

type
  (**
   * \class TTComponentHandler
   *
   * A handler for ...
   *)
  TTComponentHandler = class(TComponentHandler)
  protected
    procedure AddFormTests; override;
    function Handles(const Form: TComponent): Boolean; override;
  end;

  (**
   * \class TBasicFormTest
   *
   * A test for ...
   *
   *)
  TBasicFormTest = class(TComponentTest)
  protected
    procedure RunTest(testResult: TTestResult); override;
  end;

implementation

uses
  ctfUtils,
  Forms, SysUtils;

resourcestring
  SEmpty = 'Empty form (or datamodule).';

{ TBasicFormTestHandler }

procedure TTComponentHandler.AddFormTests;
begin
  inherited;

  AddTest(TBasicFormTest.Create(Form, Format('%s empty form', Form.Name));
end;

function TTComponentHandler.Handles(const Form: TComponent): Boolean;
begin
  Result := (Form is TCustomForm) or (Form is TDataModule) or (Form is TCustomFrame);
end;

{ TBasicFormTest }

procedure TBasicFormTest.RunTest;
begin
  inherited;

  if Component.ComponentCount = 0 then
    Fail(SEmpty);
end;


end.
