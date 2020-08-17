unit View.Cadastros.Funcionarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.Padrao.Cadastros, Data.DB,
  System.Actions, Vcl.ActnList, System.ImageList, Vcl.ImgList, ACBrBase,
  ACBrEnterTab, Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid, Vcl.StdCtrls,
  Vcl.WinXCtrls, Vcl.ComCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls,
  JvBaseEdits, JvDBControls, JvExMask, JvToolEdit, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinTheBezier,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, ACBrValidador;

type
  TfrmCadFuncionario = class(TfrmCadastroSimples)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    JvDBDateEdit1: TJvDBDateEdit;
    edSALARIO: TJvDBCalcEdit;
    mmoOBSERVACAOES: TDBMemo;
    cxDBLookupComboBox1: TcxDBLookupComboBox;
    dsCargos: TDataSource;
    QryCargos: TFDQuery;
    QryCargosID_CARGO: TLargeintField;
    QryCargosDESCRICAO: TStringField;
    QryCargosID_EMPRESA: TLargeintField;
    Validador: TACBrValidador;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure act_SalvarExecute(Sender: TObject);
    procedure edPesquisaInvokeSearch(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadFuncionario: TfrmCadFuncionario;


implementation

{$R *.dfm}

uses
  View.MenuPrincipal, Repositorio.DataModulo, Util.Utilitarios;

procedure TfrmCadFuncionario.act_SalvarExecute(Sender: TObject);
begin
if FN_ValidarDocumentos(Validador, dbedit4.Text, '', docCPF) = false then
  begin
    DBEdit4.SetFocus;
    Exit;
  end;
  inherited;
end;

procedure TfrmCadFuncionario.edPesquisaInvokeSearch(Sender: TObject);
begin
  VAR_Comando:= TStringBuilder.Create;
  VAR_Comando.Append('SELECT * FROM FUNCIONARIOS WHERE ID_EMPRESA = ' + VAR_Empresa.ToString);
  if cbbFiltro.ItemIndex = 0 then
    begin
      if Trim(edPesquisa.Text) <> '' then
        VAR_Comando.Append(' AND ID_FUNC = ' +edPesquisa.Text);
    end
  else
    begin
      if Trim(edPesquisa.Text) <> '' then
        VAR_Comando.Append(' AND UPPER(nome) containing ' + QuotedStr(edPesquisa.Text));
    end;
  inherited;
end;

procedure TfrmCadFuncionario.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  dsCargos.DataSet.Close;
end;

procedure TfrmCadFuncionario.FormShow(Sender: TObject);
begin
  VAR_Tabela:= 'FUNCIONARIOS';

  with TFDQuery(dsCargos.DataSet) do
    begin
      close;
      sql.Clear;
      sql.Add('SELECT * FROM CARGOS WHERE ID_EMPRESA = ' + VAR_Empresa.ToString);
      Open;
    end;

   inherited;

end;

end.
