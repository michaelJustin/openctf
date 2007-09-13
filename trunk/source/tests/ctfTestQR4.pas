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
	
unit ctfTestQR4;

interface
uses OpenCTF, TestFrameWork, Classes;

type
  TQR4TestHandler = class(TComponentHandler)
  protected
    function Accepts(const Component: TComponent): Boolean; override;
    procedure AddTests; override;
  end;

  TQR4ProjectTest = class(TComponentTest)
  protected
    procedure RunTest(testResult: TTestResult); override;
  end;

implementation
uses SysUtils;

{ TQR4TestHandler }

function TQR4TestHandler.Accepts(const Component: TComponent):
  Boolean;
begin
  Result := inherited Accepts(Component) and (Copy(Component.ClassName, 1, 5) =
    'TQRDB');
end;

procedure TQR4TestHandler.AddTests;
begin
  inherited;

  if HasProperty(CurrentComponent, 'DataField') then
    CheckProperties(['DataField']);

  if HasProperty(CurrentComponent, 'DataSet') then
    CheckProperties(['DataSet'])

end;

{ TQR4ProjectTest }

procedure TQR4ProjectTest.RunTest(testResult: TTestResult);
begin
  inherited;
end;

initialization
  OpenCTF.Add(TQR4TestHandler.Create(TComponent));

end.

