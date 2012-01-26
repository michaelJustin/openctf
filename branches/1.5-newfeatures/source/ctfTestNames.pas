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
	
unit ctfTestNames;

interface

uses
  OpenCTF,
  TestFrameWork, Classes;

type
  TComponentNameTestHandler = class(TComponentHandler)
  protected
    procedure AddTests; override;
  end;

  TComponentNameTest = class(TComponentTest)
  protected
    procedure RunTest(testResult: TTestResult); override;
  end;
  
implementation

uses
  ctfUtils;

resourcestring
  SIllegalName = 'Avoid default names for components (e.g. Button1: TButton)';

{ TComponentNameTestHandler }

procedure TComponentNameTestHandler.AddTests;
begin
  inherited;

  AddTest(TComponentNameTest.Create(CurrentComponent));
end;

{ TComponentNameTest }

procedure TComponentNameTest.RunTest;
begin
  inherited;

  if HasDefaultName(Component) then
    Fail(SIllegalName);
end;

end.

