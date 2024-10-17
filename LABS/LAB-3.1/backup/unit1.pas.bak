unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Menus,WinCrt;

type

  { TForm1 }

  TForm1 = class(TForm)
    Memo1: TMemo;
    PopupMenu1: TPopupMenu;
  private
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    SIGMA: TextFile;
    Flag:Boolean;
    X1, X2: Double;


    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);

  public
    constructor Create(TheOwner: TComponent); override;

  end;

var
  Form1: TForm1;
  StrFile:TextFile;

implementation

{$R *.lfm}
procedure transport(first_x,finali_x:real);
var SIGMA:TextFile;
    x_array:array [1..10000] of real;
    Flag:Boolean;
    count,l,i,k,iteration:integer;
    formula,value_x:double;
    steps_grade:real;

begin
  AssignFile(SIGMA, 'SIGMA123.txt');
  Rewrite(SIGMA);
  writeln(SIGMA,'         x              eps            f(x)        iteration');

  x_array[1] := first_x;
  x_array[10] := finali_x;
  for l := 1 to 10 do
  begin
    if (l >= 2) and (l < 10) then
      x_array[l] := x_array[l - 1] + (finali_x - first_x) / 9;
    Flag := True;
    for i := 1 to 6 do
    begin
      steps_grade := 1;
      count :=  0;
      for k := 1 to i do
      begin
        steps_grade := steps_grade * 0.1;
        inc(count);
      end;
      value_x := x_array[l];
      formula := x_array[l];
      iteration := 2;
      while abs(formula) >= steps_grade do
      begin
        formula := formula * ((iteration + 1) * x_array[l]) / iteration;
        value_x := (value_x + formula);
        iteration := iteration + 1;
      end;
      if Flag then
          begin
            writeln(SIGMA, l , '       ', x_array[l]:10:5, '     10 ** -',count, '     ', value_x:10:5, '     ', iteration);
            Flag := False;
          end
      else
          writeln(SIGMA,'       ', x_array[l]:10:5, '     10 ** -',count, '     ', value_x:9:6, '     ', iteration);
    end;
  end;
  CloseFile(SIGMA);
end;

procedure TForm1.Button3Click(Sender: TObject); // вычисления
begin
  try
    // Преобразуем текст из Edit1 и Edit2 в вещественные числа напрямую
    X1 := StrToFloat(Edit1.Text);  // Если введено отрицательное число, оно автоматически сохранится
    X2 := StrToFloat(Edit2.Text);

    // на то,чтобы x были корректныыми
    if ((X1 > 0.25) or (X1 < -0.7) or (X2 > 0.25) or (X2 < -0.7) or (X1 > X2)) then
       begin
      ShowMessage('СДЕЛАЙ НОРМАЛЬНЫЕ X PLS');
      Halt(1);
        end;

    // Вывод результата
    ShowMessage('Вычисления проведены успешно');
    Label4 := TLabel.Create(Self);
    Label4.Parent := Self;
    Label4.Caption := 'Результаты вычисления занесены в файл SIGMA123.TXT';
    Label4.Left := Label1.Left + 85;
    Label4.Top := 450;
    Label4.Font.Size := 16;    //меняю шрифт
    transport(X1,X2);
  except
    on E: EConvertError do
      ShowMessage('Ошибка преобразования. Проверьте введенные данные.');


  end;
end;






constructor TForm1.Create(TheOwner: TComponent);
begin
  inherited Create(TheOwner);

  // создаю текст
  Label1 := TLabel.Create(Self);
  Label1.Parent := Self;
  Label1.Caption := 'Введите начальное значение для X ';
  Label1.Left := 50;
  Label1.Top := 200;

  Label2 := TLabel.Create(Self);
  Label2.Parent := Self;
  Label2.Caption := 'Введите конечное значение для X';
  Label2.Left := Label1.Left + 600;
  Label2.Top := 200;

  Label3 := TLabel.Create(Self);
  Label3.Parent := Self;
  Label3.Caption := 'Введите x в диапазоне от -0.7 <= x <= 0.25';
  Label3.Left := 450;
  Label3.Top := 50;
  Label3.Width := 500;       // ширина текста
  Label3.Font.Size := 13;


  // создаю места где вводить текст
  Edit1 := TEdit.Create(Self);
  Edit1.Parent := Self;
  Edit1.Left := Label1.Left + Label1.Width + 135;
  Edit1.Top := Label1.Top;
  Edit1.Width := 175;

  Edit2 := TEdit.Create(Self);
  Edit2.Parent := Self;
  Edit2.Left := Label2.Left + Label2.Width + 135;
  Edit2.Top := Label1.Top;
  Edit2.Width := 175;

  // крейчу кнопки
  Button1 := TButton.Create(Self);
  Button1.Parent := Self;
  Button1.Caption := 'Ввести';
  Button1.Left := Edit1.Left + Edit1.Width + 10;
  Button1.Top := Label1.Top;

  Button2 := TButton.Create(Self);
  Button2.Parent := Self;
  Button2.Caption := 'Ввести';
  Button2.Left := Edit2.Left + Edit2.Width + 10;
  Button2.Top := Label2.Top;

  Button3 := TButton.Create(Self);
  Button3.Parent := Self;
  Button3.Caption := 'Вычислить';
  Button3.Left := 900;
  Button3.Top := 400;
  Button3.AutoSize := False;
  Button3.Width := 200;
  Button3.Font.Size := 11;
  Button3.OnClick := @Button3Click;  // Привязываем обработчик нажатия

  Button4 := TButton.Create(Self);
  Button4.Parent := Self;
  Button4.Caption := 'Выход';
  Button4.Left := 900;
  Button4.Top := 500;
  Button4.AutoSize := False;
  Button4.Width := 200;
  Button4.Font.Size := 11;
  Button4.OnClick := @Button4Click;  // Привязываем обработчик нажатия

  // Размер для window
  Self.Width := 1200;
  Self.Height := 700;
end;

// exit
procedure TForm1.Button4Click(Sender: TObject);
begin
  Close;  //END PROGRAMM
end;

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;

end.
