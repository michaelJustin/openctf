(** license **)
unit ctfTestDBX;

interface
uses OpenCTF, TestFrameWork, Classes;

type
  TDBXComponentTestHandler = class(TComponentHandler)
  protected
    procedure AddTests; override;
  end;

implementation
uses SqlExpr;

{ TIBXComponentTestHandler }

procedure TDBXComponentTestHandler.AddTests;
begin
  inherited;
  CheckProperties(['SQLConnection']);
end;

initialization
  OpenCTF.Add(TDBXComponentTestHandler.Create(TCustomSQLDataSet));

end.
