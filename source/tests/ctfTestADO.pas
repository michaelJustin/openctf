(** license **)
unit ctfTestADO;

interface
uses OpenCTF, ADODB;

type
  TCustomADODataSetTestHandler = class(TComponentHandler)
  protected
    procedure AddTests; override;
  end;

implementation

{ TCustomADODataSetTestHandler }

procedure TCustomADODataSetTestHandler.AddTests;
begin
  inherited;
  CheckProperties(['Connection']);
end;

initialization
  OpenCTF.Add(TCustomADODataSetTestHandler.Create(TCustomADODataSet));

end.
