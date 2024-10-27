program IndirectSorting;

uses SysUtils;

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
  i, j, CombinedCount: Integer;
procedure LoadFile2(const FileName: string);
begin
  AssignFile(f, FileName);
  Reset(f);
  j := 0;
  while not Eof(f) do
  begin
    Inc(j);
    ReadLn(f, line);
    People2[j].LastName := Copy(line, 1, 14);
    People2[j].Country := Copy(line, 17, 14);
    People2[j].PlaceBirth := Copy(line, 32, 12);
  end;
  CloseFile(f);
  write('SD');
end;

procedure LoadFile1(const FileName: string);
begin
  AssignFile(f, FileName);
  Reset(f);
  i := 0;
  while not Eof(f) do
  begin
    Inc(i);
    ReadLn(f, line);
    People1[i].LastName := Copy(line, 1, 14);
    People1[i].Direction := Copy(line, 17, 8);
    People1[i].BirthYear := StrToInt(Trim(Copy(line, 26, 4)));
  end;
  CloseFile(f);
  Writeln('����㦥�� ', i, ' ����ᥩ �� File4.txt');
end;

// �������筮 ��� LoadFile2

procedure CombineTables();
begin
  CombinedCount := 0;

  for i := 1 to High(People1) do
  begin
    for j := 1 to High(People2) do
    begin
      Writeln('�஢�ઠ: ', Trim(People1[i].LastName), ' � ', Trim(People2[j].LastName));
      if Trim(People1[i].LastName) = Trim(People2[j].LastName) then
      begin
        Inc(CombinedCount);
        CombinedPeople[CombinedCount].LastName := People1[i].LastName;
        CombinedPeople[CombinedCount].Direction := People1[i].Direction;
        CombinedPeople[CombinedCount].BirthYear := People1[i].BirthYear;
        CombinedPeople[CombinedCount].Country := People2[j].Country;
        CombinedPeople[CombinedCount].PlaceBirth := People2[j].PlaceBirth;
      end;
    end;
  end;

  Writeln('������⢮ ��ꥤ������� ����ᥩ: ', CombinedCount);
end;

procedure PrintCombinedTable();
var
  x: Integer;
begin
  if CombinedCount = 0 then
  begin
    Writeln('��� ��ꥤ������� ����ᥩ.');
    Exit;
  end;

  for x := 1 to CombinedCount do
  begin
    Writeln('�������: ', CombinedPeople[x].LastName,
            ' ���ࠢ�����: ', CombinedPeople[x].Direction,
            ' ��� ஦�����: ', CombinedPeople[x].BirthYear,
            ' ��࠭�: ', CombinedPeople[x].Country,
            ' ���� ஦�����: ', CombinedPeople[x].PlaceBirth);
  end;
end;


begin
  LoadFile1('File4.txt');
  LoadFile2('File3.txt');

  CombineTables();

  PrintCombinedTable();

  Readln();
end.

