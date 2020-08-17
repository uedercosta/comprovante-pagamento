unit View.Padrao.CadastrosMasterDetail;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  View.Padrao, System.Actions, Vcl.ActnList, System.ImageList, Vcl.ImgList,
  ACBrBase, ACBrEnterTab, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client, JvBaseEdits,
  JvDBControls, Vcl.Mask, JvExMask, JvToolEdit, Vcl.Grids, Vcl.DBGrids,
  JvExDBGrids, JvDBGrid, Vcl.WinXCtrls, Vcl.ComCtrls, Vcl.DBCtrls;

type
  TfrmMasterDetail = class(TFrmPadrao)
    ilCadastros: TImageList;
    act_Cadastros: TActionList;
    Panel1: TPanel;
    btnIncluir: TBitBtn;
    btnEditar: TBitBtn;
    btnExcluir: TBitBtn;
    btnSalvar: TBitBtn;
    btnCancelar: TBitBtn;
    btnSair: TBitBtn;
    act_Incluir: TAction;
    act_Editar: TAction;
    act_Excluir: TAction;
    act_Cancelar: TAction;
    act_Salvar: TAction;
    act_Sair: TAction;
    act_Pesquisar: TAction;
    ds: TDataSource;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    pnDados: TPanel;
    grpPesquisa: TGroupBox;
    edPesquisa: TSearchBox;
    cbbFiltro: TComboBox;
    dbGrid: TJvDBGrid;
    procedure act_IncluirExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure act_EditarExecute(Sender: TObject);
    procedure dsDataChange(Sender: TObject; Field: TField);
    procedure edPesquisaInvokeSearch(Sender: TObject);
    procedure act_ExcluirExecute(Sender: TObject);
    procedure act_CancelarExecute(Sender: TObject);
    procedure act_SalvarExecute(Sender: TObject);
    procedure act_SairExecute(Sender: TObject);
    procedure ativarUpperCase;
    procedure dbGridDblClick(Sender: TObject);
    procedure cbbFiltroChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMasterDetail: TfrmMasterDetail;

implementation

{$R *.dfm}

uses
  View.MenuPrincipal, Repositorio.DataModulo;

