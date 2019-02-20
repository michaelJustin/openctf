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

unit ctfTestGlobalization;

interface

uses
  OpenCTF, ActnMan, TestFrameWork, Classes;

type
  TCustomActionListTests = class(TComponentHandler)
  protected
    procedure AddTests; override;
  end;

  TContainedActionTest = class(TComponentTest)
  protected
    procedure RunTest(testResult: TTestResult); override;
  end;

implementation

uses
  ActnMenus, SysUtils;

{ TCustomActionListTests }

procedure TCustomActionListTests.AddTests;
begin
  inherited;

  AddTest(TContainedActionTest.Create(CurrentComponent));
end;

{ TContainedActionTest }

procedure TContainedActionTest.RunTest;
var
  I: Integer;
  TmpActionClientItem: TActionClientItem;
begin
  inherited;

  // see http://www.tsilang.com/delphiglobalizationtool_faq.html#10:
  // to localize a TActionMainMenuBar, all TActionClientItems should be
  // linked to a 'fake' Action
  with TActionMainMenuBar(Component) do
  begin
    for I := 0 to ActionClient.Items.Count - 1 do
    begin
      TmpActionClientItem := ActionClient.Items[I];
      if not Assigned(TmpActionClientItem.Action) then
        Fail(TmpActionClientItem.Caption + ' - no Action assigned');
    end;
  end;

end;

initialization
  OpenCTF.Add(TCustomActionListTests.Create(TActionMainMenuBar));

end.

