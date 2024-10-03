program z3;
 uses WinCrt;
 var
   SIGMA: TextFile;
   finali_x, first_x, value_x, steps_grade, formula: real;
   x_array: array [0..1000] of real;
   Flag:Boolean;
   l, i, iteration, k,count: integer;
begin
  AssignFile(SIGMA, 'SIGMA.txt');
  Rewrite(SIGMA);
  writeln(SIGMA,'         x              eps            f(x)        iteration');
  writeln('введите начальное значение для  x');
  readln(first_x);
  writeln('введите конечнео значение для  x');
  readln(finali_x);
  if (first_x > 0.25) or (first_x < -0.7) or(finali_x > 0.25) or (finali_x < -0.7) or (first_x > finali_x) then  // TEST
  begin
    writeln('Введите корректные числа для X');
    readln;
    Halt(1);
  end;
  x_array[1] := first_x;
  x_array[10] := finali_x;
  for l := 1 to 10 do
  begin
    if (l >= 2) and (l < 10) then
      x_array[l] := x_array[l - 1] + (finali_x - first_x) / 9;
    Flag := True;
    for i := 1 to 6 do
    begin
      steps_grade := 1;
      count :=  0;
      for k := 1 to i do
      begin
        steps_grade := steps_grade * 0.1;
        inc(count);
      end;
      value_x := x_array[l];
      formula := x_array[l];
      iteration := 2;
      while abs(formula) >= steps_grade do
      begin
        formula := formula * ((iteration + 1) * x_array[l]) / iteration;
        value_x := (value_x + formula);
        iteration := iteration + 1;
      end;
      if Flag then
          begin
            writeln(SIGMA, l , '       ', x_array[l]:10:5, '     10 ** -',count, '     ', value_x:10:5, '     ', iteration);
            Flag := False;
          end
      else
          writeln(SIGMA,'       ', x_array[l]:10:5, '     10 ** -',count, '     ', value_x:9:6, '     ', iteration);
    end;
  end;
  CloseFile(SIGMA);
  readln;
end.