procedure TfrmMasterDetail.act_CancelarExecute(Sender: TObject);
begin
  try
    if Assigned(ds.DataSet) then
    begin
      TFDQuery(ds.DataSet).CancelUpdates;
      PageControl1.ActivePageIndex := 1;
      Application.MessageBox('Todas as altera��es foram desfeitas...', 'Informa��o', MB_OK + MB_ICONINFORMATION);
    end
    else
    begin
      Application.MessageBox('Tabela n�o associada ao sistema!!!' + #13#10 + 'Entre em contato com o administrador do sistema.', 'Informa��o', MB_OK + MB_ICONSTOP);
      Exit;
      Close;
    end;
  except
    on E: Exception do
      ShowMessage(e.Message);
  end;

end;

procedure TfrmMasterDetail.act_EditarExecute(Sender: TObject);
begin
  try
    if Assigned(ds.DataSet) then
    begin
      ds.DataSet.Edit;
      PageControl1.ActivePageIndex := 1;
    end
    else
    begin
      Application.MessageBox('Tabela n�o associada ao sistema!!!' + #13#10 + 'Entre em contato com o administrador do sistema.', 'Informa��o', MB_OK + MB_ICONSTOP);
      Exit;
      Close;
    end;
  except
    on E: Exception do
      ShowMessage(e.Message);
  end;
end;

procedure TfrmMasterDetail.act_ExcluirExecute(Sender: TObject);
begin
  try
    if Assigned(ds.DataSet) then
    begin
      if Application.MessageBox('Confirma a exclus�o do Registro ?', 'Informa��o', MB_YESNO + MB_ICONQUESTION) = IDYES then
      begin
        ds.DataSet.Delete;
        TFDQuery(ds.DataSet).ApplyUpdates(0);
        ds.DataSet.Close;
        ds.DataSet.Open;
        PageControl1.ActivePageIndex := 0;
        Application.MessageBox('Registro exclu�do com sucesso...', 'Informa��o', MB_OK + MB_ICONINFORMATION);
      end;
    end
    else
    begin
      Application.MessageBox('Tabela n�o associada ao sistema!!!' + #13#10 + 'Entre em contato com o administrador do sistema.', 'Informa��o', MB_OK + MB_ICONSTOP);
      Exit;
      Close;
    end;
  except
    on E: Exception do
      ShowMessage(e.Message);
  end;

end;

procedure TfrmMasterDetail.act_IncluirExecute(Sender: TObject);
begin
  try
    if Assigned(ds.DataSet) then
    begin
      ds.DataSet.Insert;
      PageControl1.ActivePageIndex := 1;
      if (ds.DataSet.FindField('ID_EMPRESA') <> nil) and (VAR_Tabela <> 'EMPRESAS') then
        ds.DataSet.FindField('ID_EMPRESA').Value := VAR_Empresa;
    end
    else
    begin
      Application.MessageBox('Tabela n�o associada ao sistema!!!' + #13#10 + 'Entre em contato com o administrador do sistema.', 'Informa��o', MB_OK + MB_ICONSTOP);
      Exit;
      Close;
    end;
  except
    on E: Exception do
      ShowMessage(e.Message);
  end;
end;

procedure TfrmMasterDetail.act_SairExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmMasterDetail.act_SalvarExecute(Sender: TObject);
begin
  try
    if Assigned(ds.DataSet) then
    begin
      ds.DataSet.Post;
      TFDQuery(ds.DataSet).ApplyUpdates(0);
      ds.DataSet.close;
      ds.DataSet.open;
      PageControl1.ActivePageIndex := 1;
      Application.MessageBox('Registro gravado com sucesso...', 'Informa��o', MB_OK + MB_ICONINFORMATION);
    end
    else
    begin
      Application.MessageBox('Tabela n�o associada ao sistema!!!' + #13#10 + 'Entre em contato com o administrador do sistema.', 'Informa��o', MB_OK + MB_ICONSTOP);
      Exit;
      Close;
    end;
  except
    on E: Exception do
      ShowMessage(e.Message);
  end;
end;

procedure TfrmMasterDetail.ativarUpperCase;
var
  I: Integer;
begin
  for I := 0 to ComponentCount - 1 do
  begin
    if (Components[I] is TDBEdit) then
      (Components[I] as TDBEdit).CharCase := ecUpperCase;
    if (Components[I] is TEdit) then
      (Components[I] as TEdit).CharCase := ecUpperCase;
  end;
end;

procedure TfrmMasterDetail.cbbFiltroChange(Sender: TObject);
begin
  inherited;
  if cbbFiltro.ItemIndex = 0 then
    edPesquisa.NumbersOnly := True
  else
    edPesquisa.NumbersOnly := False;
end;

procedure TfrmMasterDetail.dbGridDblClick(Sender: TObject);
begin
  inherited;
  btnEditar.Click;
end;

procedure TfrmMasterDetail.dsDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  btnIncluir.Enabled := ds.DataSet.State = dsBrowse;
  btnEditar.Enabled := (ds.DataSet.State = dsBrowse) and (not ds.DataSet.IsEmpty);
  btnExcluir.Enabled := (ds.DataSet.State = dsBrowse) and (not ds.DataSet.IsEmpty);
  btnSalvar.Enabled := (ds.DataSet.State in [dsEdit, dsInsert]);
  btnCancelar.Enabled := (ds.DataSet.State in [dsEdit, dsInsert]);
  pnDados.Enabled := (ds.DataSet.State in [dsEdit, dsInsert]);
end;

procedure TfrmMasterDetail.FormShow(Sender: TObject);
begin
  try
    ativarUpperCase;
    PageControl1.ActivePageIndex := 0;
    if Assigned(ds.DataSet) then
    begin
      with TFDQuery(ds.DataSet) do
      begin
        Close;
        SQL.Clear;
        sql.Add(Format('SELECT * FROM %S', [VAR_Tabela]));
        if VAR_BuscarPorEmpresa then
        begin
          SQL.Add('WHERE ID_EMPRESA = ' + VAR_Empresa.ToString);
        end;
        Open;
      end;
      VAR_BuscarPorEmpresa := True;
    end;
  except
    on e: Exception do
    begin
      Application.MessageBox(PWideChar(e.Message), 'Informa��o', MB_OK + MB_ICONSTOP);
    end;

  end;
end;

procedure TfrmMasterDetail.edPesquisaInvokeSearch(Sender: TObject);
begin
  try
    with TFDQuery(ds.DataSet) do
    begin
      close;
      sql.Clear;
      sql.Add(VAR_Comando.ToString);
      open;
    end;
    if TFDQuery(ds.DataSet).IsEmpty then
    begin
      Application.MessageBox('Nenhum registro encontrado...', 'Informa��o', MB_OK + MB_ICONINFORMATION);
      edPesquisa.SetFocus;
      Exit;
    end;
    VAR_Comando.Free;
  except
    on e: Exception do
      ShowMessage(e.Message + ' -> ' + TFDQuery(ds.DataSet).SQL.Text);
  end;
end;

end.

