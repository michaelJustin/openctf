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
unit ctfTestActnList;

interface

uses
  OpenCTF,
  TestFrameWork, ActnList, Classes;

type
  TCustomActionListTests = class(TComponentHandler)
  protected
    procedure AddTests; override;
  public
    constructor Create;
  end;

  TContainedActionTest = class(TComponentTest)
  protected
    procedure RunTest(testResult: TTestResult); override;
  end;

implementation

uses
  SysUtils;

{ TCustomActionListTests }

procedure TCustomActionListTests.AddTests;
var
  I: Integer;
  TmpAction: TContainedAction;
  TmpSuite: ITestSuite;
begin
  inherited;
  TmpSuite := TTestSuite.Create(CurrentComponent.Name + ' actions');

  with TCustomActionList(CurrentComponent) do
  begin
    for I := 0 to ActionCount - 1 do
    begin
      TmpAction := Actions[I];
      if TmpAction.ClassNameIs('TAction') then
        // check if the OnExecute event handler is assigned
        TmpSuite.AddTest(TRequiredEventsTest.Create(TmpAction, ['OnExecute']));
        // special checks for the Action
        // todo needs a filter and a test item description text
        // TmpSuite.AddTest(TContainedActionTest.Create(TmpAction));
    end;
  end;

  if TmpSuite.CountTestCases > 0 then
    CurrentSuite.AddSuite(TmpSuite);
end;

constructor TCustomActionListTests.Create;
begin
  inherited Create(ActnList.TCustomActionList);
end;

{ TContainedActionTest }

procedure TContainedActionTest.RunTest(testResult: TTestResult);
var
  TmpAction: TContainedAction;
  Name: TComponentName;
  ImageIndex: Integer;
begin
  inherited;

  TmpAction := TContainedAction(Component);
  Name := Component.Name;

  if TmpAction is TCustomAction then
  begin
    ImageIndex := TCustomAction(TmpAction).ImageIndex;
    if ImageIndex <> -1 then
      Check(Assigned(TmpAction.ActionList.Images),
        Name + '.ImageIndex=' + IntToStr(ImageIndex)
          + ' but ' + TmpAction.ActionList.Name
          + '.Images property is not assigned.');
  end;

end;

end.

