unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.Buttons, uDM, System.RegularExpressions;

type
  TfrmPedidos = class(TForm)
    pcPedido: TPageControl;
    tsLista: TTabSheet;
    tsPedido: TTabSheet;
    dbgPedidos: TDBGrid;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    edtNumeroPedido: TEdit;
    edtCliente: TEdit;
    edtNomeCliente: TEdit;
    edtData: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Panel4: TPanel;
    dbgTelaPedItens: TDBGrid;
    Label5: TLabel;
    edtProdutoNome: TEdit;
    edtProduto: TEdit;
    Label6: TLabel;
    edtQuantidade: TEdit;
    edtValorUnitario: TEdit;
    Label7: TLabel;
    edtTotalItem: TEdit;
    Label8: TLabel;
    Panel5: TPanel;
    BitBtn1: TBitBtn;
    btnNovoPedido: TBitBtn;
    btnNovoProduto: TBitBtn;
    dsPedidos: TDataSource;
    dsTelaPedItens: TDataSource;
    Label3: TLabel;
    edtTotal: TEdit;
    btnExcluiPedido: TBitBtn;
    btnGravaPedido: TBitBtn;
    procedure edtClienteExit(Sender: TObject);
    procedure edtProdutoExit(Sender: TObject);
    procedure btnNovoProdutoClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtValorUnitarioExit(Sender: TObject);
    procedure btnGravaPedidoClick(Sender: TObject);
    procedure btnExcluiPedidoClick(Sender: TObject);
    procedure tsListaShow(Sender: TObject);
    procedure dbgPedidosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);

  private
    { Private declarations }
    bOnExit :Boolean;

    procedure LimpaTela;
    procedure LimpaProduto;
    procedure NovoPedido;
    procedure AtualizaTotal;
    procedure CarregaPedido;
    procedure ExcluiPedido(pNumero :Integer);


  public
    { Public declarations }

  end;

var
  frmPedidos: TfrmPedidos;

implementation

{$R *.dfm}

uses uClsCliente, uClsProduto;


procedure TfrmPedidos.edtClienteExit(Sender: TObject);
var
  Cliente :TClientes;
  RegEx   :TRegEx;
begin
  if Trim(edtCliente.Text) = '0' then
    Exit;

  RegEx := TRegEx.Create('^[0-9]+$');

  if RegEx.IsMatch(edtCliente.Text) then
  begin
    Cliente         := TClientes.Create;
    Cliente.DataSet := DM.cdsCliente;

    if Cliente.BuscaCliente(StrToInt(edtCliente.Text)) then
    begin
      edtNomeCliente.Text := Cliente.Nome;
    end
    else
    begin
      ShowMessage('Registro não encontrado!');
      edtCliente.SetFocus;
    end;

    FreeAndNil(Cliente);
  end
  else
  begin
    ShowMessage('Apenas números são permitidos no campo!' + #13 +
                'Se você quiser sair da tela digite "0" neste campo');
    edtCliente.SetFocus;
  end;

end;

procedure TfrmPedidos.edtProdutoExit(Sender: TObject);
var
  Produto :TProdutos;
  RegEx   :TRegEx;
begin
  if Trim(edtProduto.Text) = '0' then
    Exit;

  RegEx := TRegEx.Create('^[0-9]+$');

  if RegEx.IsMatch(edtProduto.Text) then
  begin
    Produto         := TProdutos.Create;
    Produto.DataSet := DM.cdsProduto;

    if Produto.BuscaProduto(StrToInt(edtProduto.Text)) then
    begin
      if DM.cdsPedidoItem.Active = False then
        DM.cdsPedidoItem.CreateDataSet;

      edtProdutoNome.Text := Produto.Descricao
    end
    else
    begin
      ShowMessage('Registro não encontrado!');
      edtProduto.SetFocus;
    end;

    FreeAndNil(Produto);
  end
  else
  begin
    ShowMessage('Apenas números são permitidos no campo!' + #13 +
                'Se você quiser sair da tela digite "0" neste campo');
    edtProduto.SetFocus;
  end;

