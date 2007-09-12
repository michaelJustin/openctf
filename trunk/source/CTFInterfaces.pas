(** license **)
unit CTFInterfaces;

interface
{$IFDEF CLR}
uses NUnit.Framework, NUnit.Core, TypInfo, Contnrs, Classes;
{$ELSE}
uses TestFramework, TypInfo, Contnrs, Classes;
{$ENDIF}

type
{$IFDEF CLR}
  ITestSuite = TestSuite;
{$ENDIF}

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

    function Handles(const Form: TComponent): Boolean;

    procedure AddTests;

    function HasProperty(const Component: TComponent; const PropName: string;
      const AKinds: TTypeKinds = []): Boolean;

    // procedure Initialize;

    function GetSuite: ITestSuite;

    // properties
    property Form: TComponent read GetForm write SetForm;

  end;

implementation

end.

