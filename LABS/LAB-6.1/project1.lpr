program IndirectSorting;
{$codepage utf8}


uses
  SysUtils;

type
  TPerson2_1 = record
    LastName: string[14];
    Direction: string[8];
    BirthYear: Integer;
  end;


  TPerson2_2 = record
    LastName: string[14];
    Country: string[14];
    PlaceBirth: string[12];
  end;

  TCombinedPerson = record
    LastName: string[14];
    Direction: string[8];
    BirthYear: Integer;
    Country: string[14];
    PlaceBirth: string[12];
  end;

var
  People1: array[1..17] of TPerson2_1;
  People2: array[1..17] of TPerson2_2;
  CombinedPeople: array[1..17] of TCombinedPerson;
  f: TextFile;
  line: string;
  CombinedCount: Integer;

procedure LoadFile2(const FileName: string);
var
  j: Integer;
begin
  AssignFile(f, FileName);
  Reset(f);
  j := 0;
  while (not Eof(f)) and (j < Length(People2)) do
  begin
    Inc(j);
    ReadLn(f, line);
    People2[j].LastName := Trim(Copy(line, 1, 14));
    People2[j].Country := Trim(Copy(line, 17, 14));
    People2[j].PlaceBirth := Trim(Copy(line, 32, 12));
  end;
  CloseFile(f);
end;

procedure LoadFile1(const FileName: string);
var
  i: Integer;
begin
  AssignFile(f, FileName);
  Reset(f);
  i := 0;
  while (not Eof(f)) and (i < Length(People1)) do
  begin
    Inc(i);
    ReadLn(f, line);
    People1[i].LastName := Trim(Copy(line, 1, 14));
    People1[i].Direction := Trim(Copy(line, 17, 8));
    try
      People1[i].BirthYear := StrToInt(Trim(Copy(line, 26, 4)));
    except
      on E: EConvertError do
      begin
        People1[i].BirthYear := 0;  // Задаем значение по умолчанию
      end;
    end;
  end;
  CloseFile(f);
end;

procedure CombineTables();
var
  i, j: Integer;
begin
  CombinedCount := 0;

  for i := 1 to High(People1) do
  begin
    for j := 1 to High(People2) do
    begin
      // Выводим текущие проверяемые фамили
      if Trim(People1[i].LastName) = Trim(People2[j].LastName) then
      begin
        Inc(CombinedCount);
        CombinedPeople[CombinedCount].LastName := People1[i].LastName;
        CombinedPeople[CombinedCount].Direction := People1[i].Direction;
        CombinedPeople[CombinedCount].BirthYear := People1[i].BirthYear;
        CombinedPeople[CombinedCount].Country := People2[j].Country;
        CombinedPeople[CombinedCount].PlaceBirth := People2[j].PlaceBirth;
        Break; // Завершаем поиск для текущей фамилии
      end;
    end;
  end;

end;


procedure PrintCombinedTable();
var
  x: Integer;
begin
  if CombinedCount = 0 then
  begin
    Writeln('Нет объединенных записей.');
    Exit;
  end;

  for x := 1 to CombinedCount do
  begin
    writeln(CombinedPeople[x].LastName);
    Writeln('LastName:', CombinedPeople[x].LastName,
            ' disrecrion: ', CombinedPeople[x].Direction,
            ' BirthYear: ', CombinedPeople[x].BirthYear,
            'Country: ', CombinedPeople[x].Country,
            'Town: ', CombinedPeople[x].PlaceBirth);
  end;
end;

begin
  LoadFile1('File4.txt');
  LoadFile2('File1.txt');

  CombineTables();

  PrintCombinedTable();

  Readln();
end.7
