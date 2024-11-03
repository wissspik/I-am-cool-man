
program IndirectSorting; {$codepage utf8}
uses Classes, SysUtils;
type
  TPerson2_1 = record
    LastName: string[14];
    Direction: string[8];
    BirthYear: Integer;
  end;
  TPerson2_2 = record
    LastName: string[14];
    Country: string[14];
    PlaceBirth: string[15];  // Увеличили длину строки
  end;
  TPerson1_1 = record
    LastName: string[14];
    Direction: string[8];
    BirthYear: Integer;
  end;
  TPerson1_2 = record
    LastName: string[14];
    Country: string[14];
    PlaceBirth: string[15];  // Увеличили длину строки
  end;
  TCombinedPerson = record
    LastName: string[14];
    Direction: string[8];
    BirthYear: Integer;
    Country: string[14];
    PlaceBirth: string[15];  // Увеличили длину строки
  end;
  TCityRecord = record
    PlaceBirth: string;
    BirthYear: Integer;
  end;
var
  People2_1: array[1..17] of TPerson2_1;
  People2_2: array[1..17] of TPerson2_2;
  People1_1: array[1..24] of TPerson1_1;
  People1_2: array[1..24] of TPerson1_2;
  CityCounts: array of TCityRecord;
  array_1: array of string;
  array_2: array of string;
  CombinedPeople: array[1..99] of TCombinedPerson; // Увеличиваем размер массива  f: TextFile;
  line,city: string;
  i, j,t,CombinedCount,x,W: Integer;
  F,JOY,MatchFile:TextFile;
  index: Integer;
procedure LoadFile2_1(const FileName: string);
var  i,x: Integer;
     f: TextFile;

begin
  AssignFile(f, FileName);
  Reset(f);
  i := 0;
  while (not Eof(f)) and (i < Length(People2_1)) do
  begin
    Inc(i);
    ReadLn(f, line);
    People2_1[i].LastName := Trim(Copy(line, 1, 14));
    People2_1[i].Direction := Trim(Copy(line, 17, 8));
    People2_1[i].BirthYear := StrToInt(Trim(Copy(line, 26, 5)));
  end;
  CloseFile(f);
end;

procedure LoadFile2_2(const FileName: string);
var
  j: Integer;
  f : TextFile;
begin
  AssignFile(f, FileName);
  Reset(f);
  j := 0;
  while (not Eof(f)) and (j < Length(People2_2)) do
  begin
    Inc(j);
    ReadLn(f, line);
    People2_2[j].LastName := Trim(Copy(line, 1, 14));
    People2_2[j].Country := Trim(Copy(line, 17, 14));
    People2_2[j].PlaceBirth := Trim(Copy(line, 32, 15));  // Изменили длину для копирования
  end;
  CloseFile(f);
end;

procedure LoadFile1_1(const FileName: string);
var  i: Integer;
     f : TextFile;
begin  AssignFile(f, FileName);
  Reset(f);  i := 0;
  while (not Eof(f)) and (i < Length(People1_1)) do  begin
    Inc(i);
    ReadLn(f, line);
    People1_1[i].LastName := Trim(Copy(line, 1, 14));
    People1_1[i].Direction := Trim(Copy(line, 17, 8));
    try
      People1_1[i].BirthYear := StrToInt(Trim(Copy(line, 26, 5)));
    except
      on E: EConvertError do
      begin
        People1_1[i].BirthYear := 0; // Задаем значение по умолчанию      end;
    end;
  end;
  end;
  CloseFile(f);
end;

procedure LoadFile1_2(const FileName: string);
var  j: Integer;
     f : TextFile;
begin
AssignFile(f, FileName);
  Reset(f);
  j := 0;
  while (not Eof(f)) and (j < Length(People1_2)) do  begin
    Inc(j);
    ReadLn(f, line);
    People1_2[j].LastName := Trim(Copy(line, 1, 14));
    People1_2[j].Country := Trim(Copy(line, 17, 9));
    People1_2[j].PlaceBirth := Trim(Copy(line, 28, 23));
  end;
  CloseFile(f);
end;

procedure CombineTables();
var
  i, j: Integer;
  matched: Boolean;
  f : TextFile;
