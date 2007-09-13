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
	
unit ctfTestGlobalization;

interface
uses OpenCTF, ActnMan, TestFrameWork, Classes;

type
  TCustomActionListTestHandler = class(TComponentHandler)
  protected
    procedure AddTests; override;
  end;

  TContainedActionTest = class(TComponentTest)
  protected
    procedure RunTest(testResult: TTestResult); override;
  end;

implementation
uses ActnMenus, SysUtils;

{ TCustomActionListTestHandler }

procedure TCustomActionListTestHandler.AddTests;
begin
  inherited;

  AddTest(TContainedActionTest.Create(CurrentComponent));
end;

{ TContainedActionTest }

procedure TContainedActionTest.RunTest(testResult: TTestResult);
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
  OpenCTF.Add(TCustomActionListTestHandler.Create(TActionMainMenuBar));

end.