end;

procedure TfrmPedidos.edtValorUnitarioExit(Sender: TObject);
begin
  try
    edtTotalItem.Text := FormatFloat('#,###0.00', StrToFloat(edtQuantidade.Text) * StrToFloat(edtValorUnitario.Text));
  except
    edtTotalItem.Text := '0';
  end;

end;

procedure TfrmPedidos.ExcluiPedido(pNumero :Integer);
begin
  try
    try
      if pNumero <> 0 then
      begin
        DM.fdtSistema.StartTransaction;

        DM.fdqScript.Close;
        DM.fdqScript.SQL.Clear;
        DM.fdqScript.SQL.Text := 'DELETE FROM pedido_item WHERE numero_pedido = :Pnumero_pedido';
        DM.fdqScript.ParamByName('pnumero_pedido' ).Value := pNumero;
        DM.fdqScript.ExecSQL;

        DM.fdqScript.Close;
        DM.fdqScript.SQL.Clear;
        DM.fdqScript.SQL.Text := 'DELETE FROM pedido WHERE numero = :Pnumero_pedido';
        DM.fdqScript.ParamByName('pnumero_pedido' ).Value := pNumero;
        DM.fdqScript.ExecSQL;

        DM.fdtSistema.Commit;
        ShowMessage('Pedido Excluído com Sucesso!');
      end;

    except
      on E: Exception do
      begin
        DM.fdtSistema.Rollback;
        ShowMessage('Houve um Erro ao tentar Excluir o Pedido - ERRO: ' + E.Message);
      end;
    end;
  finally
    DM.cdsPedidoItem.Close;
    DM.fdqScript.Close;
    DM.fdqScript.SQL.Clear;

    DM.cdsPedido.Close;
    DM.cdsPedido.Open;

    LimpaTela;
    LimpaProduto;
    pcPedido.ActivePage := tsLista;
  end;
end;

procedure TfrmPedidos.FormCreate(Sender: TObject);
begin
  LimpaTela;
  pcPedido.ActivePage := tsLista;
  Self.Refresh;
end;

procedure TfrmPedidos.LimpaProduto;
begin
  edtProdutoNome.Clear;
  edtProduto.Clear;
  edtQuantidade.Clear;
  edtValorUnitario.Clear;
  edtTotalItem.Clear;
  edtTotal.Clear;
end;

procedure TfrmPedidos.LimpaTela;
begin
  dbgTelaPedItens.Tag := 0;

  edtNumeroPedido.Clear;
  edtCliente.Clear;
  edtNomeCliente.Clear;
  edtData.Text := FormatDateTime('dd/mm/yyyy hh:mm:ss', Now);

  LimpaProduto;
end;

procedure TfrmPedidos.NovoPedido;
begin
  LimpaTela;

  if pcPedido.ActivePage = tsLista then
    pcPedido.ActivePage := tsPedido;

  if DM.cdsPedidoItem.Active then
  begin
    DM.cdsPedidoItem.EmptyDataSet;
    DM.cdsPedidoItem.Close;
  end;

  Self.Refresh;
  edtCliente.SetFocus;

end;

procedure TfrmPedidos.tsListaShow(Sender: TObject);
begin
  btnExcluiPedido.Visible := (edtCliente.Text = EmptyStr) or (edtCliente.Text = '0');
end;

