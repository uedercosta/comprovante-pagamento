unit View.Cadastros.Empresas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.Padrao.Cadastros, Data.DB,
  System.Actions, Vcl.ActnList, System.ImageList, Vcl.ImgList, ACBrBase,
  ACBrEnterTab, Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid, Vcl.StdCtrls,
  Vcl.WinXCtrls, Vcl.ComCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls,
  ACBrValidador;

type
  TfrmCadEmpresas = class(TfrmCadastroSimples)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Validador: TACBrValidador;
    procedure FormShow(Sender: TObject);
    procedure edPesquisaInvokeSearch(Sender: TObject);
    procedure act_IncluirExecute(Sender: TObject);
    procedure act_EditarExecute(Sender: TObject);
    procedure act_SalvarExecute(Sender: TObject);

  private
    { Private declarations }
    procedure ajustaColunas;
  public
    { Public declarations }
  end;

var
  frmCadEmpresas: TfrmCadEmpresas;

implementation

{$R *.dfm}

uses
  Repositorio.DataModulo, View.MenuPrincipal, Util.Utilitarios;

procedure TfrmCadEmpresas.act_EditarExecute(Sender: TObject);
begin
  inherited;
  DBEdit2.SetFocus;
end;

procedure TfrmCadEmpresas.act_IncluirExecute(Sender: TObject);
begin
  inherited;
  DBEdit2.SetFocus;
end;

procedure TfrmCadEmpresas.act_SalvarExecute(Sender: TObject);
begin
if FN_ValidarDocumentos(Validador, dbedit6.Text, '', docCNPJ) = false then
  begin
    DBEdit6.SetFocus;
    Exit;
  end;


  inherited;

end;

procedure TfrmCadEmpresas.ajustaColunas;
begin
  with dbGrid do
    begin
      Columns[0].Width:=315;
      Columns[1].Width:=125;
    end;
end;

procedure TfrmCadEmpresas.edPesquisaInvokeSearch(Sender: TObject);
begin
  VAR_Comando:= TStringBuilder.Create;
  VAR_Comando.Append('SELECT * FROM EMPRESAS ');
  VAR_Comando.Append('WHERE 1 = 1 ');
  if cbbFiltro.ItemIndex = 0 then
    begin
      if Trim(edPesquisa.Text) <> '' then
        VAR_Comando.Append('AND ID_EMPRESA = '+ edPesquisa.Text);
    end
  else
    begin
      if Trim(edPesquisa.Text) <> '' then
        VAR_Comando.Append('AND UPPER(NOME) CONTAINING '+ QuotedStr(edPesquisa.Text));
    end;
  inherited;

end;

procedure TfrmCadEmpresas.FormShow(Sender: TObject);
begin
  VAR_tabela:= 'EMPRESAS';
  ajustaColunas;
  VAR_BuscarPorEmpresa:=False;
  inherited;

end;

end.
