unit Unit1;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWColor, IWTypes, IWGrids,
  IWCompCalendar, Controls, IWVCLBaseControl, IWBaseControl, IWBaseHTMLControl,
  IWControl, IWCompLabel, IWCompButton, IWHTMLControls, IWCompCheckbox,
  IWCompEdit, IWDBStdCtrls, IWDBGrids, IWCompOrderedListbox, IWCompTabControl,
  Forms, IWVCLBaseContainer, IWContainer, IWHTMLContainer, IWRegion, DB;

type
  TIWForm1 = class(TIWAppForm)
    IWDBNavigator1: TIWDBNavigator;
    IWTabControl1: TIWTabControl;
    IWTabControl1Page0: TIWTabPage;
    IWTabControl1Page1: TIWTabPage;
    IWTabControl1Page2: TIWTabPage;
    IWCalendar1: TIWCalendar;
    IWOrderedListbox1: TIWOrderedListbox;
    IWDBGrid1: TIWDBGrid;
    IWDBEdit1: TIWDBEdit;
    DataSource1: TDataSource;

  public
  end;

implementation

uses UserSessionUnit;

{$R *.dfm}

initialization
  TIWForm1.SetAsMainForm;

end.
