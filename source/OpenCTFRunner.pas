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

unit OpenCTFRunner;

interface

(**
 * Run the registered DUnit tests.
 * If a command line switch /console is present, use the TextTestRunner,
 * otherwise the GUITestRunner.
 *)
procedure Run;

implementation

uses
  GUITestRunner, TextTestRunner, SysUtils;

procedure Run;
begin
  if FindCmdLineSwitch('console') then
    TextTestRunner.RunRegisteredTests(rxbHaltOnFailures)
  else
    GUITestRunner.RunRegisteredTests;
end;

end.
