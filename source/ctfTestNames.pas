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

unit ctfTestNames;

interface

uses
  OpenCTF,
  TestFrameWork, Classes;

type
  TComponentNameTests = class(TComponentHandler)
  protected
    function Accepts(const Component: TComponent): Boolean; override;
    procedure AddTests; override;
  public
    constructor Create;
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

{ TComponentNameTests }

function TComponentNameTests.Accepts(const Component: TComponent):
  Boolean;
begin
  Result := inherited Accepts(Component)
            and not (Component is TLabel) // exclude labels
            and HasDefaultName(Component);  // include only components which still have default name
end;

procedure TComponentNameTests.AddTests;
begin
  inherited;

  AddTest(TComponentNameTest.Create(CurrentComponent));
end;

constructor TComponentNameTests.Create;
begin
  inherited Create(Classes.TComponent);
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

