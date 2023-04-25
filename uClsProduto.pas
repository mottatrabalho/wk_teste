unit uClsProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.Buttons, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Phys.MySQLDef, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FireDAC.Phys.MySQL, Datasnap.DBClient, Datasnap.Provider;

type
  TProdutos = class
    Novo     :Boolean;

  private
    FCodigo     :Integer;
    FDescricao  :string;
    FPrecoVenda :Double;
    FDataSet :TClientDataSet;

  public
    property Codigo     :Integer        read FCodigo      write FCodigo    ;
    property Descricao  :string         read FDescricao   write FDescricao ;
    property PrecoVenda :Double         read FPrecoVenda  write FPrecoVenda;
    property DataSet    :TClientDataSet read FDataSet     write FDataSet;

    function BuscaProduto(pCodigo :Integer = 0) :Boolean;
  end;

  { TProdutos }

implementation

function TProdutos.BuscaProduto(pCodigo: Integer): Boolean;
var
  iCodigo :Integer;
begin
  if pCodigo = 0 then
    iCodigo := FCodigo
  else
    iCodigo := pCodigo;

  if DataSet.Locate('codigo', pCodigo, [loCaseInsensitive]) then
  begin
    FCodigo     := DataSet.FieldByName('codigo'     ).Value;
    FDescricao  := DataSet.FieldByName('descricao'  ).Value;
    FPrecoVenda := DataSet.FieldByName('preco_venda').Value;

    Result := True;
  end
  else
  begin
    FCodigo     := 0;
    FDescricao  := EmptyStr;
    FPrecoVenda := 0;

    Result := False;
  end;
end;


end.
