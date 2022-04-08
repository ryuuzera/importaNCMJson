unit ImportaNCM.Principal.View;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.Json, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Datasnap.Provider, Datasnap.DBClient, Vcl.ExtCtrls,
  Vcl.ComCtrls, dxGDIPlusClasses;

type
  TfrmPrincipal = class(TForm)
    Panel5: TPanel;
    Panel1: TPanel;
    imgClose: TImage;
    imgMinimize: TImage;
    Panel2: TPanel;
    Panel3: TPanel;
    RichEdit: TRichEdit;
    PN_EVENTOS: TPanel;
    Panel4: TPanel;
    lbStatus: TLabel;
    frmPrincipal: TPanel;
    btGeraCodigo: TPanel;
    btImportaJson: TPanel;
    btComoUtilizar: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure PN_EVENTOSMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure PN_EVENTOSMouseLeave(Sender: TObject);
    procedure imgCloseClick(Sender: TObject);
    procedure imgMinimizeClick(Sender: TObject);
    procedure btImportaJsonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btGeraCodigoClick(Sender: TObject);
    procedure Panel1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btComoUtilizarClick(Sender: TObject);
  private
    ///<summary> Procedimento via Thread para não travar a janela durante o processo. </summary>
    procedure GeraCodigo;
    { Private declarations }
  protected
  public
    { Public declarations }
    vListaTemp: TStringList;
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses ImportaNCM.Principal.Controller, ImportaNCM.Status.View;


procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  vListaTemp.Free;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  ConfiguraInterface(Self);
  vListaTemp := TStringList.Create;
end;

procedure TfrmPrincipal.imgCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPrincipal.imgMinimizeClick(Sender: TObject);
begin
  Application.Minimize;
end;

procedure TfrmPrincipal.Panel1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
const
  sc_DragMove = $F012;
begin
  ReleaseCapture;
  Perform(wm_SysCommand, sc_DragMove, 0);
end;

procedure TfrmPrincipal.btComoUtilizarClick(Sender: TObject);
begin
  RichEdit.Clear;
  with RichEdit do
  begin
    Lines.Add('Ferramenta desenvolvida para atualizar tabela NCM no sistema SuperSoft.');
    Lines.Add('Para Utilizar é necessário efetuar o download do arquivo atualizado no ');
    Lines.add('site da Receita federal em formato JSON.');
    Lines.Add('https://www.gov.br/receitafederal/pt-br/assuntos/aduana-e-comercio-exterior/classificacao-fiscal-de-mercadorias/download-ncm-nomenclatura-comum-do-mercosul');
    Lines.Add('');
    Lines.Add('Após efetuar o download do arquivo, fazer a importação através dessa');
    Lines.Add('ferramenta e através dela gerar o código que deve ser inserido na unit:');
    Lines.Add('Rotinas Comuns/Cadastros/uCarregarNCMPadrao.pas');
    Lines.Add('');
    Lines.Add('Desenvolvedor: Fagner Menezes');
  end;
end;

procedure TfrmPrincipal.GeraCodigo;
var
  Task: TThread;
  n: integer;
begin
  if vListaTemp.Text = '' then
  begin
    MessageDlg('Arquivo JSON ainda não foi importado!', mtInformation, [mbOK], 0);
    Abort;
  end;
  RichEdit.Lines.Clear;
  frmStatus := TfrmStatus.Create(nil);
  n :=  vListaTemp.Count;
  frmStatus.Gauge.MaxValue := n;
  frmStatus.Gauge.Progress := 0;
  frmStatus.Hide;
  frmStatus.Show;
  {Thread para não travar a janela durante o processo que pode demorar}
  task := TThread.CreateAnonymousThread(procedure var k: integer; begin
    try
      for k := 0 to n -1 do
      begin
        TThread.Synchronize(nil, procedure
        var j: integer;
        begin
          j := k;
          frmStatus.lbStatus.Caption := 'Gerando Código ' + frmStatus.Gauge.Progress.ToString + ' de ' + frmStatus.Gauge.MaxValue.ToString;
          frmStatus.Gauge.Progress := frmStatus.Gauge.Progress +1;
          RichEdit.Lines.Add(vListaTemp[j]);
          if not frmStatus.Focused then
            frmStatus.SetFocus;
        end);
      end;
    finally
      frmStatus.Free;
    end;
  end);
  Task.Start;
end;

procedure TfrmPrincipal.btGeraCodigoClick(Sender: TObject);
begin
  GeraCodigo;
end;

procedure TfrmPrincipal.btImportaJsonClick(Sender: TObject);
begin
  with TOpenDialog.Create(nil) do
  begin
    Filter := 'Arquivo JSON |*.json';
    Options := [ofFileMustExist];
    if Execute then
      vListaTemp.Text := ImportaJsonNCM(FileName);
    Free;
  end;
end;

procedure TfrmPrincipal.PN_EVENTOSMouseLeave(Sender: TObject);
begin
  PanelMouseLeave(TPanel(Sender));
end;

procedure TfrmPrincipal.PN_EVENTOSMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  PanelMouseMove(TPanel(Sender));
end;



end.
