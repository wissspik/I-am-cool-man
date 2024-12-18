unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type
  // Указатели на узлы для трех разных списков
  PNode = ^TNode;  // Указатель на узел

  TNode = record
    Data: integer;  // Случайное число
    Next: PNode;    // Указатель на следующий узел
  end;




  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    ListBox1: TListBox;
    ListBox2: TListBox;
    ListBox3: TListBox;
    Memo1: TMemo;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure FileSaveButtonClick(head1: PNode; Sender: TObject);
    procedure FileOpenButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    head1: PNode;
    Result: PNode;

  public

  end;

var
  Form1: TForm1;

implementation

// открытие файла посмотреть
{$R *.lfm}

{ TForm1 }
procedure TForm1.FormCreate(Sender: TObject);
begin
  OpenDialog1.Filter := 'Text files (*.txt)|*.txt|All files (*.*)|*.*';
end;

procedure TForm1.FileOpenButtonClick(Sender: TObject);
var
  inf: TextFile;
  line: string;
begin
  Memo1.Lines.Clear; // Очищаем Memo перед загрузкой данных
  if OpenDialog1.Execute then  // Открывает диалоговое окно выбора файла
  begin
    if FileExists(OpenDialog1.FileName) then
    begin
      ShowMessage('Файл найден, открываем: ' + OpenDialog1.FileName);
      AssignFile(inf, OpenDialog1.FileName);
      Reset(inf);
      try
        while not Eof(inf) do // Читаем файл до конца
        begin
          ReadLn(inf, line); // Читаем строку из файла
          Memo1.Lines.Add(line); // Добавляем считанную строку в Memo
        end;
      finally
        CloseFile(inf);
      end;
    end
    else
      ShowMessage('Файл не найден');
  end
  else
    ShowMessage('Окно выбора файла не было открыто');
end;





procedure FreeList(var head1: PNode);
var
  current, temp: PNode;
begin
  current := head1;
  while current <> nil do
  begin
    temp := current^.Next;
    Dispose(current);
    current := temp;
  end;
  head1 := nil;
end;




procedure TForm1.FileSaveButtonClick(head1: PNode; Sender: TObject);
var
  outf: TextFile;
  current: PNode;
begin
  Form1.Memo1.Lines.Clear;
  Form1.Memo1.Lines.Add('Укажите файл для сохранения списка');
  if Form1.SaveDialog1.Execute then
  begin
    AssignFile(outf, Form1.SaveDialog1.FileName);
    Rewrite(outf);
    current := head1;
    while current <> nil do
    begin
      Writeln(outf, current^.Data);
      current := current^.Next;
    end;
    CloseFile(outf);
    Form1.Memo1.Lines.Clear;
    Form1.Memo1.Lines.add('Список записан в файл' +
      Form1.SaveDialog1.FileName);
  end;
  FreeList(head1);
end;

procedure AddFile(head1: PNode);
var
  Txt: TextFile;
  current: PNode;
begin
  AssignFile(Txt, 'HelloWorld.txt');
  Rewrite(Txt);
  current := head1;
  while current <> nil do
  begin
    Write(Txt, current^.Data, ' ');
    current := current^.Next;
  end;
  CloseFile(Txt);
end;


procedure SplitList(head: PNode; var front, back: PNode);
var
  slow, fast: PNode;
begin
  if (head = nil) or (head^.Next = nil) then
  begin
    front := head;
    back := nil;
  end
  else
  begin
    slow := head;
    fast := head^.Next;
    // Быстрое и медленное продвижение для нахождения середины списка
    while fast <> nil do
    begin
      fast := fast^.Next;
      if fast <> nil then
      begin
        slow := slow^.Next;
        fast := fast^.Next;
      end;
    end;
    front := head;
    back := slow^.Next;
    slow^.Next := nil; // разделяем список
  end;
end;

function MergeSortedLists(a, b: PNode): PNode;
var
  res: PNode;  // Измените переменную result на res
