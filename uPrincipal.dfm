object frmPedidos: TfrmPedidos
  Left = 0
  Top = 0
  Caption = 'M'#243'dulo de Pedidos'
  ClientHeight = 737
  ClientWidth = 1028
  Color = clBtnFace
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 15
  object pcPedido: TPageControl
    Left = 0
    Top = 0
    Width = 1028
    Height = 737
    ActivePage = tsLista
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 633
    object tsLista: TTabSheet
      Caption = 'Lista de Pedidos'
      OnShow = tsListaShow
      object dbgPedidos: TDBGrid
        Left = 0
        Top = 41
        Width = 1020
        Height = 666
        Align = alClient
        DataSource = dsPedidos
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        OnKeyDown = dbgPedidosKeyDown
        Columns = <
          item
            Expanded = False
            FieldName = 'numero'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cod_cliente'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nome'
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'item'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'produto'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'descricao'
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'quantidade'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'valor_unitario'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'valor_total_1'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cidade'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'uf'
            Width = 20
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'codigo_1'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'preco_venda'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'valor_total'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'numero_pedido'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'codigo'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'emissao'
            Visible = False
          end>
      end
      object Panel5: TPanel
        Left = 0
        Top = 0
        Width = 1020
        Height = 41
        Align = alTop
        TabOrder = 1
        ExplicitWidth = 625
        DesignSize = (
          1020
          41)
        object BitBtn1: TBitBtn
          Left = 663
          Top = 7
          Width = 187
          Height = 25
          Anchors = [akTop, akRight]
          Caption = 'Novo Pedido'
          TabOrder = 0
          OnClick = BitBtn1Click
          ExplicitLeft = 268
        end
        object btnExcluiPedido: TBitBtn
          Left = 920
          Top = 7
          Width = 89
          Height = 25
          Anchors = [akTop, akRight]
          Caption = 'Exclui Pedido'
          TabOrder = 1
          OnClick = btnExcluiPedidoClick
          ExplicitLeft = 525
        end
      end
    end
    object tsPedido: TTabSheet
      Caption = 'Pedido'
      ImageIndex = 1
      object Panel1: TPanel
        Left = 0
        Top = 656
        Width = 1020
        Height = 51
        Align = alBottom
        TabOrder = 0
        ExplicitWidth = 625
        DesignSize = (
          1020
          51)
        object Label3: TLabel
          Left = 8
          Top = 20
          Width = 82
          Height = 15
          Caption = 'Total do Pedido'
        end
        object edtTotal: TEdit
          Left = 128
          Top = 15
          Width = 121
          Height = 23
          Enabled = False
          TabOrder = 0
        end
        object btnGravaPedido: TBitBtn
          Left = 917
          Top = 18
          Width = 89
          Height = 25
          Anchors = [akTop, akRight]
          Caption = 'Grava Pedido'
          TabOrder = 1
          OnClick = btnGravaPedidoClick
          ExplicitLeft = 522
        end
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 1020
        Height = 161
        Align = alTop
        TabOrder = 1
        ExplicitWidth = 625
        DesignSize = (
          1020
          161)
        object Label1: TLabel
          Left = 8
          Top = 19
          Width = 101
          Height = 15
          Caption = 'N'#250'mero do Pedido'
        end
        object Label2: TLabel
          Left = 8
          Top = 48
          Width = 37
          Height = 15
          Caption = 'Cliente'
        end
        object Label4: TLabel
          Left = 275
          Top = 19
          Width = 81
          Height = 15
          Caption = 'Data do Pedido'
        end
        object edtNumeroPedido: TEdit
          Left = 128
          Top = 16
          Width = 121
          Height = 23
          TabStop = False
          Enabled = False
          TabOrder = 0
        end
        object edtCliente: TEdit
          Left = 128
          Top = 45
          Width = 121
          Height = 23
          TabOrder = 2
          OnExit = edtClienteExit
        end
        object edtNomeCliente: TEdit
          Left = 255
          Top = 45
          Width = 645
          Height = 23
          TabStop = False
          Anchors = [akLeft, akTop, akRight]
          Enabled = False
          TabOrder = 3
          ExplicitWidth = 250
        end
        object edtData: TEdit
          Left = 391
          Top = 16
          Width = 509
          Height = 23
          TabStop = False
          Anchors = [akLeft, akTop, akRight]
          Enabled = False
          TabOrder = 1
          ExplicitWidth = 114
        end
        object Panel4: TPanel
          Left = 1
          Top = 80
          Width = 1018
          Height = 80
          Align = alBottom
          BevelInner = bvLowered
          TabOrder = 4
          ExplicitWidth = 623
          DesignSize = (
            1018
            80)
          object Label5: TLabel
            Left = 30
            Top = 16
            Width = 43
            Height = 15
            Caption = 'Produto'
          end
          object Label6: TLabel
            Left = 11
            Top = 45
            Width = 62
            Height = 15
            Caption = 'Quantidade'
          end
          object Label7: TLabel
            Left = 166
            Top = 45
            Width = 62
            Height = 15
            Caption = 'Vlr. Unit'#225'rio'
          end
          object Label8: TLabel
            Left = 360
            Top = 45
            Width = 25
            Height = 15
            Caption = 'Total'
          end
          object edtProdutoNome: TEdit
            Left = 207
            Top = 13
            Width = 304
            Height = 23
            TabStop = False
            Enabled = False
            TabOrder = 1
          end
          object edtProduto: TEdit
            Left = 80
            Top = 13
            Width = 121
            Height = 23
            TabOrder = 0
            OnExit = edtProdutoExit
          end
          object edtQuantidade: TEdit
            Left = 80
            Top = 42
            Width = 73
            Height = 23
            TabOrder = 2
          end
          object edtValorUnitario: TEdit
            Left = 234
            Top = 42
            Width = 121
            Height = 23
            TabOrder = 3
            OnExit = edtValorUnitarioExit
          end
          object edtTotalItem: TEdit
            Left = 390
            Top = 42
            Width = 121
            Height = 23
            TabStop = False
            Enabled = False
            TabOrder = 4
          end
          object btnNovoProduto: TBitBtn
            Left = 916
            Top = 12
            Width = 89
            Height = 25
            Anchors = [akTop, akRight]
            Caption = 'Inserir Produto'
            TabOrder = 5
            OnClick = btnNovoProdutoClick
            ExplicitLeft = 521
          end
        end
        object btnNovoPedido: TBitBtn
          Left = 917
          Top = 13
          Width = 89
          Height = 25
          Anchors = [akTop, akRight]
          Caption = 'Novo Pedido'
          TabOrder = 5
          OnClick = BitBtn1Click
          ExplicitLeft = 522
        end
      end
      object Panel3: TPanel
        Left = 0
        Top = 161
        Width = 1020
        Height = 495
        Align = alClient
        TabOrder = 2
        ExplicitWidth = 625
        object dbgTelaPedItens: TDBGrid
          Left = 1
          Top = 1
          Width = 1018
          Height = 493
          Align = alClient
          DataSource = dsTelaPedItens
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = 'Segoe UI'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'Item'
              Width = -1
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'Pedido'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CodProduto'
              Title.Caption = 'C'#243'd. Produto'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Produto'
              Width = 200
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Qtde'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ValorUnitario'
              Title.Caption = 'Vl. Unit'#225'rio'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ValorTotal'
              Title.Caption = 'Valor Total'
              Width = 150
              Visible = True
            end>
        end
      end
    end
  end
  object dsPedidos: TDataSource
    DataSet = DM.cdsPedido
    Left = 180
    Top = 682
  end
  object dsTelaPedItens: TDataSource
    DataSet = DM.cdsPedidoItem
    Left = 76
    Top = 682
  end
end
