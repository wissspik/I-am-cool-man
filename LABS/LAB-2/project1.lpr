program project1;
uses SysUtils,Windows;

var
  ARR_1_START,ARR_1_END, ARR_2_START,ARR_2_END, ARR_3_START,ARR_3_END, left, right, result: array of integer;
  x,n,i,j, len_ARR_1, len_ARR_2, len_ARR_3, t, CRAMP_2,CRAMP, count, mid,G,key : integer;
  SIGMA:TextFile;
  Frequency, StartCount, EndCount,time_1: Int64;



function Test(var Mass,MassSort : array of integer; n:integer) : Boolean; {I checking in out list of number}
  var MassCount,MassSortCount : array [-999..999] of Longint;
    i : Longint;
  begin
    i := 0;
    while (i < n -1) and (MassSort[i] <= MassSort[i +1]) do
      i := i + 1;
    if i < n - 1 then
      Test := False
    else
      begin
        for i := -999 to 999 do
         begin
          Masscount[i] := 0;
          MassSortCount[i] := 0;
         end;
        for i := 0 to n - 1 do
         begin
          MassCount[Mass[i]] := MassCount[Mass[i]] + 1;
          MassSortCount[MassSort[i]] := MassSortCount[MassSort[i]] + 1
         end;
        i := -999;
        while (i <= 999) and (MassCount[i] = MassSortCount[i]) do
          i := i + 1;
        if i = 1000 then
          Test := True
        else
          Test := False
      end;
    Readln();
   end;

procedure merge(const left, right: array of integer; var result: array of integer);
var
  i, j, k: integer;
begin
  i := 0;
  j := 0;
  k := 0;

  while (i < Length(left)) and (j < Length(right)) do
  begin
    if left[i] <= right[j] then
    begin
      result[k] := left[i];
      Inc(i);
    end
    else
    begin
      result[k] := right[j];
      Inc(j);
    end;
    Inc(k);
  end;

  while i < Length(left) do
  begin
    result[k] := left[i];
    Inc(i);
    Inc(k);
  end;

  while j < Length(right) do
  begin
    result[k] := right[j];
    Inc(j);
    Inc(k);
  end;
end;

procedure mergesort(var ARR: array of integer);
var
  mid: integer;
  left, right: array of integer;
begin
  if Length(ARR) < 2 then Exit;

  mid := Length(ARR) div 2;
  SetLength(left, mid);
  SetLength(right, Length(ARR) - mid);

  Move(ARR[0], left[0], mid * SizeOf(integer));
  Move(ARR[mid], right[0], (Length(ARR) - mid) * SizeOf(integer));

  mergesort(left);
  mergesort(right);

  merge(left, right, ARR);
end;



procedure ARR_1_1(len_ARR_1: integer); //1 сортировка - простая сортировка обменом
begin
  Randomize;
  // Заполнение массива случайными числами
  for i := 0 to len_ARR_1 - 1 do
  begin
    ARR_1_START[i] := Random(1000);
    write(ARR_1_START[i], '  ');  // Выводим элементы для проверки
  end;

  writeln();

  // Сортировка обменом
  i := 0;
  while i < Length(ARR_1_START) - 1 do
  begin
    if ARR_1_START[i] > ARR_1_START[i + 1]  then
    begin
      // Меняем местами элементы
      CRAMP := ARR_1_START[i + 1];
      ARR_1_START[i + 1] := ARR_1_START[i];
      ARR_1_START[i] := CRAMP;
      i := 0;
    end
    else
    begin
      i := i + 1;
    end;
  end;
  for i := 0 to len_ARR_1 - 1 do
  begin
    ARR_1_END[i] := ARR_1_START[i];  // Копируем отсортированные данные в ARR_1_END
    write(ARR_1_END[i], '  ');  // Выводим отсортированный массив
  end;

  writeln();


  if Test(ARR_1_START, ARR_1_END, len_ARR_1) then
    write('array correction')
  else
    write('array not correction');

  writeln();
end;




procedure ARR_2_2(len_ARR_2: integer);
begin
  for i := 0 to len_ARR_2 - 1  do {ўў®¦г гз ©­лҐ зЁб« }
  begin
    ARR_2_START[i] := Random(100);
    write(ARR_2_START[i], ' ');
  end;

  writeln();
   for i := 0 to Length(ARR_2_START) - 1 do
  begin
    G:= ARR_2_START[i];  { текущий элемент (i+1) }
    j := i - 1;

    { Поиск позиции j для вставки элемента temp }
    while (j >= 0) and (ARR_2_START[j] > G) do
    begin
      ARR_2_START[j + 1] := ARR_2_START[j];  { Сдвигаем элементы вправо }
      j := j - 1;
    end;

    ARR_2_START[j + 1] := G;  { Вставляем temp на позицию j+1 }
  end;


  for i := 0 to len_ARR_2 - 1  do
    begin
      ARR_2_END[i] := ARR_2_START[i];
      write(ARR_2_END[i], ' ');    {delete}
    end;
  if (Test(ARR_2_START,ARR_2_END,len_ARR_2)) then {ўлў®¦г вҐбв ­  Їа ўЁ«м­®бвм ¬ ббЁў  ­®¬Ґа 2}    {delete}
    write('array correction')
  else
    write('array not correction');
  writeln();
