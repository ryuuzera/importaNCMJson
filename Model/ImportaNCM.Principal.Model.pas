unit ImportaNCM.Principal.Model;

interface

uses
  System.SysUtils, System.Classes, Vcl.ExtCtrls;

type
  TdmPrincipal = class(TDataModule)
    Timer: TTimer;
    procedure TimerTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmPrincipal: TdmPrincipal;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses ImportaNCM.Principal.View, ImportaNCM.Principal.Controller;

{$R *.dfm}

procedure TdmPrincipal.TimerTimer(Sender: TObject);
begin
  if frmPrincipal.vListaTemp.Text = '' then
    frmPrincipal.lbStatus.Caption := 'Arquivo JSON ainda não foi importado.'
  else
    frmPrincipal.lbStatus.Caption := 'Arquivo JSON Importado Corretamente.' + '   Registros Encontrados: ' + frmPrincipal.vListaTemp.Count.ToString;

end;

end.
