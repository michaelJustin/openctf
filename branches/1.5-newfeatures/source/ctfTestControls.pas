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

// tests for components in unit "Controls"

unit ctfTestControls;

interface

uses
  OpenCTF,
  TestFrameWork, Classes;

type
  TImageListHandler = class(TComponentHandler)
  protected
    procedure AddTests; override;
  end;

  TImageListTest = class(TComponentTest)
  protected
    procedure RunTest(testResult: TTestResult); override;
  end;

implementation

uses
  Controls,
  SysUtils;

{ TImageListHandler }

procedure TImageListHandler.AddTests;
begin
  inherited;

  // CurrentSuite.AddTest(TImageListTest.Create(CurrentComponent));
end;

{ TImageListTest }

procedure TImageListTest.RunTest;
begin
  inherited;
  if TImageList(Component).Count=0 then
    Fail('ImageList is empty');
end;

end.

