unit ImportaNCM.Principal.Controller;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.Json, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Datasnap.Provider, Datasnap.DBClient, Vcl.ExtCtrls,
  Vcl.ComCtrls, System.Threading;

procedure ConfiguraInterface(AForm: TForm);
procedure PanelMouseMove(APanel: TPanel);
procedure PanelMouseLeave(APanel: TPanel);
function ImportaJsonNCM(Filename: TFileName): String;

implementation

uses ImportaNCM.Styles.View, ImportaNCM.Principal.View, ImportaNCM.Status.View;

procedure ConfiguraInterface(AForm: TForm);
var
  i, k: Integer;
begin
  for i := 0 to Pred(AForm.ComponentCount) do
  begin
    if ((AForm.Components[i].ClassName = 'TPanel') and (AForm.Components[i].Tag = 10)) then
    begin
      TPanel(AForm.Components[i]).Color        := BUTTON_COLOR;
      TPanel(AForm.Components[i]).OnMouseMove  := frmPrincipal.PN_EVENTOS.OnMouseMove;
      TPanel(AForm.Components[i]).OnMouseLeave := frmPrincipal.PN_EVENTOS.OnMouseLeave;
      TPanel(AForm.Components[i]).Cursor       := crHandPoint;
    end;
  end;
end;

procedure PanelMouseMove(APanel: TPanel);
begin
  APanel.Color := BUTTON_COLOR_HOVER;
end;

procedure PanelMouseLeave(APanel: TPanel);
begin
  APanel.Color := BUTTON_COLOR;
end;

function ImportaJSONNCM(FileName: TFileName): String;
var
  JsonObj, JCod: TJSONObject;
  JArray: TJsonArray;
  vListaCod, vListaDesc, vListaDelphi: TStringlist;
  i: Integer;

  procedure PreencheLinhaDelphi(Lista: TStringList; Codigo, Desc: String);

    function Descricao(desc: string): string;
    var
      sAux, sAux2: string;
    begin
      desc := StringReplace(desc, Chr(39), '', [rfReplaceAll]);
      result := copy(desc, 1, 160);
    end;

  begin
   Lista.Add('FListaNCM.Add(PreencheNCM('+QuotedStr(Codigo)+','+' '+#39+AnsiUpperCase(Descricao(Desc))+#39+','+#39#39+','+#39#39+'));');
  end;

begin
  vListaCod  := TStringList.Create;
  vListaDesc := TStringList.Create;
  vListaDelphi := TStringList.Create;
  try
    vListaCod.LoadFromFile(FileName);
    JsonObj := TJsonObject.ParseJsonValue(TEncoding.ANSI.GetBytes(vListaCod.Text), 0) as TJSONObject;
    vListaCod.Clear;
    try
      JArray := jsonObj.Get('Nomenclaturas').JsonValue as TJsonArray;
      frmStatus := TfrmStatus.Create(nil);
      frmStatus.Gauge.MaxValue := JArray.Count;
      frmStatus.Hide;
      frmStatus.Show;
      for i := 0 to JArray.Count -1 do
      begin
        with frmStatus do
        begin
          lbStatus.Caption := 'Importando Códigos';
          Gauge.Progress := Gauge.Progress +1;
        end;
        JCod := JArray.Items[i] as TJSONObject;
        vListaCod.Add(JCod.GetValue('Codigo').Value);
        vListaDesc.Add(JCod.GetValue('Descricao').Value);
        PreencheLinhaDelphi(vListaDelphi,vListaCod[i],vListaDesc[i]);
      end;
      frmStatus.Close;
    except
      on e:exception do
        MessageDlg(e.message + 'Verifique o arquivo importado.', mtError, [mbok], 0);
    end;
    Result := vListaDelphi.Text;
  finally
    if frmStatus <> nil then
      frmStatus.Free;
    JsonObj.Free;
    vListaCod.Free;
    vListaDesc.Free;
    vListaDelphi.Free;
  end;
end;



end.
