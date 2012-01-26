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
    procedure AddFormTests; override;
  end;

implementation

uses
  ctfUtils;

resourcestring
  SIllegalName = 'Avoid default names for components (e.g. Button1: TButton)';

type
  TComponentNameTest = class(TComponentTest)
  protected
    procedure RunTest(testResult: TTestResult); override;
  end;

{ TComponentNameTestHandler }

procedure TComponentNameTestHandler.AddFormTests;
begin
  inherited;

  AddTest(TComponentNameTest.Create(Form, 'default component name'));
end;

{ TComponentNameTest }

procedure TComponentNameTest.RunTest;
var
  I: Integer;
  S: string;
begin
  inherited;

  for I := 0 to Component.ComponentCount - 1 do
  begin
    if HasDefaultName(Component.Components[I]) then
    begin
      S := S + (Component.Components[I].Name) + #13#10;
    end;
  end;

  if S <> '' then
    Fail(SIllegalName + #13#10 + S);
end;

end.

