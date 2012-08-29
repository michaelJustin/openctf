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
  OpenCTF.Add(TComponentNameTestHandler.Create(TComponent, 'Component name tests'));
  OpenCTF.Add(TBasicFormTestHandler.Create(TComponent));
  OpenCTF.Add(TTabOrderTestHandler.Create(TWinControl));


  // Menus.pas
  OpenCTF.Add(TMenuItemHandler.Create(TMenuItem));

  // Controls.pas
  OpenCTF.Add(TImageListHandler.Create(TImageList, 'ImageList tests'));

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
  OpenCTF.Add(TDbAwareComponentTestHandler.Create(TComponent, 'DbAwareComponent Tests'));

  // Provider.pas
  OpenCTF.Add(TCustomProviderTestHandler.Create(TCustomProvider));

  // DBClient.pas
  OpenCTF.Add(TCustomClientDataSetTestHandler.Create(TCustomClientDataSet));

  // SqlExpr.pas
  OpenCTF.Add(TDBXComponentTestHandler.Create(TCustomSQLDataSet));

end.