begin
  CombinedCount := 0;
  AssignFile(f,'STOP.txt');
  ReWrite(f);

  // Объединение из первых двух таблиц (TPerson2)
  for i := 1 to High(People2_1) do
  begin
    matched := False;
    for j := 1 to High(People2_2) do
    begin
      if Trim(People2_1[i].LastName) = Trim(People2_2[j].LastName) then
      begin
        Inc(CombinedCount);
        CombinedPeople[CombinedCount].LastName := People2_1[i].LastName;
        CombinedPeople[CombinedCount].Direction := People2_1[i].Direction;
        CombinedPeople[CombinedCount].BirthYear := People2_1[i].BirthYear;
        CombinedPeople[CombinedCount].Country := People2_2[j].Country;
        CombinedPeople[CombinedCount].PlaceBirth := People2_2[j].PlaceBirth;
        matched := True; // Отметка, что совпадение найдено
        Break; // Завершаем поиск для текущей фамилии
      end;
    end;
    if not matched then
      WriteLn('Warning: No match found for ', People2_1[i].LastName);
  end;

  // Объединение из вторых двух таблиц (TPerson1)
  for i := 1 to High(People1_1) do
  begin
    matched := False;
    for j := 1 to High(People1_2) do
    begin
      if Trim(People1_1[i].LastName) = Trim(People1_2[j].LastName) then
      begin
        Inc(CombinedCount);
        CombinedPeople[CombinedCount].LastName := People1_1[i].LastName;
        CombinedPeople[CombinedCount].Direction := People1_1[i].Direction;
        CombinedPeople[CombinedCount].BirthYear := People1_1[i].BirthYear;
        CombinedPeople[CombinedCount].Country := People1_2[j].Country;
        CombinedPeople[CombinedCount].PlaceBirth := People1_2[j].PlaceBirth;
        matched := True;
        Break;
      end;
    end;
    if not matched then
      WriteLn('Warning: No match found for ', People1_1[i].LastName);
  end;
end;


procedure SaveCombinedToFile(const FileName: string);
var  i: Integer;
     f : TextFile;
  begin
  AssignFile(f, FileName);
  Rewrite(f);
  for i := 1 to CombinedCount do
  begin    WriteLn(f,
      Format('%-14s %-8s %d %-14s %-12s',     [CombinedPeople[i].LastName,
       CombinedPeople[i].Direction,       CombinedPeople[i].BirthYear,
       CombinedPeople[i].Country,          CombinedPeople[i].PlaceBirth]));
  end;
  CloseFile(f);
end;




begin
  AssignFile(MatchFile, 'Matches.txt');
  Rewrite(MatchFile);
  SetLength(array_1, 0);
  SetLength(array_2, 0);// Инициализация
  AssignFile(F,'RUSLANTIGER.txt');
  AssignFile(JOY,'ARTURTIGER.txt');
  ReWrite(F);
  ReWrite(JOY);
  LoadFile2_1('File4.txt');
  LoadFile2_2('File1.txt');
  LoadFile1_1('File3.txt');
  LoadFile1_2('File2.txt');
  CombineTables();
  SaveCombinedToFile('CombinedOutput.txt');
  t := 0;
// Косвенная сортировка по году рождения
for i := 0 to Length(CombinedPeople) - 2 do
  for x := 0 to Length(CombinedPeople) - 2 - i do // Избегаем выхода за границы массива
    if CombinedPeople[x].BirthYear > CombinedPeople[x + 1].BirthYear then
    begin
      // Обмен значениями для сортировки
      W := CombinedPeople[x].BirthYear;
      CombinedPeople[x].BirthYear := CombinedPeople[x + 1].BirthYear;
      CombinedPeople[x + 1].BirthYear := W;
    end;
for i:= 0 to length(CombinedPeople) do
      writeln(F,     CombinedPeople[i].LastName,'   ',
       CombinedPeople[i].Direction,'   ',       CombinedPeople[i].BirthYear,'    ',
       CombinedPeople[i].Country,'    ',          CombinedPeople[i].PlaceBirth);
// Заполнение массива array_1 городами из направления '02.03.02'
for x := 0 to Length(CombinedPeople) - 1 do
begin
  if (CombinedPeople[x].Country = 'Россия') and (CombinedPeople[x].Direction = '02.03.02') then
  begin
    SetLength(array_1, Length(array_1) + 1);
    array_1[Length(array_1) - 1] := CombinedPeople[x].PlaceBirth;
  end;
end;
for i := 0 to length(array_1) - 1 do
   writeln(F,array_1[i]);// Поиск городов из направления '09.03.03', которые есть и в array_1


for x := 0 to Length(CombinedPeople) - 1 do
begin
  if (CombinedPeople[x].Country = 'Россия') and (CombinedPeople[x].Direction = '09.03.03') then
  begin
    writeln(JOY,CombinedPeople[x].PlaceBirth);
    SetLength(array_2, Length(array_2) + 1);
    array_2[Length(array_2) - 1] := CombinedPeople[x].PlaceBirth;
  end;
end;
for i := 0 to Length(array_1) - 1 do
    for j := 0 to Length(array_2) - 1 do
      if array_1[i] = array_2[j] then
      begin
        writeln(MatchFile, array_1[i]); // Запись совпадения в файл
        Break; // Если совпадение найдено, выходим из внутреннего цикла
      end;

  CloseFile(F);
  CloseFile(JOY);
  writeln(t);
  Readln();
  CloseFile(MatchFile);
end.

