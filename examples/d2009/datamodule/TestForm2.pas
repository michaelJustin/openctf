unit TestForm2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, StdCtrls, Mask, DBCtrls, DB;

type
  TForm2 = class(TForm)
    Button1: TButton;
    ActionList1: TActionList;
    Action1: TAction;
    Action2: TAction;
    DataSource1: TDataSource;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
    procedure CalledByDataModule;
  end;

var
  Form2: TForm2;

implementation

uses TestForm, TestDataModule2;

{$R *.dfm}

{ TForm2 }

procedure TForm2.CalledByDataModule;
begin
  Beep;
end;

end.
