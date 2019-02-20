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

unit ctfTestDBClient;

interface

uses
  OpenCTF;

type
  TCustomClientDataSetTests = class(TComponentHandler)
  protected
    procedure AddTests; override;
  end;

implementation

{ TCustomClientDataSetTests }

procedure TCustomClientDataSetTests.AddTests;
begin
  inherited;

  // check if the OnReconcileError event handler is assigned
  CheckEvents(['OnReconcileError']);
  // check if the ProviderName property is assigned
  CheckProperties(['ProviderName']);
end;

end.

