object DM: TDM
  OnCreate = DataModuleCreate
  Height = 489
  Width = 337
  PixelsPerInch = 96
  object fdConn: TFDConnection
    Params.Strings = (
      'DriverID=MySQL'
      'Database=wk_teste'
      'Server=127.0.0.1'
      'User_Name=root'
      'Password=masterkey')
    TxOptions.AutoStart = False
    TxOptions.AutoStop = False
    LoginPrompt = False
    Left = 56
    Top = 24
  end
  object fdqCliente: TFDQuery
    Connection = fdConn
    SQL.Strings = (
      'select * from clientes')
    Left = 56
    Top = 104
  end
  object fdqProduto: TFDQuery
    Connection = fdConn
    SQL.Strings = (
      'select * from produtos')
    Left = 56
    Top = 168
  end
  object fdqScript: TFDQuery
    Connection = fdConn
    Left = 152
    Top = 384
  end
  object dspCliente: TDataSetProvider
    DataSet = fdqCliente
    Left = 152
    Top = 104
  end
  object cdsCliente: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCliente'
    Left = 240
    Top = 104
  end
  object dspProduto: TDataSetProvider
    DataSet = fdqProduto
    Left = 152
    Top = 168
  end
  object cdsProduto: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProduto'
    Left = 240
    Top = 168
  end
  object FDPMySQLDriver: TFDPhysMySQLDriverLink
    VendorLib = 
      'G:\Meu Drive\___Trabalho\Sistemas Projetos\_____Testes\2023-04-0' +
      '4 - WK\libmysql.dll'
    Left = 152
    Top = 24
  end
  object cdsPedido: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPedido'
    Left = 240
    Top = 232
  end
  object cdsPedidoItem: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 152
    Top = 312
    object cdsPedidoItemItem: TIntegerField
      FieldName = 'Item'
    end
    object cdsPedidoItemPedido: TIntegerField
      FieldName = 'Pedido'
    end
    object cdsPedidoItemCodProduto: TIntegerField
      FieldName = 'CodProduto'
    end
    object cdsPedidoItemProduto: TStringField
      FieldName = 'Produto'
    end
    object cdsPedidoItemQtde: TFloatField
      FieldName = 'Qtde'
    end
    object cdsPedidoItemValorUnitario: TFloatField
      FieldName = 'ValorUnitario'
      DisplayFormat = '#,###0.00'
    end
    object cdsPedidoItemValorTotal: TFloatField
      FieldName = 'ValorTotal'
      DisplayFormat = '#,###0.00'
    end
  end
  object fdtSistema: TFDTransaction
    Options.AutoStart = False
    Options.AutoStop = False
    Connection = fdConn
    Left = 240
    Top = 24
  end
  object fdqPedido: TFDQuery
    Connection = fdConn
    SQL.Strings = (
      'SELECT * '
      '  FROM pedido PED'
      '  JOIN pedido_item ITE ON ITE.numero_pedido = PED.numero'
      '  JOIN clientes CLI ON CLI.codigo = PED.cod_cliente'
      '  JOIN produtos PRO ON PRO.codigo = ITE.produto')
    Left = 56
    Top = 232
  end
  object dspPedido: TDataSetProvider
    DataSet = fdqPedido
    Left = 152
    Top = 232
  end
end
