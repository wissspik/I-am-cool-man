unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, TAGraph, TASeries;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Chart1: TChart;
    BarSeries1: TBarSeries;
    Chart1BarSeries1: TBarSeries;
    Chart1BarSeries2: TBarSeries;
    Chart1BarSeries3: TBarSeries;
    Chart1BarSeries4: TBarSeries;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    X: TComboBox;
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

procedure TForm1.Button1Click(Sender: TObject);
var
  how_language:integer;
begin
    Chart1BarSeries1.Clear;
    Label3.Caption := '';
    Label4.Caption := '';
    Label5.Caption := '';
    Label6.Caption := '';
    Label7.Caption := '';
    Label9.Caption := '';
    Label10.Caption := '';
    Label11.Caption := '';
    Label12.Caption := '';
    Label8.Caption :='';
  // Используйте серию, которая привязана к графику через дизайнер формы
  how_language := StrToInt(X.Text);
  if how_language = 5 then
  begin
  Chart1BarSeries1.Add(21.90, 'Python', clRed); {1}
  Chart1BarSeries1.Add(11.60, 'C++', clBlue);   {2}
  Chart1BarSeries1.Add(10.51, 'Java', clGreen); {3}
  Chart1BarSeries1.Add(8.38, 'C', clPurple);     {4}
  Chart1BarSeries1.Add(5.62, 'C#', clOlive);   {5}
  Chart1BarSeries1.Add(41.99, 'Ather Language', clGray);  {6}

  Label3.Font.Color := clRed;
  Label4.Font.Color := clBlue;
  Label5.Font.Color := clGreen;
  Label6.Font.Color := clPurple;
  Label7.Font.Color := clOlive;
  Label8.Font.Color := clGray;

  Label3.Caption := 'Python';
  Label4.Caption := 'C++';
  Label5.Caption := 'Java';
  Label6.Caption := 'C';
  Label7.Caption := 'C#';
  Label8.Caption := 'Other language';
  end;

  if how_language = 6 then
  begin
  Chart1BarSeries1.Add(21.90, 'Python', clRed); {1}
  Chart1BarSeries1.Add(11.60, 'C++', clBlue);   {2}
  Chart1BarSeries1.Add(10.51, 'Java', clGreen); {3}
  Chart1BarSeries1.Add(8.38, 'C', clPurple);     {4}
  Chart1BarSeries1.Add(5.62, 'C#', clOlive);   {5}
  Chart1BarSeries1.Add(3.54, 'JavaScipt', clBlack);   {5}
  Chart1BarSeries1.Add(38.45, 'ther Language', clGray);  {6}

  Label3.Font.Color := clRed;
  Label4.Font.Color := clBlue;
  Label5.Font.Color := clGreen;
  Label6.Font.Color := clPurple;
  Label7.Font.Color := clOlive;
  Label7.Font.Color := clBlack;
  Label8.Font.Color := clGray;

  Label3.Caption := 'Python';
  Label4.Caption := 'C++';
  Label5.Caption := 'Java';
  Label6.Caption := 'C';
  Label7.Caption := 'C#';
  Label9.Caption := 'JavaScipt';
  Label8.Caption := 'Other language';
  end;

  if how_language = 7 then
  begin
  Chart1BarSeries1.Add(21.90, 'Python', clRed); {1}
  Chart1BarSeries1.Add(11.60, 'C++', clBlue);   {2}
  Chart1BarSeries1.Add(10.51, 'Java', clGreen); {3}
  Chart1BarSeries1.Add(8.38, 'C', clPurple);     {4}
  Chart1BarSeries1.Add(5.62, 'C#', clOlive);   {5}
  Chart1BarSeries1.Add(3.54, 'JavaScipt', clBlack);
  Chart1BarSeries1.Add(2.35, 'Visual Basic', clTeal);{5}
  Chart1BarSeries1.Add(36.1, 'Other Language', clGray);  {6}

  Label3.Font.Color := clRed;
  Label4.Font.Color := clBlue;
  Label5.Font.Color := clGreen;
  Label6.Font.Color := clPurple;
  Label7.Font.Color := clOlive;
  Label8.Font.Color := clGray;
  Label10.Font.Color := clTeal;

  Label3.Caption := 'Python';
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
  Chart1BarSeries1.Add(21.90, 'Python', clRed); {1}
  Chart1BarSeries1.Add(11.60, 'C++', clBlue);   {2}
  Chart1BarSeries1.Add(10.51, 'Java', clGreen); {3}
  Chart1BarSeries1.Add(8.38, 'C', clPurple);     {4}
  Chart1BarSeries1.Add(5.62, 'C#', clOlive);   {5}
  Chart1BarSeries1.Add(3.54, 'JavaScipt', clBlack);
  Chart1BarSeries1.Add(2.35, 'Visual Basic', clTeal);{5}
  Chart1BarSeries1.Add(2.02, 'GO', clLime);{5}
  Chart1BarSeries1.Add(34.08, 'Other Language', clGray);  {6}

  Label3.Font.Color := clRed;
  Label4.Font.Color := clBlue;
  Label5.Font.Color := clGreen;
  Label6.Font.Color := clPurple;
  Label7.Font.Color := clOlive;
  Label8.Font.Color := clGray;
  Label10.Font.Color := clTeal;
  Label11.Font.Color := clLime;


  Label3.Caption := 'Python';
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
    Chart1BarSeries1.Add(21.90, 'Python', clRed); {1}
    Chart1BarSeries1.Add(11.60, 'C++', clBlue);   {2}
    Chart1BarSeries1.Add(10.51, 'Java', clGreen); {3}
    Chart1BarSeries1.Add(8.38, 'C', clPurple);     {4}
    Chart1BarSeries1.Add(5.62, 'C#', clOlive);   {5}
    Chart1BarSeries1.Add(3.54, 'JavaScipt', clBlack);
    Chart1BarSeries1.Add(2.35, 'Visual Basic', clTeal);{5}
    Chart1BarSeries1.Add(2.02, 'GO', clLime);{5}
    Chart1BarSeries1.Add(1.8, 'Fortran', clAqua);{5}
    Chart1BarSeries1.Add(32.28, 'Other Language', clGray);  {6}

    Label3.Font.Color := clRed;
    Label4.Font.Color := clBlue;
    Label5.Font.Color := clGreen;
    Label6.Font.Color := clPurple;
    Label7.Font.Color := clOlive;
    Label8.Font.Color := clGray;
    Label12.Font.Color := clAqua;
    Label11.Font.Color := clLime;


    Label3.Caption := 'Python';
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
  Chart1BarSeries1.Add(21.90, 'Python', clRed); {1}
    Chart1BarSeries1.Add(11.60, 'C++', clBlue);   {2}
    Chart1BarSeries1.Add(10.51, 'Java', clGreen); {3}
    Chart1BarSeries1.Add(8.38, 'C', clPurple);     {4}
    Chart1BarSeries1.Add(5.62, 'C#', clOlive);   {5}
    Chart1BarSeries1.Add(3.54, 'JavaScipt', clBlack);
    Chart1BarSeries1.Add(2.35, 'Visual Basic', clTeal);{5}
    Chart1BarSeries1.Add(2.02, 'GO', clLime);{5}
    Chart1BarSeries1.Add(1.8, 'Fortran', clAqua);{5}
    Chart1BarSeries1.Add(1.68, 'Fortran', clFuchsia);{5}
    Chart1BarSeries1.Add(30.06, 'Other Language', clGray);  {6}

    Label3.Font.Color := clRed;
    Label4.Font.Color := clBlue;
    Label5.Font.Color := clGreen;
    Label6.Font.Color := clPurple;
    Label7.Font.Color := clOlive;
    Label8.Font.Color := clGray;
    Label12.Font.Color := clAqua;
    Label13.Font.Color := clFuchsia;
    Label11.Font.Color := clLime;


    Label3.Caption := 'Python';
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

procedure TForm1.Button2Click(Sender: TObject);
begin
   Halt(1);
end;


end.



