unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    START: TButton;
    EX_IT: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure STARTClick(Sender: TObject);
    procedure EX_ITClick(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}



{ TForm1 }

procedure TForm1.STARTClick(Sender: TObject);
var
  values_x, Formula_result, first_x, final_x, step_number: double;
  iteration, i, j, m, x: integer;
  steps_EPS1: array[1..6] of real;
  X_number: array[1..10] of real;
  SIGMA: TextFile;
begin
  // Пробуем преобразовать текст в числа
  try
    first_x := StrToFloat(Edit1.Text);
    final_x := StrToFloat(Edit2.Text);
    if (-7>first_x) or (first_x > 5) or (-7>first_x) or (final_x > 5) then
      begin
       ShowMessage('Введите корректные значения для X');
       Halt(1);
      end;

    AssignFile(SIGMA, 'SIGMA777.txt');
    Rewrite(SIGMA);

    steps_EPS1[1] := 0.1;
    for x := 2 to 6 do
      steps_EPS1[x] := steps_EPS1[x-1] * 0.1;

    step_number := (final_x - first_x) / 9;
    for i := 0 to 9 do
    begin
      X_number[i+1] := first_x + step_number * i;
    end;

    for j := 1 to 10 do
    begin
      for i := 1 to 6 do
      begin
        iteration := 1;
        values_x := 1;
        Formula_result := 1;
        while abs(Formula_result) >= steps_EPS1[i] do
        begin
          Formula_result := Formula_result * (X_number[j] / iteration);
          values_x := values_x + Formula_result;
          iteration := iteration + 1;
        end;
        Write(SIGMA, X_number[j]:10:4, ' ');
        Write(SIGMA, steps_EPS1[i]:10:6, ' ');
        Write(SIGMA, values_x:10:6, '      ');
        Writeln(SIGMA, iteration, ' ');
      end;
      Writeln(SIGMA, ' ');
    end;

   CloseFile(SIGMA); // Close the file
   ShowMessage('Все ок');
  except
    // Если введены не числа, выводим ошибку
    ShowMessage('Ошибка! Введите числа в оба поля.');
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin

end;



procedure TForm1.EX_ITClick(Sender: TObject);
begin
  Halt(1);
end;

end.

