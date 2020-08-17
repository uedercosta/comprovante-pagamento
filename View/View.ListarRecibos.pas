unit View.ListarRecibos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.Padrao, Data.DB, Vcl.StdCtrls,
  Vcl.Mask, JvExMask, JvSpin, Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid,
  Vcl.ExtCtrls, ACBrBase, ACBrEnterTab, System.DateUtils, Vcl.Buttons;

type
  TfrmListaRecibos = class(TFrmPadrao)
    Panel1: TPanel;
    dbGrid: TJvDBGrid;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    edAno: TJvSpinEdit;
    GroupBox3: TGroupBox;
    BitBtn1: TBitBtn;
    Edit1: TEdit;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmListaRecibos: TfrmListaRecibos;

implementation

{$R *.dfm}

procedure TfrmListaRecibos.FormCreate(Sender: TObject);
begin
  inherited;
  edAno.MaxValue:= YearOf(Now);
end;

end.
