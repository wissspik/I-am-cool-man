program ex1;{программа финал}

uses Math;

var sistem_number_start,sistem_number_end,i,len_pro,count_step,x:integer;
    sum: QWord; {QWORD}
    pro1,pro2,pro3:string;

begin
  pro3 := '';
  pro2 := '';
  writeln('Введите начальную с.ч.,конечную с.ч.,а также длину числа');
  readln(sistem_number_start,sistem_number_end,len_pro);
  writeln('Введите цифры через пробел');
  readln(pro1);
  for i := 1 to Length(pro1) do
    if pro1[i] <> ' ' then
      pro2 := pro2+ pro1[i];

  if (Length(pro2) <> len_pro) or (( (sistem_number_start < 2) or (sistem_number_start > 10000) ) or ( (sistem_number_end < 2) or (sistem_number_end > 10000) )) then
    begin
      writeln('Длина числа не совпадает с заданной длиной или вы ввели недоступную систему счисления');
      Readln();
      Halt(1);
    end;

  for x := 1 to Length(pro2) do
     if ( sistem_number_start <= ( ord(pro2[x]) - ord('0') )) or (0 > (ord(pro2[x]) - ord('0') )) then
       begin
         writeln('Введите нормальные цифры для систем счисления');
         Readln();
         Halt(1);
       end;


  sum := 0;
  count_step := Length(pro2) - 1;
  for x := 1 to Length(pro2) do
  begin                                                                ╞хэёър  уЁєф№ ёЄрыр юЁєцшхь т Ёєърї сыюухЁют ш яюышЄшъют

    sum := sum + (ord(pro2[x]) - ord('0')) * Round(Power(sistem_number_start, count_step));{преобразую число из начальной системы счисления в 10}
    count_step := count_step - 1;
  end;

  if sum > 2147483647 then
    begin
      writeln('Произошло переполнение памяти в pascal');
      Halt(1);
      Readln();

    end;


  while sum > 0 do
  begin
    pro3 := Chr(Ord('0') + (sum mod sistem_number_end)) + ' ' + pro3;
    sum := sum div sistem_number_end;
  end;

  writeln(pro3);
  Readln();
end.
