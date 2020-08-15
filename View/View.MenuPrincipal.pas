unit View.MenuPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Actions, Vcl.ActnList, Vcl.Menus,
  Vcl.ComCtrls;

type
  TForm1 = class(TForm)
    mmMenu: TMainMenu;
    act_Sistema: TActionList;
    act_CadEmpresa: TAction;
    act_CadFuncionario: TAction;
    act_CadEvento: TAction;
    act_CadCargo: TAction;
    Cadastros1: TMenuItem;
    Cargos1: TMenuItem;
    Empresas1: TMenuItem;
    Eventos1: TMenuItem;
    Funcionrios1: TMenuItem;
    N1: TMenuItem;
    act_CadUsuarios: TAction;
    act_Acessos: TAction;
    Utilitrios1: TMenuItem;
    act_Logoff: TAction;
    act_TrocarSenha: TAction;
    act_Sair: TAction;
    actSair1: TMenuItem;
    actCadUsuarios1: TMenuItem;
    actAcessos1: TMenuItem;
    N2: TMenuItem;
    actTrocarSenha1: TMenuItem;
    actLogoff1: TMenuItem;
    act_CadPerfil: TAction;
    PerfildeAcessos1: TMenuItem;
    sb: TStatusBar;
    act_GeracaoRecibos: TAction;
    act_ImpressaoRecibos: TAction;
    Lanamentos1: TMenuItem;
    GeraoRecibos1: TMenuItem;
    ImpressodosRecibos1: TMenuItem;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  VAR_TabEnter: Boolean;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  VAR_TabEnter:= True;
end;

end.
