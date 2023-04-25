unit uClsCliente;

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
  TClientes = class
    Novo     :Boolean;

  private
    FCodigo  :Integer;
    FNome    :string;
    FCidade  :string;
    FUF      :string;
    FDataSet :TClientDataSet;

  public
    property Codigo  :Integer        read FCodigo  write FCodigo;
    property Nome    :string         read FNome    write FNome  ;
    property Cidade  :string         read FCidade  write FCidade;
    property UF      :string         read FUF      write FUF    ;
    property DataSet :TClientDataSet read FDataSet write FDataSet;

    function BuscaCliente(pCodigo :Integer = 0) :Boolean;
  end;

implementation

{ TCliente }

function TClientes.BuscaCliente(pCodigo: Integer = 0): Boolean;
var
  iCodigo :Integer;
begin
  if pCodigo = 0 then
    iCodigo := FCodigo
  else
    iCodigo := pCodigo;

  if DataSet.Locate('codigo', pCodigo, [loCaseInsensitive]) then
  begin
    FCodigo := DataSet.FieldByName('Codigo').Value;
    FNome   := DataSet.FieldByName('Nome'  ).Value;
    FCidade := DataSet.FieldByName('Cidade').Value;
    FUF     := DataSet.FieldByName('UF'    ).Value;

    Result := True;
  end
  else
  begin
    FCodigo := 0;
    FNome   := EmptyStr;
    FCidade := EmptyStr;
    FUF     := EmptyStr;

    Result := False;
  end;
end;

end.
