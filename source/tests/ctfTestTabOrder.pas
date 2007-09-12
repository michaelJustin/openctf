(** license **)
unit ctfTestTabOrder;

interface
uses OpenCTF, TestFrameWork, Classes;

type
  TTabOrderTestHandler = class(TComponentHandler)
  protected
    procedure AddTests; override;
    function Handles(const Form: TComponent): Boolean; override;
  end;

  TTabOrderTest = class(TComponentTest)
  protected
    procedure RunTest(testResult: TTestResult); override;
  end;

implementation
uses Controls, Forms;

type
 THackWinControl = class(TWinControl);

{ TTabOrderTestHandler }

procedure TTabOrderTestHandler.AddTests;
begin
  inherited;
  AddTest(TTabOrderTest.Create(CurrentComponent));
end;

function TTabOrderTestHandler.Handles(const Form: TComponent): Boolean;
begin
  Result := (Form is TCustomForm) or (Form is TCustomFrame);
end;

{ TTabOrderTest }

procedure TTabOrderTest.RunTest(testResult: TTestResult);
var
  ParentControl: TWinControl;
  CurrControl: TWinControl;
  NextControl: TWinControl;
begin
  inherited;

  CurrControl := TWinControl(Component);
  ParentControl := CurrControl.Parent;
  NextControl := THackWinControl(ParentControl).FindNextControl(CurrControl, True, True, True);

  if Assigned(NextControl) then begin
    if NextControl.TabOrder > CurrControl.TabOrder then
    begin
      if (NextControl.Left < CurrControl.Left) and (NextControl.Top < CurrControl.Top) then
      begin
        Fail('Tab order moves up+left to ' + NextControl.Name + ' (' + NextControl.ClassName + ')');
      end;

      if (NextControl.Left = CurrControl.Left) and (NextControl.Top < CurrControl.Top) then
      begin
        Fail('Tab order moves up to ' + NextControl.Name + ' (' + NextControl.ClassName + ')');
      end;

      if (NextControl.Left < CurrControl.Left) and (NextControl.Top = CurrControl.Top) then
      begin
        Fail('Tab order moves left to ' + NextControl.Name + ' (' + NextControl.ClassName + ')');
      end;
      
    end;
  end;


    
end;


initialization
  OpenCTF.Add(TTabOrderTestHandler.Create(TWinControl));

end.
