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

unit ctfTestFrame;

interface

uses
  OpenCTF, TestFrameWork;

type
  TFrameTests = class(TComponentHandler)
  protected
    procedure AddTests; override;
  end;

  TFrameTest = class(TFormTest)
  protected
    procedure RunTest(testResult: TTestResult); override;
  end;

implementation

uses
  ctfUtils,
  Forms;

resourcestring
  SIllegalName = 'Avoid default names for frames (e.g. Frame21: TFrame2)';

{ TFrameTests }

procedure TFrameTests.AddTests;
begin
  inherited;

  AddTest(TFrameTest.Create(CurrentComponent, 'TestDefaultName'));
end;

{ TFrameTest }

procedure TFrameTest.RunTest;
begin
  inherited;

  if HasDefaultName(Form) then
    Fail(SIllegalName);
end;

end.
