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

unit ctfStandardTests;

interface

uses
  Classes,
    ctfTestForm, ctfTestFrame, ctfTestNames, ctfTestTabOrder,
  Controls,
    ctfTestControls,
  Menus,
    ctfTestMenus,
  ComCtrls,
    ctfTestComCtrls,
  ActnList,
    ctfTestActnList,
  DB,
    ctfTestDB,
  Provider,
    ctfTestProvider,
  DBClient,
    ctfTestDBClient,
  SqlExpr,
    ctfTestDBX
  ;

implementation

uses
  OpenCTF;

initialization
  // Classes.pas
  OpenCTF.Add(TComponentNameTests.Create(Classes.TComponent));
  OpenCTF.Add(TBasicFormTests.Create(Classes.TComponent));

  // Controls.pas
  OpenCTF.Add(TTabOrderTests.Create(Controls.TWinControl));

  // Menus.pas
  OpenCTF.Add(TMenuItemTests.Create(Menus.TMenuItem));

  // Controls.pas
  OpenCTF.Add(TImageListTests.Create(Controls.TImageList));

  // ComCtrls.pas
  OpenCTF.Add(TTabSheetTests.Create(ComCtrls.TTabSheet));

  // ActnList.pas
  OpenCTF.Add(TCustomActionListTests.Create(ActnList.TCustomActionList));

  // DB.pas
  OpenCTF.Add(TCustomConnectionTests.Create(DB.TCustomConnection));
  OpenCTF.Add(TFieldTests.Create(DB.TField));
  OpenCTF.Add(TDataSetTests.Create(DB.TDataSet));
  OpenCTF.Add(TDataSourceTests.Create(DB.TDataSource));
  OpenCTF.Add(TParamTests.Create(DB.TParam));
  OpenCTF.Add(TDbAwareComponentTests.Create(Classes.TComponent));

  // Provider.pas
  OpenCTF.Add(TCustomProviderTests.Create(Provider.TCustomProvider));

  // DBClient.pas
  OpenCTF.Add(TCustomClientDataSetTests.Create(DBClient.TCustomClientDataSet));

  // SqlExpr.pas
  OpenCTF.Add(TDBXComponentTests.Create(SqlExpr.TCustomSQLDataSet));

end.



