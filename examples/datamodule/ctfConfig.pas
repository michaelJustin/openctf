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

unit ctfConfig;

interface

implementation

uses
  OpenCTF,
  ctfTestForm, ctfTestNames, ctfTestControls, ctfTestDB, ctfTestProvider,
  ctfTestDBClient, ctfTestDBX,
  Classes;

initialization
  OpenCTF.Add(TBasicFormTests.Create);
  OpenCTF.Add(TCustomConnectionTests.Create);
  OpenCTF.Add(TFieldTests.Create);
  OpenCTF.Add(TDataSetTests.Create);
  OpenCTF.Add(TDataSourceTests.Create);
  OpenCTF.Add(TParamTests.Create);
  OpenCTF.Add(TDbAwareComponentTests.Create);
  OpenCTF.Add(TCustomProviderTests.Create);
  OpenCTF.Add(TCustomClientDataSetTests.Create);
  OpenCTF.Add(TDBXComponentTests.Create);

end.



