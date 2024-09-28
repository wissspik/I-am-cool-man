unit VOV_3;

interface

type
  TSumDoubleNumber = class
    x, y: integer;
    procedure Summa(number_1, number_2: integer);
    procedure Print;
  end;

implementation

procedure TSumDoubleNumber.Summa(number_1, number_2: integer);
var
  c: integer;
begin
  c := number_1 + number_2;
  writeln(c);
end;

procedure TSumDoubleNumber.Print;
begin
  writeln($'X = {x} Y = {y}');
end;

end.



