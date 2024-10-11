program unit1;

var
  values_x, Formula_result, first_x, final_x, step_number: real;
  iteration, i, j, m, x: integer;
  steps_EPS1: array[1..6] of real;
  X_number: array[1..10] of real;
  SIGMA: TextFile;

begin
  AssignFile(SIGMA, 'SIGMA.txt');
  Rewrite(SIGMA);


  steps_EPS1[1] := 0.1;
  for x := 2 to 6 do
    steps_EPS1[x] := steps_EPS1[x-1] * 0.1;
  writeln('123');

  readln(first_x);
  readln(final_x);

  step_number := (final_x - first_x) / 9;
  for i := 0 to 9 do
  begin
    X_number[i+1] := first_x + step_number * i;
    writeln('X_number[', i+1, '] = ', X_number[i+1]:10:6);
  end;

  for j := 1 to 10 do
  begin
    for i := 1 to 6 do
    begin
      iteration := 1;
      values_x := 1;
      Formula_result := 1;
      while abs(Formula_result) >= steps_EPS1[i] do
      begin
        Formula_result := Formula_result * (X_number[j] / iteration);
        writeln('Iteration: ', iteration, ' X_number[j]: ', X_number[j]:10:6, ' Formula_result: ', Formula_result:10:6);
        values_x := values_x + Formula_result;
        iteration := iteration + 1;
      end;
      Write(SIGMA, X_number[j]:10:4, ' ');
      Write(SIGMA, steps_EPS1[i]:10:6, ' ');
      Write(SIGMA, values_x:10:6, '      ');
      Writeln(SIGMA, iteration, ' ');
    end;
    Writeln(SIGMA, ' ');
  end;

  CloseFile(SIGMA); // Close the file
end.

