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
  ctfTestForm, ctfTestFrame, ctfTestNames, ctfTestTabOrder, ctfTestControls,
  ctfTestMenus, ctfTestComCtrls, ctfTestActnList,
  StdCtrls, ExtCtrls, Forms, Classes;

initialization
  OpenCTF.Add((TComponentNameTests.Create)
    .Exclude(StdCtrls.TLabel) // exclude TLabel from tests (allow default name)
    .Exclude(Forms.TFrame)    // exclude TFrame
    .Exclude(ExtCtrls.TPanel) // exclude TPanel
    );
  OpenCTF.Add(TBasicFormTests.Create);
  OpenCTF.Add(TTabOrderTests.Create);
  OpenCTF.Add(TMenuItemTests.Create);
  OpenCTF.Add(TImageListTests.Create);
  OpenCTF.Add(TTabSheetTests.Create);
  OpenCTF.Add(TCustomActionListTests.Create);

end.



