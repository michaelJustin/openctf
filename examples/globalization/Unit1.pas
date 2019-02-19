unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, StdActns, XPStyleActnCtrls, ActnMan, ToolWin, ActnCtrls,
  ActnMenus, Grids, DBGrids;

type
  TForm1 = class(TForm)
    ActionMainMenuBar1: TActionMainMenuBar;
    ActionManager1: TActionManager;
    FileExit1: TFileExit;
    EditCopy1: TEditCopy;
    FileFile1: TAction;
    DBGrid1: TDBGrid;
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Form1: TForm1;

implementation

uses Unit2;

{$R *.dfm}

end.
