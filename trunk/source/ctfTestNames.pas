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
    function Accepts(const Component: TComponent): Boolean; override;
    procedure AddTests; override;
  end;

  TComponentNameTest = class(TComponentTest)
  protected
    procedure RunTest(testResult: TTestResult); override;
  end;
  
implementation

uses
  ctfUtils,
  StdCtrls;

resourcestring
  SIllegalName = 'Avoid default names for components';

{ TComponentNameTestHandler }

function TComponentNameTestHandler.Accepts(const Component: TComponent):
  Boolean;
var
  CheckIt: Boolean;
begin
  CheckIt :=  // Component.UnitName = 'StdCtrls';
    not (Component is TLabel);

  // include only components which still have default name
  Result := CheckIt and HasDefaultName(Component);
end;

procedure TComponentNameTestHandler.AddTests;
begin
  inherited;
  AddTest(TComponentNameTest.Create(CurrentComponent));
end;

{ TComponentNameTest }

procedure TComponentNameTest.RunTest;

begin
  inherited;

  // double-check first - maybe the component name has changed (?)
  if HasDefaultName(Component) then
    Fail(SIllegalName);
end;

end.

