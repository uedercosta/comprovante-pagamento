program ComprovantePagamento;

uses
  Vcl.Forms,
  View.MenuPrincipal in 'View\View.MenuPrincipal.pas' {Form1},
  View.Padrao in 'View\Padrao\View.Padrao.pas' {FrmPadrao},
  Repositorio.DataModulo in 'Repositorio\Repositorio.DataModulo.pas' {DM: TDataModule},
  Relatorio.ReciboPagamento in 'Relatorios\Relatorio.ReciboPagamento.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TFrmPadrao, FrmPadrao);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
