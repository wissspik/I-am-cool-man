unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    PaintBox1: TPaintBox;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button2Click(Sender: TObject);
begin
  Halt(1)
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  i, numPoints: Integer;
  step, xValue, yValue: Real;
  xScale, yScale: Double;
  centerX, centerY: Integer;
  xMin, xMax: Real;
begin
  // Попробуем преобразовать значение из Edit1 в число (количество точек)
  try
    numPoints := StrToInt(Edit1.Text); // Количество точек
  except
    on E: EConvertError do
    begin
      ShowMessage('Введите корректное число точек в поле!');
      Exit;
    end;
  end;

  // Очистим PaintBox
  PaintBox1.Canvas.Clear;

  // Определяем центр (0,0) и масштабы осей
  centerX := PaintBox1.Width div 2;
  centerY := PaintBox1.Height div 2;
  xScale := 50; // Масштаб по оси X
  yScale := 50; // Масштаб по оси Y

  // Оx and Oy
  PaintBox1.Canvas.Pen.Color := clBlack;
  PaintBox1.Canvas.MoveTo(0, centerY);   // устанавляем место для рисования
  PaintBox1.Canvas.LineTo(PaintBox1.Width, centerY); // рисуется линия от центра ,где рассекается все центральная точка
  PaintBox1.Canvas.MoveTo(centerX, 0); // аналогично с X
  PaintBox1.Canvas.LineTo(centerX, PaintBox1.Height);

  // Диапозон при котором будет проявляться график
  xMin := -2 * Pi;
  xMax := 2 * Pi;


  step := (xMax - xMin) / numPoints;   // Рассчитываем шаг с которым точки будут идти по графику

  // Рисуем синусойду
  PaintBox1.Canvas.Pen.Color := clBlue;  //цвет для синусойды
  for i := 0 to numPoints do
  begin
    xValue := xMin + i * step; //вычисляем x для графика путем прибавления к xmin stepа,который умножается на iб
    yValue := Sin(xValue); // вычисляет много y

    // Преобразуем координаты для отображения на PaintBox
    if i = 0 then
      PaintBox1.Canvas.MoveTo(centerX + Round(xValue * xScale), centerY + Round(yValue * yScale))
    else
      PaintBox1.Canvas.LineTo(centerX + Round(xValue * xScale),  centerY - Round(yValue * yScale));
  end;
end;


end.

