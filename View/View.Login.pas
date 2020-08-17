unit View.Login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  View.Padrao, Data.DB, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid, ACBrBase, ACBrEnterTab,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client, dxGDIPlusClasses,
  System.Actions, Vcl.ActnList, System.ImageList, Vcl.ImgList;

type
  TfrmLogin = class(TFrmPadrao)
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    GroupBox1: TGroupBox;
    JvDBGrid1: TJvDBGrid;
    btnAction2: TBitBtn;
    btnAction1: TBitBtn;
    StatusBar1: TStatusBar;
    Label2: TLabel;
    dsEmpresa: TDataSource;
    Image2: TImage;
    ImageList1: TImageList;
    ActionList1: TActionList;
    act_Sair: TAction;
    act_Confirmar: TAction;
    QryEmpresa: TFDQuery;
    QryEmpresaID_EMPRESA: TLargeintField;
    QryEmpresaNOME: TStringField;
    QryEmpresaENDERECO: TStringField;
    QryEmpresaNUMERO: TStringField;
    QryEmpresaBAIRRO: TStringField;
    QryEmpresaCNPJ: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure act_SairExecute(Sender: TObject);
    procedure act_ConfirmarExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;
  VAR_Tentativas: Integer;

implementation

{$R *.dfm}

uses
  Repositorio.DataModulo, View.MenuPrincipal, Util.Utilitarios;

procedure TfrmLogin.act_ConfirmarExecute(Sender: TObject);
begin
  inherited;
  VAR_Empresa := dsEmpresa.DataSet.FieldByName('ID_EMPRESA').AsInteger;
  Self.Hide;
  if not frmMenu.Showing then
  begin
    Application.CreateForm(TfrmMenu, frmMenu);
  end;
  try
    frmMenu.ShowModal;
  finally
    frmMenu.Free;
  end;
  Self.Close;
  self.Free;
end;

procedure TfrmLogin.act_SairExecute(Sender: TObject);
begin
    Close;
end;

procedure TfrmLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  application.Terminate;
end;

procedure TfrmLogin.FormCreate(Sender: TObject);
begin
  inherited;
  VAR_Tentativas := 0;
  dsEmpresa.DataSet.Close;
  dsEmpresa.DataSet.Open;
end;

end.

