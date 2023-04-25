object DataModule1: TDataModule1
  Height = 432
  Width = 688
  PixelsPerInch = 96
  object fdConn: TFDConnection
    Left = 56
    Top = 24
  end
  object fddlConn: TFDPhysMySQLDriverLink
    Left = 168
    Top = 24
  end
  object fdqCliente: TFDQuery
    Connection = fdConn
    Left = 56
    Top = 104
  end
  object fdqProduto: TFDQuery
    Connection = fdConn
    Left = 56
    Top = 168
  end
  object fdqPedido: TFDQuery
    Connection = fdConn
    Left = 56
    Top = 232
  end
  object fdqPedItens: TFDQuery
    Connection = fdConn
    Left = 56
    Top = 296
  end
  object fdqTelaPedItens: TFDQuery
    Connection = fdConn
    Left = 56
    Top = 360
  end
end
