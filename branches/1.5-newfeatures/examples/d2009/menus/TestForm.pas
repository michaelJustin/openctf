unit TestForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ActnList;

type
  TForm1 = class(TForm)
    MainMenuOk: TMainMenu;
    a1: TMenuItem;
    b1: TMenuItem;
    g1: TMenuItem;
    MainActionList: TActionList;
    ActionNotOk1: TAction;
    ActionOk: TAction;
    ActionNotOk2: TAction;
    x1: TMenuItem;
    procedure b1Click(Sender: TObject);
    procedure ActionOkExecute(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.ActionOkExecute(Sender: TObject);
begin
  // assigned.
end;

procedure TForm1.b1Click(Sender: TObject);
begin
  // 
end;

end.
