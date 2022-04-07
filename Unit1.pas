unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.Json, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Datasnap.Provider, Datasnap.DBClient;

type
  TForm1 = class(TForm)
    Button1: TButton;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    DataSetProvider1: TDataSetProvider;
    ClientDataSet1: TClientDataSet;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  procedure CriaCamposDataSet(aDataSet: TClientDataSet);

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure CriaCamposDataSet(aDataSet: TClientDataSet);
var
  strField: TStringField;
begin
  aDataSet.FieldDefs.Clear;
  aDataSet.FieldDefs.Add('Codigo', ftString, 20);
  aDataSet.FieldDefs.Add('Descricao', ftString, 100);

  strField := TStringField.Create(nil);
  with strField do
  begin
    FieldName := 'Codigo';
    DisplayLabel := 'Codigo';
    Size := 10;
    DataSet := aDataSet;
  end;
  strField := TStringField.Create(nil);
  with strField do
  begin
    FieldName := 'Descricao';
    DisplayLabel := 'Descricao';
    Size := 100;
    DataSet := aDataSet;
  end;

  aDataSet.CreateDataSet;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
 JsonObj, JProd: TJSONObject;
 JArray: TJsonArray;
 JPair: TJsonPair;
 i: integer;
 Lista, lista2: TStringList;
begin
  Lista := TStringlist.Create;
  Lista2 := TStringList.Create;
  with TOpenDialog.Create(nil) do
  begin
    if Execute then
    begin
      Lista.LoadFromFile(Filename);
      JsonObj := TJsonObject.ParseJsonValue(TEncoding.ANSI.GetBytes(lista.Text), 0) as TJSONObject;
      try
        try
        JArray := jsonObj.Get('Nomenclaturas').JsonValue as TJsonArray;
        for i := 0 to Pred(JArray.Count) do
        begin
          JProd := JArray.Items[i] as TJSONObject;
          DBGrid1.DataSource.DataSet.Append;
          DBGrid1.DataSource.DataSet.FieldByName('Codigo').AsString := JProd.GetValue('Codigo').Value;
          //Lista2.Add(JProd.GetValue('Codigo').Value + '  ' + JProd.GetValue('Nomenclaturas.Descricao').Value);
          DBGrid1.DataSource.DataSet.FieldByName('Descricao').AsString := JProd.GetValue('Descricao').Value;
          DBGrid1.DataSource.DataSet.Post;
        end;
        except
          on e:exception do
          showmessage(e.message);
        end
      finally
        JsonObj.Free;
        Lista.Free;
        Lista2.Free;
      end;
    end;
  end;

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  CriaCamposDataSet(ClientDataSet1);
end;

end.
