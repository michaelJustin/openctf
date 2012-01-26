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
	
unit ctfTestIBX;

interface

uses
  OpenCTF,
  TestFrameWork, Classes;

type
  TIBXComponentTestHandler = class(TComponentHandler)
  protected
    function Accepts(const Component: TComponent): Boolean; override;
    procedure AddTests; override;
  end;

implementation

{ TIBXComponentTestHandler }

function TIBXComponentTestHandler.Accepts(const Component: TComponent): Boolean;
var
  HasDatabase, HasTransaction: Boolean;
begin
  Result := False;
  if inherited Accepts(Component) then
  begin
    HasDatabase := HasProperty(Component, 'Database');
    HasTransaction := HasProperty(Component, 'Transaction');
    Result := HasDatabase and HasTransaction;
  end;
end;

procedure TIBXComponentTestHandler.AddTests;
begin
  inherited;
  CheckProperties(['Database', 'Transaction']);
end;

initialization
  OpenCTF.Add(TIBXComponentTestHandler.Create(TComponent, 'TIBXComponentTestHandler Tests'));

end.
