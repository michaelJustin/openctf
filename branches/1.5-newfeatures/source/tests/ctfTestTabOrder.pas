(*
    OpenCTF - Component Test Framework
    Copyright (c) 2007  Michael Justin

    This program is free software; you can redistribute it and/or modify it
    under the terms of the GNU General Public License as published by the
    Free Software Foundation; either version 2 of the License, or (at your
    option) any later version.

    This program is distributed in the hope that it will be useful, but
    WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
    or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
    for more details.

    You should have received a copy of the GNU General Public License along
    with this program; if not, write to the Free Software Foundation, Inc.,
    59 Temple Place, Suite 330, Boston, MA 02111-1307 USA

    *)
	
unit ctfTestTabOrder;

interface

uses
  OpenCTF,
  TestFrameWork, Classes;

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
