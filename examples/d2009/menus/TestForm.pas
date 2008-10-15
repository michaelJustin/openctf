unit TestForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ActnList;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    a1: TMenuItem;
    b1: TMenuItem;
    g1: TMenuItem;
    ActionList1: TActionList;
    Action1: TAction;
    Action2: TAction;
    Action3: TAction;
    x1: TMenuItem;
    procedure b1Click(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Action2Execute(Sender: TObject);
begin
  // assigned.
end;

procedure TForm1.b1Click(Sender: TObject);
begin
  // 
end;

end.
