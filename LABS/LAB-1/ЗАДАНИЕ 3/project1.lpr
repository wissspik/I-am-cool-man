program ex1;{�ணࠬ�� 䨭��}

uses Math;

var sistem_number_start,sistem_number_end,i,len_pro,count_step,x:integer;
    sum: QWord; {QWORD}
    pro1,pro2,pro3:string;

begin
  pro3 := '';
  pro2 := '';
  writeln('������ ��砫��� �.�.,������� �.�.,� ⠪�� ����� �᫠');
  readln(sistem_number_start,sistem_number_end,len_pro);
  writeln('������ ���� �१ �஡��');
  readln(pro1);
  for i := 1 to Length(pro1) do
    if pro1[i] <> ' ' then
      pro2 := pro2+ pro1[i];

  if (Length(pro2) <> len_pro) or (( (sistem_number_start < 2) or (sistem_number_start > 10000) ) or ( (sistem_number_end < 2) or (sistem_number_end > 10000) )) then
    begin
      writeln('����� �᫠ �� ᮢ������ � �������� ������ ��� �� ����� ������㯭�� ��⥬� ��᫥���');
      Readln();
      Halt(1);
    end;

  for x := 1 to Length(pro2) do
     if ( sistem_number_start <= ( ord(pro2[x]) - ord('0') )) or (0 > (ord(pro2[x]) - ord('0') )) then
       begin
         writeln('������ ��ଠ��� ���� ��� ��⥬ ��᫥���');
         Readln();
         Halt(1);
       end;


  sum := 0;
  count_step := Length(pro2) - 1;
  for x := 1 to Length(pro2) do
  begin                                                                ������� ����� ����� ������� � ����� �������� � ���������

    sum := sum + (ord(pro2[x]) - ord('0')) * Round(Power(sistem_number_start, count_step));{�८�ࠧ�� �᫮ �� ��砫쭮� ��⥬� ��᫥��� � 10}
    count_step := count_step - 1;
  end;

  if sum > 2147483647 then
    begin
      writeln('�ந��諮 ��९������� ����� � pascal');
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
