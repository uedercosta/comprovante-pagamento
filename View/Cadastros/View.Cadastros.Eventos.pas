unit View.Cadastros.Eventos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.Padrao.Cadastros, Data.DB,
  System.Actions, Vcl.ActnList, System.ImageList, Vcl.ImgList, ACBrBase,
  ACBrEnterTab, Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid, Vcl.StdCtrls,
  Vcl.WinXCtrls, Vcl.ComCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls,
  JvExStdCtrls, JvCombobox, JvDBCombobox;

type
  TfrmCadEventos = class(TfrmCadastroSimples)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    cbbDESCONTOS: TJvDBComboBox;
    procedure act_IncluirExecute(Sender: TObject);
    procedure act_EditarExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edPesquisaInvokeSearch(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadEventos: TfrmCadEventos;

implementation

{$R *.dfm}

uses
  Repositorio.DataModulo,View.MenuPrincipal;

procedure TfrmCadEventos.act_EditarExecute(Sender: TObject);
begin
  inherited;
  DBEdit2.SetFocus;
end;

procedure TfrmCadEventos.act_IncluirExecute(Sender: TObject);
begin
  inherited;
  dm.QryEventosDESCONTOS.Value:=0;
  DBEdit2.SetFocus;
end;

procedure TfrmCadEventos.edPesquisaInvokeSearch(Sender: TObject);
begin
  VAR_Comando:= TStringBuilder.Create;
  VAR_Comando.Append('SELECT * FROM EVENTOS WHERE ID_EMPRESA = ' + VAR_Empresa.ToString);
  if cbbFiltro.ItemIndex = 0 then
    begin
      if Trim(edPesquisa.Text) <> '' then
        VAR_Comando.Append(' AND ID_EVENTO = ' + edPesquisa.Text);
    end
  else
    begin
      if Trim(edPesquisa.Text) <> '' then
        VAR_Comando.Append(' AND UPPER(DESCRICAO) CONTAINING ' + QuotedStr(edPesquisa.Text));
    end;
  inherited;
end;

procedure TfrmCadEventos.FormShow(Sender: TObject);
begin
  VAR_Tabela:= 'EVENTOS';
  inherited;
end;

end.
