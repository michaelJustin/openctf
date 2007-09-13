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
	
unit ctfTestNames;

interface
uses OpenCTF, TestFrameWork, Classes;

type
  TComponentNameTestHandler = class(TComponentHandler)
  protected
    function Accepts(const Component: TComponent): Boolean; override;
    procedure AddTests; override;
  end;

  TComponentNameTest = class(TComponentTest)
  protected
    procedure RunTest(testResult: TTestResult); override;
  end;
  
   (*
  TComponentCaptionTestHandler = class(TComponentHandler)
  protected
    function Accepts(const Component: TComponent): Boolean; override;
    procedure AddTests; override;
  end;

  TComponentCaptionTest = class(TComponentTest)
  protected
    procedure RunTest(testResult: TTestResult); override;
  end;  *)

implementation
uses ctfUtils, StdCtrls, ExtCtrls;

type
  ClazzList = array[0..4] of TClass;

const
  Check: ClazzList = (TButton, TCheckBox, TEdit, TListBox, TMemo);

resourcestring
  SIllegalName = 'Avoid default names for components (e.g. Button1: TButton)';
  SIllegalCaption = 'Component caption equals component name';

{ TComponentNameTestHandler }

function TComponentNameTestHandler.Accepts(const Component: TComponent):
  Boolean;

var
  I: Integer;
  CheckIt: Boolean;
begin
  CheckIt := False;

  for I := Low(Check) to High(Check) do
    if Component is Check[I] then
    begin
      CheckIt := True;
      Break;
    end;

  // include only components which still have default name
  Result := CheckIt and HasDefaultName(Component);
end;

procedure TComponentNameTestHandler.AddTests;
begin
  inherited;
  AddTest(TComponentNameTest.Create(CurrentComponent));
end;

{ TComponentNameTest }

procedure TComponentNameTest.RunTest(testResult: TTestResult);

begin
  inherited;

  // double-check first - maybe the component name has changed (?)
  if HasDefaultName(Component) then
    Fail(SIllegalName);

end;
  (*
{ TComponentCaptionTestHandler }

function TComponentCaptionTestHandler.Accepts(
  const Component: TComponent): Boolean;
begin
  Result := GetStringProperty(Component,'Caption') = Component.Name;
end;

procedure TComponentCaptionTestHandler.AddTests;
begin
  inherited;
  CurrentSuite.AddTest(TComponentCaptionTest.Create(CurrentComponent));
end;

{ TComponentCaptionTest }

procedure TComponentCaptionTest.RunTest(testResult: TTestResult);
begin
  inherited;

  if GetStringProperty(Component, 'Caption') = Component.Name then
    Fail(SIllegalCaption);
end;   *)

initialization
  OpenCTF.Add(TComponentNameTestHandler.Create(TComponent));
  // OpenCTF.Add(TComponentCaptionTestHandler.Create(TComponent));

end.

