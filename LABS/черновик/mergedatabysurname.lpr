program MergeDataBySurnameUsingArrays;

uses
  SysUtils;

const
  NumEntries = 14;

type
  TEntry = record
    Surname: string;
    Data: string;
  end;

var
  Entries1, Entries2: array[1..NumEntries] of TEntry;
  OutputFile: TextFile;
  i: Integer;

function ParseLine(Line: string; var Entry: TEntry): Boolean;
var
  PosSpace: Integer;
begin
  // Находим первую группу пробелов, чтобы разделить фамилию и данные
  PosSpace := Pos(' ', Trim(Line));
  if PosSpace > 0 then
  begin
    Entry.Surname := Copy(Line, 1, PosSpace - 1);
    Entry.Data := Trim(Copy(Line, PosSpace + 1, Length(Line) - PosSpace));
    Result := True;
  end
  else
    Result := False;
end;

procedure LoadDataFromFile(const FileName: string; var Entries: array of TEntry);
var
  InputFile: TextFile;
  Line: string;
  i: Integer;
begin
  AssignFile(InputFile, FileName);
  Reset(InputFile);

  i := 1;
  while (not Eof(InputFile)) and (i <= NumEntries) do
  begin
    ReadLn(InputFile, Line);
    if not ParseLine(Line, Entries[i]) then
      WriteLn('Ошибка при обработке строки ', i, ' в файле ', FileName);
    Inc(i);
  end;

  CloseFile(InputFile);
end;

begin
  try
    // Загружаем данные из файлов в массивы
    LoadDataFromFile('File1.txt', Entries1);
    LoadDataFromFile('File4.txt', Entries2);

    // Открываем файл для записи результата
    AssignFile(OutputFile, 'output.txt');
    Rewrite(OutputFile);

    // Сопоставляем фамилии из обоих массивов и записываем результат
    for i := 1 to NumEntries do
    begin
      if Entries1[i].Surname = Entries2[i].Surname then
        WriteLn(OutputFile, Entries1[i].Surname, ' ', Entries1[i].Data, ' ', Entries2[i].Data)
      else
        WriteLn('Ошибка: не совпадают фамилии на строке ', i);
    end;

    // Закрываем выходной файл
    CloseFile(OutputFile);

    WriteLn('Файлы успешно объединены в output.txt');
  except
    on E: Exception do
      WriteLn('Произошла ошибка: ', E.Message);
  end;
  Readln();
end.



