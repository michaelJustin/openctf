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
	
unit ctfTestRave;

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

  TRvProjectTest = class(TComponentTest)
  protected
    procedure RunTest(testResult: TTestResult); override;
  end;

implementation

uses RpRave, SysUtils;

{ TComponentNameTestHandler }

function TComponentNameTestHandler.Accepts(const Component: TComponent):
  Boolean;
begin
  Result := inherited Accepts(Component) and (Copy(Component.ClassName, 1, 3) = 'TRv');
end;

procedure TComponentNameTestHandler.AddTests;
begin
  inherited;
  if CurrentComponent is TRvProject  then
  begin
    CheckProperties(['Engine']);
    AddTest(TRvProjectTest.Create(CurrentComponent, 'TestRvProjectFile'));
  end;
end;

{ TRvProjectTest }

procedure TRvProjectTest.RunTest(testResult: TTestResult);
var
  P: TRvProject;
begin
  inherited;
  P := TRvProject(Component);

  if P.ProjectFile = '' then
    Fail('ProjectFile not specified');

  if not FileExists(P.ProjectFile) then
    Fail('ProjectFile does not exist');

  if ExtractFileDrive(P.ProjectFile) <> '' then
    Fail('ProjectFile should not use an absolute path');


end;

initialization
  OpenCTF.Add(TComponentNameTestHandler.Create(TComponent));

end.

