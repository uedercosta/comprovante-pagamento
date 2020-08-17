program ComprovantePagamento;

uses
  Vcl.Forms,
  View.MenuPrincipal in 'View\View.MenuPrincipal.pas' {frmMenu},
  View.Padrao in 'View\Padrao\View.Padrao.pas' {FrmPadrao},
  Repositorio.DataModulo in 'Repositorio\Repositorio.DataModulo.pas' {DM: TDataModule},
  Relatorio.ReciboPagamento in 'Relatorios\Relatorio.ReciboPagamento.pas' {frmRecibos},
  View.Login in 'View\View.Login.pas' {frmLogin},
  Util.UAssertionErro in 'Util\Util.UAssertionErro.pas',
  Util.Utilitarios in 'Util\Util.Utilitarios.pas',
  Util.VerificaException in 'Util\Util.VerificaException.pas',
  View.Padrao.CadastrosMasterDetail in 'View\Padrao\View.Padrao.CadastrosMasterDetail.pas' {frmMasterDetail},
  View.Cadastros.Empresas in 'View\Cadastros\View.Cadastros.Empresas.pas' {frmCadEmpresas},
  View.Cadastros.Funcionarios in 'View\Cadastros\View.Cadastros.Funcionarios.pas' {frmCadFuncionario},
  View.Cadastros.Cargos in 'View\Cadastros\View.Cadastros.Cargos.pas' {frmCadCargos},
  View.Cadastros.Eventos in 'View\Cadastros\View.Cadastros.Eventos.pas' {frmCadEventos},
  View.ListarRecibos in 'View\View.ListarRecibos.pas' {frmListaRecibos},
  View.Padrao.Cadastros in 'View\Padrao\View.Padrao.Cadastros.pas' {frmCadastroSimples};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TfrmMenu, frmMenu);
  Application.CreateForm(TFrmPadrao, FrmPadrao);
  Application.CreateForm(TfrmMasterDetail, frmMasterDetail);
  Application.CreateForm(TfrmListaRecibos, frmListaRecibos);
  Application.CreateForm(TfrmCadastroSimples, frmCadastroSimples);
  Application.Run;
end.
