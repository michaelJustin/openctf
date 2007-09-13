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

