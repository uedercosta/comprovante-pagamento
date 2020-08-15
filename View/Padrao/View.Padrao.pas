unit View.Padrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ACBrBase,
  ACBrEnterTab, View.MenuPrincipal;

type
  TFrmPadrao = class(TForm)
    EnterTab: TACBrEnterTab;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPadrao: TFrmPadrao;

implementation

{$R *.dfm}

procedure TFrmPadrao.FormCreate(Sender: TObject);
begin
  EnterTab.EnterAsTab := VAR_TabEnter;
end;

procedure TFrmPadrao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
case key of
  VK_ESCAPE: Close;
end;
end;

end.

