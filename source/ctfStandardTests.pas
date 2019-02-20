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
  // Classes,
    ctfTestForm, ctfTestFrame, ctfTestNames, ctfTestTabOrder,
  // Controls,
    ctfTestControls,
  // Menus,
    ctfTestMenus,
  // ComCtrls,
    ctfTestComCtrls,
  // ActnList,
    ctfTestActnList,
  // DB,
    ctfTestDB,
  // Provider,
    ctfTestProvider,
  // DBClient,
    ctfTestDBClient,
  // SqlExpr,
    ctfTestDBX
  ;

implementation

uses
  OpenCTF,
  StdCtrls, ExtCtrls, Forms, Classes,
  DB, Provider, DBClient, SqlExpr;

initialization
  // Classes.pas
  OpenCTF.Add((TComponentNameTests.Create)
    .Exclude(TLabel) // exclude TLabel from tests (allow default name)
    .Exclude(TFrame) // and TFrame
    .Exclude(TPanel) // and TPanel
    );

  OpenCTF.Add(TBasicFormTests.Create);

  // Controls.pas
  OpenCTF.Add(TTabOrderTests.Create);

  // Menus.pas
  OpenCTF.Add(TMenuItemTests.Create);

  // Controls.pas
  OpenCTF.Add(TImageListTests.Create);

  // ComCtrls.pas
  OpenCTF.Add(TTabSheetTests.Create);

  // ActnList.pas
  OpenCTF.Add(TCustomActionListTests.Create);

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