end;
procedure ARR_3_3(var len_ARR_3: integer); {}
begin
  writeln();
  for i := 0 to len_ARR_3 - 1 do  {ERROOR}
  begin
    ARR_3_START[i] := Random(100);
    write(ARR_3_START[i], ' ');
  end;
  writeln();

  mergesort(ARR_3_START);

  for i := 0 to Length(ARR_3_START) - 1 do
  begin
    write(ARR_3_START[i], ' ');                      {detele}
    ARR_3_END[i] := ARR_3_START[i];
  end;

  if (Test(ARR_3_START, ARR_3_END, len_ARR_3)) then     {delete}
    write('array correction')
  else
    write('array not correction')
end;


begin
  n := 10;
  writeln('Enter the number of numbers for the array 1 '); {ўў®¦г ¤«Ё­г ¤«п ¬ ббЁў  1-®© Їа®жҐ¤гал}
  readln(len_ARR_1);
  SetLength(ARR_1_START, len_ARR_1);
  SetLength(ARR_1_END, len_ARR_1);
  ARR_1_1(len_ARR_1);
  writeln('Enter the number of numbers for the array 2 '); {ўў®¦г ¤«Ё­г ¤«п ¬ ббЁў  1-®© Їа®жҐ¤гал}
  readln(len_ARR_2);
  SetLength(ARR_2_START, len_ARR_2);
  SetLength(ARR_2_END, len_ARR_2);
  ARR_2_2(len_ARR_2);
  writeln('Enter the number of numbers for the array 3 '); {¤Ґ« о ¬ ббЁў ¤«п 3 б«Ёп­Ёп}
  readln(len_ARR_3);
  SetLength(ARR_3_START, len_ARR_3);
  SetLength(ARR_3_END, len_ARR_3);
  ARR_3_3(len_ARR_3);
  writeln();
  Readln();


  AssignFile(SIGMA, 'SIGMA.txt');
  Rewrite(SIGMA);
  Writeln(SIGMA, 'SORTIROVKA         n(10)          n(100)            n(1000)            n(10_000)            n(100_000)        n(1_000_000)');
  write(SIGMA,'SORTITOFKA 1');
  for x := 1 to 3 do      {1 процедура}
  begin
      SetLength(ARR_1_START, n);
      QueryPerformanceFrequency(Frequency);
      QueryPerformanceCounter(StartCount);

      for i := 0 to length(ARR_1_START) - 1 do
         ARR_1_START[i] := Random(100);
      write('FFF  ');
      i := 0;
      while i < Length(ARR_1_START) - 1 do
      begin
        if (ARR_1_START[i] > ARR_1_START[i + 1]) then
        begin

          CRAMP := ARR_1_START[i + 1];
          ARR_1_START[i + 1] := ARR_1_START[i];
          ARR_1_START[i] := CRAMP;
          i := 0;
        end
        else
        begin
          i := i + 1;
        end;
      end;


      QueryPerformanceCounter(EndCount);
      time_1 := (EndCount - StartCount) * 1000000 div Frequency;
      write(SIGMA, '         ', time_1, '       ');
      n := n * 10;
  end;
  n := 10;
  Writeln(SIGMA,' ');
  Write(SIGMA,'sortirofka 2');
  for G := 1 to 4 do        {2 процедура}
  begin
    SetLength(ARR_2_START, n);
    QueryPerformanceFrequency(Frequency);
    QueryPerformanceCounter(StartCount);

    for i := 0 to n - 1 do
      ARR_2_START[i] := Random(100);
    writeln();
    write('FFF  ');

    for i := 0 to Length(ARR_2_START) - 1 do
    begin
      key := ARR_2_START[i];  { текущий элемент (i+1) }
      j := i - 1;
      { Поиск позиции j для вставки элемента temp }
      while (j >= 0) and (ARR_2_START[j] > key) do
      begin
        ARR_2_START[j + 1] := ARR_2_START[j];  { Сдвигаем элементы вправо }
        j := j - 1;
      end;

      ARR_2_START[j + 1] := key;  { Вставляем temp на позицию j+1 }
    end;
    QueryPerformanceCounter(EndCount);
    time_1 := (EndCount - StartCount) * 1000000 div Frequency;
    write(SIGMA, '          ', time_1, '       ');
    n := n * 10;
  end;
  n := 10;
  writeln('fADFDF');
  Writeln(SIGMA,' ');
  Write(SIGMA,'sortirofka 3');
  for x := 1 to 6 do
  begin
    SetLength(ARR_3_START, n);
    QueryPerformanceFrequency(Frequency);
    QueryPerformanceCounter(StartCount);

    for i := 0 to n - 1 do
      ARR_3_START[i] := Random(100);

    mergesort(ARR_3_START);
    QueryPerformanceCounter(EndCount);
    time_1 := (EndCount - StartCount) * 1000000 div Frequency;
    write(SIGMA, '          ', time_1, '       ');
    n := n * 10;
  end;


  CloseFile(SIGMA)
end.
