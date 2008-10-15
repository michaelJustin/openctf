unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RpBase, RpSystem, RpRender, RpRenderCanvas, RpRenderPreview,
  RpDefine, RpRave, StdCtrls, RpCon, RpConDS, RpRenderText, RpRenderRTF;

type
  TForm1 = class(TForm)
    RvProject1: TRvProject;
    RvRenderPreview1: TRvRenderPreview;
    RvSystem1: TRvSystem;
    Button1: TButton;
    RvRenderRTF1: TRvRenderRTF;
    RvRenderText1: TRvRenderText;
    RvDataSetConnection1: TRvDataSetConnection;
    procedure Button1Click(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  // RvProject1.
end;

end.
