unit TestForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, StdCtrls, ImgList, Menus, ComCtrls, TestFrame, ExtCtrls;

type
  TForm1 = class(TForm)
    ActList: TActionList;
    ActionOne: TAction;
    ActionTwo: TAction;
    ImageList: TImageList;
    MainMenu: TMainMenu;
    File1: TMenuItem;
    Edit1: TMenuItem;
    Quit1: TMenuItem;
    Copy1: TMenuItem;
    Paste1: TMenuItem;
    Cut1: TMenuItem;
    Options1: TMenuItem;
    Action11: TMenuItem;
    Action21: TMenuItem;
    N1: TMenuItem;
    Unassigned1: TMenuItem;
    PageControlOne: TPageControl;
    TabSheetTwo: TTabSheet;
    TabSheetOne: TTabSheet;
    Frame11: TFrame1;
    ButtonOne: TButton;
    ButtonTwo: TButton;
    Button3: TButton;
    Label1: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Timer1: TTimer;
    Label2: TLabel;
    procedure ActionOneExecute(Sender: TObject);
    procedure Quit1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.ActionOneExecute(Sender: TObject);
begin
  // Assigned Execute Handler
end;

procedure TForm1.Quit1Click(Sender: TObject);
begin
  // Assigned Click Handler
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  // TabSheet2.TabVisible := True;
end;

end.
