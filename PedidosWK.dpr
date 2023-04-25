program PedidosWK;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {frmPedidos},
  uDM in 'uDM.pas' {DM: TDataModule},
  uClsCliente in 'uClsCliente.pas',
  uClsProduto in 'uClsProduto.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmPedidos, frmPedidos);
  Application.Run;
end.
