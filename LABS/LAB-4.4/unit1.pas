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
    ComboBox1: TComboBox;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
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
procedure FFF(PaintBox: TPaintBox; i,centerY: integer;xScale,yScale:Double; xValue, xMin,yValue: Real);
begin
  if i = 0 then
    PaintBox.Canvas.MoveTo(Round((xValue - xMin) * xScale), centerY - Round(yValue * yScale))
  else
    PaintBox.Canvas.LineTo(Round((xValue - xMin) * xScale), centerY - Round(yValue * yScale));
end;



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
  // Пробуем преобразовать значение из Edit1 в число (количество точек)
    numPoints := StrToInt(ComboBox1.Text);
    xMin := StrToFloat(Edit2.Text);
    xMax := StrToFloat(Edit3.Text);
  // Очистим PaintBox
  PaintBox1.Canvas.Clear;

  // Определяем центр и масштабы
  centerY := PaintBox1.Height div 2;  // Центр по оси Y остаётся по центру PaintBox
  xScale := PaintBox1.Width / (xMax - xMin); // Масштаб по оси X для полного отображения диапазона
  yScale := PaintBox1.Height / 4;  // Масштаб по оси Y

  // Ось Ox
  PaintBox1.Canvas.Pen.Color := clBlack;
  PaintBox1.Canvas.MoveTo(0, centerY); // Рисуем ось Ox по центру
  PaintBox1.Canvas.LineTo(PaintBox1.Width, centerY);

  // Ось Oy в начале диапазона xMin
  PaintBox1.Canvas.MoveTo(Round((0 - xMin) * xScale), 0);
  PaintBox1.Canvas.LineTo(Round((0 - xMin) * xScale), PaintBox1.Height); // Рисуем ось Oy

  // Единичные отрезки на осях
  for i := -1 to 1 do
  begin
    PaintBox1.Canvas.MoveTo(Round((i - xMin) * xScale), centerY - 5); // Отметки по оси X
    PaintBox1.Canvas.LineTo(Round((i - xMin) * xScale), centerY + 5);

    PaintBox1.Canvas.MoveTo(Round((0 - xMin) * xScale) - 5, centerY - Round(i * yScale)); // Отметки по оси Y
    PaintBox1.Canvas.LineTo(Round((0 - xMin) * xScale) + 5, centerY - Round(i * yScale));
  end;

  // Рассчитаем шаг для X
  step := (xMax - xMin) / numPoints;

  // Рисуем синусоиду
  PaintBox1.Canvas.Pen.Color := clBlue;
  for i := 0 to numPoints do
  begin
    xValue := xMin + i * step;
    yValue := Sin(xValue);
    FFF(PaintBox1, i,centerY ,xScale ,yScale,xValue,  xMin , yValue);  // Pass PaintBox1 as a parameter
  end;

end;






end.

