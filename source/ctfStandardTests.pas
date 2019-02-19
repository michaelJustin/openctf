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
  OpenCTF.Add(TComponentNameTestHandler.Create(TComponent));
  OpenCTF.Add(TBasicFormTestHandler.Create(TComponent));
  OpenCTF.Add(TTabOrderTestHandler.Create(TWinControl));

  // Menus.pas
  OpenCTF.Add(TMenuItemHandler.Create(TMenuItem));

  // Controls.pas
  OpenCTF.Add(TImageListHandler.Create(TImageList));

  // ComCtrls.pas
  OpenCTF.Add(TTabSheetHandler.Create(TTabSheet));

  // ActnLst.pas
  OpenCTF.Add(TCustomActionListTestHandler.Create(TCustomActionList));

  // DB.pas
  OpenCTF.Add(TCustomConnectionTestHandler.Create(TCustomConnection));
  OpenCTF.Add(TFieldTestHandler.Create(TField));
  OpenCTF.Add(TDataSetTestHandler.Create(TDataSet));
  OpenCTF.Add(TDataSourceTestHandler.Create(TDataSource));
  OpenCTF.Add(TParamTestHandler.Create(TParam));
  OpenCTF.Add(TDbAwareComponentTestHandler.Create(TComponent));

  // Provider.pas
  OpenCTF.Add(TCustomProviderTestHandler.Create(TCustomProvider));

  // DBClient.pas
  OpenCTF.Add(TCustomClientDataSetTestHandler.Create(TCustomClientDataSet));

  // SqlExpr.pas
  OpenCTF.Add(TDBXComponentTestHandler.Create(TCustomSQLDataSet));

end.



