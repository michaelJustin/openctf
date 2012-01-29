unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Unit2, Mask, DBCtrls, DB;

type
  TForm1 = class(TForm)
    Frame21: TFrame2;
    Frame22: TFrame2;
    Frame23: TFrame2;
    Label1: TLabel;
    Button1: TButton;
    GroupBox1: TGroupBox;
    DBText1: TDBText;
    DBEdit1: TDBEdit;
    DataSource1: TDataSource;
    DBTextOk: TDBText;
    DBEdit2: TDBEdit;
    DataSourceOk: TDataSource;
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

implementation

uses
  Unit3;

{$R *.dfm}

end.
