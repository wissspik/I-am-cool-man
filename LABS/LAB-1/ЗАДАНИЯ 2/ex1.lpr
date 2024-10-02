program z3;
uses Math;
var
  HUMSTER_1, HUMSTER_2, f_values, formula,  pupper_bound: double;
  ARRAY_RESULT: array[0..100000] of double; //
  i, iteration, k,l: integer;
  SIGMA_TRUE_PAPA:TextFile;
begin
  AssignFile(SIGMA_TRUE_PAPA,'COOL_PERETS.txt');
  ReWrite(SIGMA_TRUE_PAPA);
  readln(HUMSTER_1);
  readln(HUMSTER_2);
  ARRAY_RESULT[1] := HUMSTER_2;

  for l := 1 to 10 do  {�������� � 1, ��� ��� ���������� l-1}
  begin
    ARRAY_RESULT[l] := ARRAY_RESULT[l - 1] + (HUMSTER_1 - HUMSTER_2) / 10; {����� ��� ��� ���������}

    for i := 1 to 6 do
    begin
      pupper_bound := 1;
      for k := 1 to i do
      begin
        pupper_bound := pupper_bound * 0.1;
      end;

      f_values := ARRAY_RESULT[l];
      formula:= 1;
      iteration := 2;
      while abs(formula) >= pupper_bound do  {���������� pupper_bound ������ p}
      begin
        formula := formula * ARRAY_RESULT[l] * ARRAY_RESULT[l] / (iteration * (iteration + 1));    {US FORM}{!!!!!!!!!!!!!}
        f_values := f_values - formula;
        iteration := iteration + 1; {���������� ���������� ��������}
      end;

      Writeln(SIGMA_TRUE_PAPA,ARRAY_RESULT[l]:10:2, '    ', pupper_bound, '     ', f_values:40:40, '    ', iteration, '    ', formula);  {������ �������� ���������� � ���� 'COOL_PERETS'}
      Writeln(SIGMA_TRUE_PAPA,(' '));
    end;
  end;
  CloseFile(SIGMA_TRUE_PAPA); {�������� ����,����� ��������� �������� ��������}
  Readln();
end.