procedure TfrmPedidos.btnNovoProdutoClick(Sender: TObject);
begin
  dbgTelaPedItens.Tag := dbgTelaPedItens.Tag + 1;
  DM.cdsPedidoItem.Append;
  DM.cdsPedidoItem.FieldByName('Item'         ).Value := dbgTelaPedItens.Tag;
  DM.cdsPedidoItem.FieldByName('Pedido'       ).Value := 0;
  DM.cdsPedidoItem.FieldByName('CodProduto'   ).Value := edtProduto.Text;
  DM.cdsPedidoItem.FieldByName('Produto'      ).Value := edtProdutoNome.Text;
  DM.cdsPedidoItem.FieldByName('Qtde'         ).Value := edtQuantidade.Text;
  DM.cdsPedidoItem.FieldByName('ValorUnitario').Value := edtValorUnitario.Text;
  DM.cdsPedidoItem.FieldByName('ValorTotal'   ).Value := DM.cdsPedidoItem.FieldByName('Qtde').AsFloat *
                                                         DM.cdsPedidoItem.FieldByName('ValorUnitario').AsFloat;
  DM.cdsPedidoItem.Post;

  LimpaProduto;
  AtualizaTotal;
  edtProduto.SetFocus;
  Self.Refresh;
end;

procedure TfrmPedidos.CarregaPedido;
var
  Cliente :TClientes;
begin
  edtNumeroPedido.Text := DM.cdsPedido.FieldByName('numero').AsString;

  Cliente := TClientes.Create;
  Cliente.DataSet := DM.cdsCliente;
  edtCliente.Text := DM.cdsPedido.FieldByName('cod_cliente').AsString;
  Cliente.BuscaCliente(StrToInt(edtCliente.Text));
  edtNomeCliente.Text := Cliente.Nome;
  FreeAndNil(Cliente);

  DM.cdsPedidoItem.CreateDataSet;
  DM.fdqScript.Close;
  DM.fdqScript.SQL.Text := 'select * ' +
                           '  from pedido_item ITE ' +
                           '  join produtos PRO on PRO.codigo = ITE.produto ' +
                           ' where numero_pedido = :pnumero_pedido ';
  DM.fdqScript.ParamByName('pnumero_pedido').Value := DM.cdsPedido.FieldByName('numero').AsInteger;
  DM.fdqScript.Open;

  DM.fdqScript.First;
  while not DM.fdqScript.EOF do
  begin
    DM.cdsPedidoItem.Append;
    DM.cdsPedidoItem.FieldByName('Item'         ).Value := DM.fdqScript.FieldByName('item').Value;
    DM.cdsPedidoItem.FieldByName('Pedido'       ).Value := edtNumeroPedido.Text;
    DM.cdsPedidoItem.FieldByName('CodProduto'   ).Value := DM.fdqScript.FieldByName('produto'       ).Value;
    DM.cdsPedidoItem.FieldByName('Produto'      ).Value := DM.fdqScript.FieldByName('descricao'     ).Value;
    DM.cdsPedidoItem.FieldByName('Qtde'         ).Value := DM.fdqScript.FieldByName('quantidade'    ).Value;
    DM.cdsPedidoItem.FieldByName('ValorUnitario').Value := DM.fdqScript.FieldByName('valor_unitario').Value;
    DM.cdsPedidoItem.FieldByName('ValorTotal'   ).Value := DM.fdqScript.FieldByName('valor_total'   ).Value;
    DM.cdsPedidoItem.Post;

    DM.fdqScript.Next;
  end;

  AtualizaTotal;

  edtProduto.SetFocus;
end;

procedure TfrmPedidos.dbgPedidosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of

       // ENTER
       13 : begin
              NovoPedido;
              CarregaPedido;
            end;

       // DELETE
       46 : begin
              If MessageDlg('Você tem certeza que deseja excluir o registro?',
                            mtConfirmation,
                            [mbyes,mbno],
                            0) = mryes then
                ExcluiPedido(DM.cdsPedido.FieldByName('numero').AsInteger);
            end;

  end;
end;

procedure TfrmPedidos.AtualizaTotal;
var
  dValorTotal :Double;
