unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  Buttons, TAGraph, TASeries, Math; // Подключаем необходимые модули

type
  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Chart1: TChart;
    Chart1PieSeries1: TPieSeries;
    Chart2: TChart;
    ComboBox1: TComboBox;
    Label1: TLabel;
    Label14: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Form1Create(Sender: TObject);
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
  Halt(1);  // Завершение программы
end;

procedure TForm1.Form1Create(Sender: TObject);
begin
  // Очищаем круговую диаграмму при запуске
  Chart1PieSeries1.Clear;

  // Убираем фон и оси, как было сделано ранее
  Chart1.BackColor := clNone;  // Прозрачный фон
  Chart1.Color := clNone;      // Прозрачный цвет графика
  Chart1.BottomAxis.Grid.Visible := False;  // Убираем сетку по оси X
  Chart1.LeftAxis.Grid.Visible := False;    // Убираем сетку по оси Y
  Chart1.BottomAxis.Visible := False;  // Ось X
  Chart1.LeftAxis.Visible := False;    // Ось Y

  // Отключаем заголовок диаграммы, если он есть
  Chart1.Title.Visible := False;

  // Принудительно обновляем диаграмму
  Chart1.Refresh;
end;


procedure TForm1.Button1Click(Sender: TObject);
var
  how_language: integer;
