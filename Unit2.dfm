object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 737
  ClientWidth = 633
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  PixelsPerInch = 96
  TextHeight = 15
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 633
    Height = 737
    ActivePage = TabSheet2
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 1057
    object TabSheet1: TTabSheet
      Caption = 'Lista de Pedidos'
      object dbgPedidos: TDBGrid
        Left = 0
        Top = 41
        Width = 625
        Height = 666
        Align = alClient
        DataSource = dsPedidos
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
      end
      object Panel5: TPanel
        Left = 0
        Top = 0
        Width = 625
        Height = 41
        Align = alTop
        TabOrder = 1
        ExplicitWidth = 1049
        DesignSize = (
          625
          41)
        object BitBtn1: TBitBtn
          Left = 428
          Top = 9
          Width = 187
          Height = 25
          Anchors = [akTop, akRight]
          Caption = 'Novo Pedido'
          TabOrder = 0
          ExplicitLeft = 824
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Pedido'
      ImageIndex = 1
      object Panel1: TPanel
        Left = 0
        Top = 648
        Width = 625
        Height = 59
        Align = alBottom
        TabOrder = 0
        ExplicitWidth = 1049
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 625
        Height = 193
        Align = alTop
        TabOrder = 1
        ExplicitWidth = 1049
        DesignSize = (
          625
          193)
        object Label1: TLabel
          Left = 8
          Top = 27
          Width = 101
          Height = 15
          Caption = 'N'#250'mero do Pedido'
        end
        object Label2: TLabel
          Left = 8
          Top = 56
          Width = 37
          Height = 15
          Caption = 'Cliente'
        end
        object Label3: TLabel
          Left = 8
          Top = 85
          Width = 82
          Height = 15
          Caption = 'Total do Pedido'
        end
        object Label4: TLabel
          Left = 275
          Top = 27
          Width = 81
          Height = 15
          Caption = 'Data do Pedido'
        end
        object Edit1: TEdit
          Left = 128
          Top = 24
          Width = 121
          Height = 23
          TabOrder = 0
        end
        object Edit2: TEdit
          Left = 128
          Top = 53
          Width = 121
          Height = 23
          TabOrder = 1
        end
        object Edit3: TEdit
          Left = 255
          Top = 53
          Width = 250
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
          ExplicitWidth = 257
        end
        object Edit4: TEdit
          Left = 128
          Top = 82
          Width = 121
          Height = 23
          TabOrder = 3
        end
        object Edit5: TEdit
          Left = 391
          Top = 24
          Width = 114
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 4
          ExplicitWidth = 121
        end
        object Panel4: TPanel
          Left = 1
          Top = 112
          Width = 623
          Height = 80
          Align = alBottom
          BevelInner = bvLowered
          TabOrder = 5
          ExplicitTop = 144
          ExplicitWidth = 1047
          DesignSize = (
            623
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
          object Edit6: TEdit
            Left = 207
            Top = 13
            Width = 304
            Height = 23
            TabOrder = 0
          end
          object Edit7: TEdit
            Left = 80
            Top = 13
            Width = 121
            Height = 23
            TabOrder = 1
          end
          object Edit8: TEdit
            Left = 80
            Top = 42
            Width = 73
            Height = 23
            TabOrder = 2
          end
          object Edit9: TEdit
            Left = 234
            Top = 42
            Width = 121
            Height = 23
            TabOrder = 3
          end
          object Edit10: TEdit
            Left = 390
            Top = 42
            Width = 121
            Height = 23
            TabOrder = 4
          end
          object BitBtn5: TBitBtn
            Left = 521
            Top = 12
            Width = 89
            Height = 25
            Anchors = [akTop, akRight]
            Caption = 'Novo Produto'
            TabOrder = 5
            ExplicitLeft = 527
          end
        end
        object BitBtn2: TBitBtn
          Left = 522
          Top = 23
          Width = 89
          Height = 25
          Anchors = [akTop, akRight]
          Caption = 'Novo Pedido'
          TabOrder = 6
          ExplicitLeft = 528
        end
        object BitBtn3: TBitBtn
          Left = 522
          Top = 52
          Width = 89
          Height = 25
          Anchors = [akTop, akRight]
          Caption = 'Grava Pedido'
          TabOrder = 7
          ExplicitLeft = 528
        end
        object BitBtn4: TBitBtn
          Left = 522
          Top = 81
          Width = 89
          Height = 25
          Anchors = [akTop, akRight]
          Caption = 'Exclui Pedido'
          TabOrder = 8
          ExplicitLeft = 528
        end
      end
      object Panel3: TPanel
        Left = 0
        Top = 193
        Width = 625
        Height = 455
        Align = alClient
        TabOrder = 2
        ExplicitTop = 145
        ExplicitWidth = 1049
        ExplicitHeight = 296
        object dbgTelaPedItens: TDBGrid
          Left = 1
          Top = 1
          Width = 623
          Height = 453
          Align = alClient
          DataSource = dsTelaPedItens
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = 'Segoe UI'
          TitleFont.Style = []
        end
      end
    end
  end
  object dsPedidos: TDataSource
    Left = 196
    Top = 2
  end
  object dsTelaPedItens: TDataSource
    Left = 276
    Top = 2
  end
end
