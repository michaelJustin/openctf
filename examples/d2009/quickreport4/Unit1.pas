unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, DB, DBClient;

type
  TForm1 = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRDBText1: TQRDBText;
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
