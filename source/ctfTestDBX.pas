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
	
unit ctfTestDBX;

interface

uses
  OpenCTF,
  TestFrameWork, Classes;

type
  TDBXComponentTests = class(TComponentHandler)
  protected
    procedure AddTests; override;
  end;

implementation

uses
  SqlExpr;

{ TDBXComponentTests }

procedure TDBXComponentTests.AddTests;
begin
  inherited;
  CheckProperties(['SQLConnection']);
end;

end.
