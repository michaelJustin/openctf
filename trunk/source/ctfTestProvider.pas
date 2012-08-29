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
	
unit ctfTestProvider;

interface

uses
  OpenCTF,
  TestFrameWork, Provider, Classes;

type
  TCustomProviderTestHandler = class(TComponentHandler)
  protected
    procedure AddTests; override;
  end;

implementation

{ TCustomProviderTestHandler }

procedure TCustomProviderTestHandler.AddTests;
begin
  inherited;
  // check if the Provider is connected to a dataset
  CheckProperties(['DataSet']);
end;

end.
