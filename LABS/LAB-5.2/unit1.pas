unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

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
    procedure FormCreate(Sender: TObject);
    procedure FileOpenButtonClick(Sender: TObject);
    procedure FileSaveButtonClick(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

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

procedure TForm1.FileSaveButtonClick(Sender: TObject);
var
  outf: TextFile;
begin
  Form1.Memo1.Lines.Clear;
  Form1.Memo1.Lines.Add('Укажите файл для сохранения списка');
  if Form1.SaveDialog1.Execute then
  begin
    AssignFile(outf, Form1.SaveDialog1.FileName);
    Rewrite(outf);
    CloseFile(outf);
    Form1.Memo1.Lines.Clear;
    Form1.Memo1.Lines.add('Список записан в файл' +
      Form1.SaveDialog1.FileName);
  end;
end;




{$R *.lfm}

{ TForm1 }
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


procedure TForm1.Button4Click(Sender: TObject);
begin
    Halt(0);
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  FileSaveButtonClick(Sender);  // Сохранение файла по нажатию Button5
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  OpenDialog1.Filter := 'Text files (*.txt)|*.txt|All files (*.*)|*.*';
  if OpenDialog1.Execute then
  begin
    // Здесь можно работать с выбранным файлом
    ShowMessage('Выбран файл: ' + OpenDialog1.FileName);
  end
  else
  begin
    ShowMessage('Выбор файла отменен.');
  end;
end;



procedure AddNumberArray(var array_1 : array of integer; size:integer);
var i:integer;
begin
     Randomize;
     for i := 0 to size - 1 do
         array_1[i] := Random(1999) - 999;
end;


procedure TForm1.Button1Click(Sender: TObject);
var len_array_1,i:integer;
    array_1:array [1..40] of integer;
begin
    listBox1.Clear;
    len_array_1 := StrToInt(Edit1.Text);
    AddNumberArray(array_1,len_array_1);
    if len_array_1 <= 40 then
    begin
     for i := 0 to len_array_1 - 1 do
         listBox1.Items. Add(IntToStr(array_1[i]));
    end;
end;




procedure AddSortedElement(var array_2: array of integer; size, new_element: integer);
var
  i, j: integer;
begin
  // Ищем позицию для вставки нового элемента
  i := 0;
  while (i < size) and (array_2[i] < new_element) do
    Inc(i);

  // Сдвигаем элементы, чтобы освободить место для нового элемента
  for j := size - 1 downto i do
    array_2[j + 1] := array_2[j];

  // Вставляем новый элемент
  array_2[i] := new_element;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  len_array_2, i, new_element: integer;
  array_2: array of integer;
begin
  listBox2.Clear;
  len_array_2 := StrToInt(Edit1.Text);
  SetLength(array_2, len_array_2);

  for i := 0 to len_array_2 - 1 do
  begin
    new_element := Random(1999) - 999; // Генерируем случайное число
    AddSortedElement(array_2, i, new_element); // Вставляем в упорядоченном порядке
  end;

  // Выводим отсортированный список
  for i := 0 to len_array_2 - 1 do
    ListBox2.Items.Add(IntToStr(array_2[i]));

  SetLength(array_2, 0);
end;

procedure TForm1.Button3Click(Sender: TObject);
var len_array_3,i:integer;
    array_3:array of integer;
begin
    listBox3.Clear;
    len_array_3 := StrToInt(Edit1.Text);
    SetLength(array_3,len_array_3);
    AddNumberArray(array_3,len_array_3);
    mergesort(array_3);
    for i := 0 to len_array_3 - 1 do
      ListBox3.Items.Add(IntToStr(array_3[i]));
end;



end.

