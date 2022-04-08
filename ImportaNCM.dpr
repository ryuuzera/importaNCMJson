program ImportaNCM;

uses
  Vcl.Forms,
  ImportaNCM.Principal.View in 'View\ImportaNCM.Principal.View.pas' {frmPrincipal},
  ImportaNCM.Styles.View in 'View\ImportaNCM.Styles.View.pas',
  ImportaNCM.Principal.Controller in 'Controller\ImportaNCM.Principal.Controller.pas',
  ImportaNCM.Status.View in 'View\ImportaNCM.Status.View.pas' {frmStatus},
  ImportaNCM.Principal.Model in 'Model\ImportaNCM.Principal.Model.pas' {dmPrincipal: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TdmPrincipal, dmPrincipal);
  Application.Run;
end.