begin
  if a = nil then Exit(b);
  if b = nil then Exit(a);

  if a^.Data <= b^.Data then
  begin
    res := a;
    res^.Next := MergeSortedLists(a^.Next, b);
  end
  else
  begin
    res := b;
    res^.Next := MergeSortedLists(a, b^.Next);
  end;
  MergeSortedLists := res;  // Изменено на res
end;


procedure MergeSort(var head: PNode);
var
  front, back: PNode;
begin
  if (head = nil) or (head^.Next = nil) then Exit; // База рекурсии

  // Разделяем список на две половины
  SplitList(head, front, back);

  // Рекурсивно сортируем обе половины
  MergeSort(front);
  MergeSort(back);

  // Сливаем отсортированные половины
  head := MergeSortedLists(front, back);
end;


procedure SortedArray(var head1: PNode; Value: integer);
var
  newNode, current, prev: PNode;
begin
  New(newNode);
  newNode^.Data := Value;
  newNode^.Next := nil;

  if (head1 = nil) or (Value < head1^.Data) then
  begin
    newNode^.Next := head1;
    head1 := newNode;
  end
  else
  begin
    prev := nil;
    current := head1;

    while (current <> nil) and (current^.Data < Value) do
    begin
      prev := current;
      current := current^.Next;
    end;

    if prev <> nil then
      prev^.Next := newNode;

    newNode^.Next := current;
  end;
end;



procedure Append(var head1: PNode; Value: integer);
var
  newNode, current: PNode;
begin
  New(newNode); // создаем новый узел
  newNode^.Data := Value;
  newNode^.Next := nil;

  if head1 = nil then
    head1 := newNode
  else
  begin
    current := head1;
    while current^.Next <> nil do
      current := current^.Next;
    current^.Next := newNode;
  end;
end;

procedure PrintList(head1: PNode; ListBox: TListBox);
var
  current: PNode;
begin
  ListBox.Items.Clear;  // Очищаем список перед выводом
  current := head1;
  while current <> nil do
  begin
    ListBox.Items.Add(IntToStr(current^.Data));
    // Преобразуем число в строку
    current := current^.Next;  // Переходим к следующему узлу
  end;
end;


procedure TForm1.Button3Click(Sender: TObject);
var
  len_array, x, number, i: integer;
  current: PNode;
begin
  Randomize;
  i := 1;
  FreeList(head1);
  // Освобождаем память перед заполнением нового списка
  len_array := StrToInt(Edit1.Text);
  for x := 1 to len_array do
  begin
    number := Random(1999) - 999;  // Генерация случайного числа
    Append(head1, number);  // Добавляем число в список
  end;
  current := head1;
  while current <> nil do
  begin
    i := i + 1;
    current := current^.Next;
  end;
  if i <= 40 then
    PrintList(head1, ListBox1);
  // Выводим список после завершения его заполнения
  AddFile(head1);
  FreeList(head1);
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  len_array, x, number: integer;
begin
  len_array := StrToInt(Edit1.Text);
  for x := 1 to len_array do
  begin
    number := Random(1999) - 1000;
    SortedArray(head1, number);
  end;
  PrintList(head1, ListBox2);
  // Выводим отсортированный список
  FreeList(head1);
end;


procedure TForm1.Button4Click(Sender: TObject);
var
  len_array, x, number: integer;
begin
  len_array := StrToInt(Edit1.Text);
  FreeList(head1);
  // Освобождаем память для третьего списка перед заполнением нового
  for x := 1 to len_array do
  begin
    number := Random(1999) - 1000;
    Append(head1, number);  // Добавляем числа в список
  end;
  MergeSort(head1);  // Сортируем список слиянием
  PrintList(head1, ListBox3);
  // Выводим отсортированный список в ListBox3
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  FileSaveButtonClick(head1, Sender);
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  FileOpenButtonClick(Sender);
end;


procedure TForm1.Button2Click(Sender: TObject);
begin
  Halt(0);  // Корректное завершение программы
end;


end.

