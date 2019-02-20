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

    // other methods
    function Accepts(const Component: TComponent): Boolean;

    function Exclude(ExcludedClass: TComponentClass): IComponentHandler;

    function Handles(const Form: TComponent): Boolean;

    procedure AddTests;

    function HasProperty(const Component: TComponent; const PropName: string;
      const AKinds: TTypeKinds = []): Boolean;

    function GetSuite: ITestSuite;

    function HandlerClass: TClass;

    // properties
    property Form: TComponent read GetForm write SetForm;

  end;

implementation

end.