begin
  // Очищаем диаграмму и лейблы перед обновлением
  Chart1.BackColor := clNone;  // Прозрачный фон
  Chart1.Color := clNone;      // Прозрачный цвет графика

  // Убираем сетку
  Chart1.BottomAxis.Grid.Visible := False;  // Убираем сетку по оси X
  Chart1.LeftAxis.Grid.Visible := False;    // Убираем сетку по оси Y
    // Отключаем отображение осей
  Chart1.BottomAxis.Visible := False;  // Ось X
  Chart1.LeftAxis.Visible := False;    // Ось Y


  Chart1PieSeries1.Clear;
  Label14.Caption := '';
  Label4.Caption := '';
  Label5.Caption := '';
  Label6.Caption := '';
  Label7.Caption := '';
  Label8.Caption := '';

  // Преобразуем выбранное значение из ComboBox в целое число
  how_language := StrToInt(ComboBox1.Text);

  if how_language = 5 then
  begin
  Chart1PieSeries1.Add(21.90, 'Python', clRed); {1}
  Chart1PieSeries1.Add(11.60, 'C++', clBlue);   {2}
  Chart1PieSeries1.Add(10.51, 'Java', clGreen); {3}
  Chart1PieSeries1.Add(8.38, 'C', clPurple);     {4}
  Chart1PieSeries1.Add(5.62, 'C#', clOlive);   {5}
  Chart1PieSeries1.Add(41.99, 'Ather Language', clGray);  {6}

  Label14.Font.Color := clRed;
  Label4.Font.Color := clBlue;
  Label5.Font.Color := clGreen;
  Label6.Font.Color := clPurple;
  Label7.Font.Color := clOlive;
  Label8.Font.Color := clGray;

  Label14.Caption := 'Python';
  Label4.Caption := 'C++';
  Label5.Caption := 'Java';
  Label6.Caption := 'C';
  Label7.Caption := 'C#';
  Label8.Caption := 'Other language';
  end;

  if how_language = 6 then
  begin
  Chart1PieSeries1.Add(21.90, 'Python', clRed); {1}
  Chart1PieSeries1.Add(11.60, 'C++', clBlue);   {2}
  Chart1PieSeries1.Add(10.51, 'Java', clGreen); {3}
  Chart1PieSeries1.Add(8.38, 'C', clPurple);     {4}
  Chart1PieSeries1.Add(5.62, 'C#', clOlive);   {5}
  Chart1PieSeries1.Add(3.54, 'JavaScipt', clBlack);   {5}
  Chart1PieSeries1.Add(38.45, 'ther Language', clGray);  {6}

  Label14.Font.Color := clRed;
  Label4.Font.Color := clBlue;
  Label5.Font.Color := clGreen;
  Label6.Font.Color := clPurple;
  Label7.Font.Color := clOlive;
  Label7.Font.Color := clBlack;
  Label8.Font.Color := clGray;

  Label14.Caption := 'Python';
  Label4.Caption := 'C++';
  Label5.Caption := 'Java';
  Label6.Caption := 'C';
  Label7.Caption := 'C#';
  Label9.Caption := 'JavaScipt';
  Label8.Caption := 'Other language';
  end;

  if how_language = 7 then
  begin
  Chart1PieSeries1.Add(21.90, 'Python', clRed); {1}
  Chart1PieSeries1.Add(11.60, 'C++', clBlue);   {2}
  Chart1PieSeries1.Add(10.51, 'Java', clGreen); {3}
  Chart1PieSeries1.Add(8.38, 'C', clPurple);     {4}
  Chart1PieSeries1.Add(5.62, 'C#', clOlive);   {5}
  Chart1PieSeries1.Add(3.54, 'JavaScipt', clBlack);
  Chart1PieSeries1.Add(2.35, 'Visual Basic', clTeal);{5}
  Chart1PieSeries1.Add(36.1, 'Other Language', clGray);  {6}

  Label14.Font.Color := clRed;
  Label4.Font.Color := clBlue;
  Label5.Font.Color := clGreen;
  Label6.Font.Color := clPurple;
  Label7.Font.Color := clOlive;
  Label8.Font.Color := clGray;
  Label10.Font.Color := clTeal;

  Label14.Caption := 'Python';
  Label4.Caption := 'C++';
  Label5.Caption := 'Java';
  Label6.Caption := 'C';
  Label7.Caption := 'C#';
  Label9.Caption := 'JavaScipt';
  Label10.Caption := 'Visual Basic';
  Label8.Caption :='Other language';
  end;

  if how_language = 8 then
  begin
  Chart1PieSeries1.Add(21.90, 'Python', clRed); {1}
  Chart1PieSeries1.Add(11.60, 'C++', clBlue);   {2}
  Chart1PieSeries1.Add(10.51, 'Java', clGreen); {3}
  Chart1PieSeries1.Add(8.38, 'C', clPurple);     {4}
  Chart1PieSeries1.Add(5.62, 'C#', clOlive);   {5}
  Chart1PieSeries1.Add(3.54, 'JavaScipt', clBlack);
  Chart1PieSeries1.Add(2.35, 'Visual Basic', clTeal);{5}
  Chart1PieSeries1.Add(2.02, 'GO', clLime);{5}
  Chart1PieSeries1.Add(34.08, 'Other Language', clGray);  {6}

  Label14.Font.Color := clRed;
  Label4.Font.Color := clBlue;
  Label5.Font.Color := clGreen;
  Label6.Font.Color := clPurple;
  Label7.Font.Color := clOlive;
  Label8.Font.Color := clGray;
  Label10.Font.Color := clTeal;
  Label11.Font.Color := clLime;


  Label14.Caption := 'Python';
  Label4.Caption := 'C++';
  Label5.Caption := 'Java';
  Label6.Caption := 'C';
  Label7.Caption := 'C#';
  Label9.Caption := 'JavaScipt';
  Label10.Caption := 'Visual Basic';
  Label11.Caption := 'GO';
  Label8.Caption :='Other language';
  end;

  if how_language = 9 then
  begin
    Chart1PieSeries1.Add(21.90, 'Python', clRed); {1}
    Chart1PieSeries1.Add(11.60, 'C++', clBlue);   {2}
    Chart1PieSeries1.Add(10.51, 'Java', clGreen); {3}
    Chart1PieSeries1.Add(8.38, 'C', clPurple);     {4}
    Chart1PieSeries1.Add(5.62, 'C#', clOlive);   {5}
    Chart1PieSeries1.Add(3.54, 'JavaScipt', clBlack);
    Chart1PieSeries1.Add(2.35, 'Visual Basic', clTeal);{5}
    Chart1PieSeries1.Add(2.02, 'GO', clLime);{5}
    Chart1PieSeries1.Add(1.8, 'Fortran', clAqua);{5}
    Chart1PieSeries1.Add(32.28, 'Other Language', clGray);  {6}

    Label14.Font.Color := clRed;
    Label4.Font.Color := clBlue;
    Label5.Font.Color := clGreen;
    Label6.Font.Color := clPurple;
    Label7.Font.Color := clOlive;
    Label8.Font.Color := clGray;
    Label12.Font.Color := clAqua;
    Label11.Font.Color := clLime;


    Label14.Caption := 'Python';
    Label4.Caption := 'C++';
    Label5.Caption := 'Java';
    Label6.Caption := 'C';
    Label7.Caption := 'C#';
    Label9.Caption := 'JavaScipt';
    Label10.Caption := 'Visual Basic';
    Label11.Caption := 'GO';
    Label12.Caption := 'Fortran';
    Label8.Caption :='Other language';
  end;

  if how_language = 10 then
  begin
    Chart1PieSeries1.Add(21.90, 'Python', clRed); {1}
    Chart1PieSeries1.Add(11.60, 'C++', clBlue);   {2}
    Chart1PieSeries1.Add(10.51, 'Java', clGreen); {3}
    Chart1PieSeries1.Add(8.38, 'C', clPurple);     {4}
    Chart1PieSeries1.Add(5.62, 'C#', clOlive);   {5}
    Chart1PieSeries1.Add(3.54, 'JavaScipt', clBlack);
    Chart1PieSeries1.Add(2.35, 'Visual Basic', clTeal);{5}
    Chart1PieSeries1.Add(2.02, 'GO', clLime);{5}
    Chart1PieSeries1.Add(1.8, 'Fortran', clAqua);{5}
    Chart1PieSeries1.Add(1.68, 'Fortran', clFuchsia);{5}
    Chart1PieSeries1.Add(30.06, 'Other Language', clGray);  {6}

    Label14.Font.Color := clRed;
    Label4.Font.Color := clBlue;
    Label5.Font.Color := clGreen;
    Label6.Font.Color := clPurple;
    Label7.Font.Color := clOlive;
    Label8.Font.Color := clGray;
    Label12.Font.Color := clAqua;
    Label13.Font.Color := clFuchsia;
    Label11.Font.Color := clLime;


    Label14.Caption := 'Python';
    Label4.Caption := 'C++';
    Label5.Caption := 'Java';
    Label6.Caption := 'C';
    Label7.Caption := 'C#';
    Label9.Caption := 'JavaScipt';
    Label10.Caption := 'Visual Basic';
    Label11.Caption := 'GO';
    Label12.Caption := 'Fortran';
    Label13.Caption := 'Delphi/Object Pascal';
    Label8.Caption :='Other language';
    end;
end;



end.

