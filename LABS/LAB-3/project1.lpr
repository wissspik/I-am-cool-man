program ex1;

type
  TSumDoubleNumber = class
    x, y: integer;
    procedure Summa(number_1, number_2: integer);
    procedure Print;
    constructor Create(number_1, number_2: integer); // Конструктор
  end;

constructor TSumDoubleNumber.Create(number_1,number_2: integer);
begin
  x :=number_1;  // Присваиваем значение переменной x
  y := number_2;  // Присваиваем значение переменной y
end;

procedure TSumDoubleNumber.Summa(number_1, number_2: integer);
var
  c: integer;
begin
  c := number_1 + number_2;
  writeln(c);
end;

procedure TSumDoubleNumber.Print;
begin
  if x mod 2 = 0 then

  writeln('X = ', x, ' Y = ', y);
end;

var
  MyObject: TSumDoubleNumber;

begin
  MyObject := TSumDoubleNumber.Create(55, 10); // Создаем объект с заданными значениями
  MyObject.Print; // Вывод значений x и y
  Readln();
end.


