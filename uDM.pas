unit uDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Phys.MySQLDef, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FireDAC.Phys.MySQL, Datasnap.DBClient, Datasnap.Provider;

type
  TDM = class(TDataModule)
    fdConn: TFDConnection;
    fdqCliente: TFDQuery;
    fdqProduto: TFDQuery;
    fdqScript: TFDQuery;
    dspCliente: TDataSetProvider;
    cdsCliente: TClientDataSet;
    dspProduto: TDataSetProvider;
    cdsProduto: TClientDataSet;
    FDPMySQLDriver: TFDPhysMySQLDriverLink;
    cdsPedido: TClientDataSet;
    cdsPedidoItem: TClientDataSet;
    fdtSistema: TFDTransaction;
    fdqPedido: TFDQuery;
    dspPedido: TDataSetProvider;
    cdsPedidoItemItem: TIntegerField;
    cdsPedidoItemPedido: TIntegerField;
    cdsPedidoItemCodProduto: TIntegerField;
    cdsPedidoItemProduto: TStringField;
    cdsPedidoItemQtde: TFloatField;
    cdsPedidoItemValorUnitario: TFloatField;
    cdsPedidoItemValorTotal: TFloatField;
    procedure DataModuleCreate(Sender: TObject);
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

procedure TDM.DataModuleCreate(Sender: TObject);
begin
  cdsCliente.Open;
  cdsProduto.Open;
  cdsPedido.Open;
end;

end.
