unit ctfUtils;

interface

uses
  Classes;

function HasDefaultName(const Component: TComponent): Boolean;

implementation

uses
  SysUtils;

function HasDefaultName(const Component: TComponent): Boolean;
var
  NumericPart: string;
  ClazzName: string;
  ClazzNameLength: Integer;
  IsNumeric: Boolean;
begin
  IsNumeric := False;

  ClazzName := Copy(Component.ClassName, 2, Length(Component.ClassName) - 1);

  if Pos(ClazzName, Component.Name) = 1 then
  begin
    ClazzNameLength := Length(ClazzName);

    if Length(Component.Name) > ClazzNameLength then
    begin
      NumericPart := Copy(Component.Name, ClazzNameLength + 1,
        Length(Component.Name) - ClazzNameLength);

      if NumericPart <> '' then
      try
        StrToInt(NumericPart);
        IsNumeric := True;
      except

      end;

    end;
    
  end;

  Result := IsNumeric;

end;

end.

