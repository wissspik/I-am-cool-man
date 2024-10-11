unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Menus,
  ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    procedure Label1Click(Sender: TObject);
  private
    Button1: TButton;
    Button3: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;


  public

  end;


var
  Form1: TForm1;

implementation

{$R *.lfm}
//procedure TForm1.Label1Click(Sender: TObject);
Label1 := TLabel.Create(Self);
Label1.Parent := Self;
Label1.Caption := 'Новый текст';  // Установка нового текста



begin




end.

