unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type
  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    procedure Button1Click(Sender: TObject);
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
  FileName: string;
begin
  OpenDialog1.Filter := 'Text files (*.txt)|*.txt|All files (*.*)|*.*';
  OpenDialog1.Title := 'Выберите файл для открытия';
  OpenDialog1.InitialDir := GetCurrentDir;

  if OpenDialog1.Execute then
  begin
    FileName := OpenDialog1.FileName;
    try

      ShowMessage('Выбран файл: ' + FileName);
    except
      on E: Exception do
        ShowMessage('Произошла ошибка при работе с файлом: ' + E.Message);
    end;
  end
  else
  begin
    ShowMessage('Выбор файла отменен.');
  end;
end;

end.
