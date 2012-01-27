(*
    OpenCTF - Component Test Framework
    Copyright (c) 2007-2011 Michael Justin

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
	
unit CTFInterfaces;

interface

uses
  TestFramework,
  TypInfo, Contnrs, Classes;

type
   (**
   * \interface IComponentHandler
   * The interface which defines the methods and properties
   * of a 'Component Handler' class.
   *)
  IComponentHandler = interface
    // Setter/Getter
    procedure SetForm(const Value: TComponent);
    function GetForm: TComponent;

    function Accepts(const Component: TComponent): Boolean;

    function Handles(const Form: TComponent): Boolean;

    procedure AddTests;

    //function HasProperty(const Component: TComponent; const PropName: string;
    //  const AKinds: TTypeKinds = []): Boolean;

    // function GetSuite: ITestSuite;

    function HandlerClass: TClass;

    // properties
    property Form: TComponent read GetForm write SetForm;

  end;

implementation

end.

