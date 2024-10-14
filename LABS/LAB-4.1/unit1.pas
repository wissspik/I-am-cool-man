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
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

procedure Draw;
begin
  with Form1.Canvas do
  begin
    Brush.Color := clWhite;  // Пример изменения цвета формы
    FillRect(0, 0, Form1.Width + 5, Form1.Height); // Заполнение фона формы
    Pen.Color := clRed;
    Pen.Width := 5;
    Brush.Color := clRed;
    EllipseC(75, 75, 25, 25); // Рисуем эллипс с центром в (75,75) и радиусом 25
    Pen.Color := clRed;
    Brush.Color := clGreen;
    Brush.Style := bsCross;  // Установка стиля кисти на "крест"
    Rectangle(110, 50, 210, 100); // Рисуем прямоугольник
    Pen.Color := clBlack;
    Pen.Width := 10;
    Line(10, 120, Form1.Width -10, 120); // Рисуем линию по ширине формы
    Brush.Color := clWhite;   // Цвет фона текста
    Font.Color := clRed;
    Font.Name := 'Courier';
    Font.Size := 30;
    Font.Style := [fsBold];  // Стиль шрифта
    TextOut(60, 10, 'Рисунок');
  end;
end;
                                                                                                                        //прямоугольник 3
                                                                                                                        // рисунок красный
                                                                                                                        // поднять слово

procedure TForm1.Button1Click(Sender: TObject);
begin
  Draw
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Halt(1);
end;

end.