begin
  try
    try
      dValorTotal := 0;

      DM.cdsPedidoItem.DisableControls;
      DM.cdsPedidoItem.First;
      while not DM.cdsPedidoItem.Eof do
      begin
        dValorTotal := dValorTotal + DM.cdsPedidoItem.FieldByName('ValorTotal').AsFloat;

        DM.cdsPedidoItem.Next;
      end;

      edtTotal.Text := FormatFloat('#,###0.00', dValorTotal);
    except
      edtTotal.Text := '0';
    end;
  finally
    DM.cdsPedidoItem.EnableControls;
  end;
end;

procedure TfrmPedidos.BitBtn1Click(Sender: TObject);
begin
  NovoPedido;
end;

procedure TfrmPedidos.btnGravaPedidoClick(Sender: TObject);
var
  iNumero :Integer;
begin
  try
    try

      DM.fdtSistema.StartTransaction;

      DM.fdqScript.Close;
      DM.fdqScript.SQL.Clear;
      DM.fdqScript.SQL.Text := 'INSERT INTO pedido (cod_cliente, emissao, valor_total) VALUES (:pcod_cliente, :pemissao, :pvalor_total)';
      DM.fdqScript.ParamByName('pcod_cliente').Value := edtCliente.Text;
      DM.fdqScript.ParamByName('pemissao'    ).Value := edtData.Text;
      DM.fdqScript.ParamByName('pvalor_total').Value := edtTotal.Text;
      DM.fdqScript.ExecSQL;

      DM.fdqScript.Close;
      DM.fdqScript.SQL.Clear;
      DM.fdqScript.SQL.Text := 'SELECT MAX(numero) FROM pedido';
      DM.fdqScript.Open;
      iNumero := DM.fdqScript.Fields[0].AsInteger;
      DM.fdqScript.Close;


      DM.fdqScript.SQL.Clear;
      DM.fdqScript.SQL.Text := 'INSERT INTO pedido_item (numero_pedido, produto, quantidade, valor_unitario, valor_total) ' +
                               '     VALUES (:pnumero_pedido, :pproduto, :pquantidade, :pvalor_unitario, :pvalor_total)';

      DM.cdsPedidoItem.First;
      while not DM.cdsPedidoItem.Eof do
      begin
        DM.fdqScript.ParamByName('pnumero_pedido' ).Value := iNumero;
        DM.fdqScript.ParamByName('pproduto'       ).Value := DM.cdsPedidoItemCodProduto.Value;
        DM.fdqScript.ParamByName('pquantidade'    ).Value := DM.cdsPedidoItemQtde.Value;
        DM.fdqScript.ParamByName('pvalor_unitario').Value := DM.cdsPedidoItemValorUnitario.Value;
        DM.fdqScript.ParamByName('pvalor_total'   ).Value := DM.cdsPedidoItemValorTotal.Value;
        DM.fdqScript.ExecSQL;

        DM.cdsPedidoItem.Next;
      end;

      DM.fdtSistema.Commit;
      ShowMessage('Pedido Gravado com Sucesso!');
    Except
      on E: Exception do
      begin
        DM.fdtSistema.Rollback;
        ShowMessage('Houve um Erro ao tentar gravar o Pedido - ERRO: ' + E.Message);
      end;
    end;

  finally
    DM.cdsPedidoItem.Close;
    DM.fdqScript.Close;
    DM.fdqScript.SQL.Clear;

    DM.cdsPedido.Close;
    DM.cdsPedido.Open;

    LimpaTela;
    LimpaProduto;
    pcPedido.ActivePage := tsLista;
  end;

end;

procedure TfrmPedidos.btnExcluiPedidoClick(Sender: TObject);
var
  sNumero :string;
begin

  sNumero := InputBox('Atenção!!!', 'Informe o Número do Pedido', '0');
  if sNumero <> '0' then
  begin
    If MessageDlg('Você tem certeza que deseja excluir o registro?',
                  mtConfirmation,
                  [mbyes,mbno],
                  0) = mryes then
      ExcluiPedido(StrToInt(sNumero));
  end;
end;



end.
