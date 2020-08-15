unit Repositorio.DataModulo;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Phys.IBBase, FireDAC.Comp.UI;

type
  TDM = class(TDataModule)
    con: TFDConnection;
    WaitCursor: TFDGUIxWaitCursor;
    FBDriver: TFDPhysFBDriverLink;
    QryEmpresas: TFDQuery;
    QryEmpresasID_EMPRESA: TLargeintField;
    QryEmpresasNOME: TStringField;
    QryEmpresasENDERECO: TStringField;
    QryEmpresasNUMERO: TStringField;
    QryEmpresasBAIRRO: TStringField;
    QryEmpresasCNPJ: TStringField;
    QryCargos: TFDQuery;
    QryCargosID_CARGO: TLargeintField;
    QryCargosDESCRICAO: TStringField;
    QryCargosID_EMPRESA: TLargeintField;
    QryEventos: TFDQuery;
    QryEventosID_EVENTO: TLargeintField;
    QryEventosDESCRICAO: TStringField;
    QryEventosDESCONTOS: TIntegerField;
    QryEventosID_EMPRESA: TLargeintField;
    QryFuncionarios: TFDQuery;
    QryFuncionariosID_FUNC: TLargeintField;
    QryFuncionariosID_EMPRESA: TLargeintField;
    QryFuncionariosNOME: TStringField;
    QryFuncionariosID_CARGO: TLargeintField;
    QryFuncionariosCPF: TStringField;
    QryFuncionariosRG: TStringField;
    QryFuncionariosDATA_ADMISSAO: TDateField;
    QryFuncionariosOBSERVACAOES: TStringField;
    QryFuncionariosSALARIO: TFMTBCDField;
    QryRecibos: TFDQuery;
    QryRecibosID_RECIBO: TLargeintField;
    QryRecibosID_EMPRESA: TLargeintField;
    QryRecibosID_FUNC: TLargeintField;
    QryRecibosMES: TIntegerField;
    QryRecibosANO: TIntegerField;
    QryRecibosTOTAL_VENCIMENTOS: TFMTBCDField;
    QryRecibosTOTAL_LIQUIDO: TFMTBCDField;
    QryRecibosTOTAL_DESCONTOS: TFMTBCDField;
    QryRecibosSALARIO_BASE: TFMTBCDField;
    QryRecibosSALARIO_CONTR_INSS: TFMTBCDField;
    QryRecibosBASE_FGTS: TFMTBCDField;
    QryRecibosFGTS: TFMTBCDField;
    QryRecibosBASE_CALC_IRRF: TFMTBCDField;
    QryRecibosFAIXA_IRRF: TFMTBCDField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
