(*
    OpenCTF - Component Test Framework
    Copyright (C) 2016 Michael Justin

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU Affero General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Affero General Public License for more details.

    You should have received a copy of the GNU Affero General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
*)

unit ctfTestTabOrder;

interface

uses
  OpenCTF, TestFrameWork, Classes;

type
  TTabOrderTests = class(TComponentHandler)
  protected
    procedure AddTests; override;
    function Handles(const Form: TComponent): Boolean; override;
  public
    constructor Create;
  end;

  TTabOrderTest = class(TComponentTest)
  protected
    procedure RunTest(testResult: TTestResult); override;
  end;

implementation

uses
  Controls, Forms;

type
 THackWinControl = class(TWinControl);

{ TTabOrderTests }

procedure TTabOrderTests.AddTests;
begin
  inherited;

  AddTest(TTabOrderTest.Create(CurrentComponent));
end;

constructor TTabOrderTests.Create;
begin
  inherited create(Controls.TWinControl);
end;

function TTabOrderTests.Handles(const Form: TComponent): Boolean;
begin
  Result := (Form is TCustomForm) or (Form is TCustomFrame);
end;

{ TTabOrderTest }

procedure TTabOrderTest.RunTest;
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
      (* if (NextControl.Left < CurrControl.Left) and (NextControl.Top < CurrControl.Top) then
      begin
        Fail('Tab order moves up+left to ' + NextControl.Name + ' (' + NextControl.ClassName + ')');
      end; *)

      if (* (NextControl.Left = CurrControl.Left) and*) (NextControl.Top < CurrControl.Top) then
      begin
        Fail('Tab order moves up to ' + NextControl.Name + ' (' + NextControl.ClassName + ')');
      end;

      if (NextControl.Left < CurrControl.Left) (* and (NextControl.Top = CurrControl.Top)*) then
      begin
        Fail('Tab order moves left to ' + NextControl.Name + ' (' + NextControl.ClassName + ')');
      end;
    end;
  end;
end;

end.
