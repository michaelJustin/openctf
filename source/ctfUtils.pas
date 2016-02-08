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

unit ctfUtils;

interface

uses
  Classes;

function HasDefaultName(const Component: TComponent): Boolean;

implementation

uses
  SysUtils;

function HasDefaultName(const Component: TComponent): Boolean;
var
  NumericPart: string;
  ClazzName: string;
  ClazzNameLength: Integer;
  IsNumeric: Boolean;
begin
  IsNumeric := False;

  ClazzName := Copy(Component.ClassName, 2, Length(Component.ClassName) - 1);

  if Pos(ClazzName, Component.Name) = 1 then
  begin
    ClazzNameLength := Length(ClazzName);

    if Length(Component.Name) > ClazzNameLength then
    begin
      NumericPart := Copy(Component.Name, ClazzNameLength + 1,
        Length(Component.Name) - ClazzNameLength);

      if NumericPart <> '' then
      try
        StrToInt(NumericPart);
        IsNumeric := True;
      except

      end;

    end;
    
  end;

  Result := IsNumeric;

end;

end.

