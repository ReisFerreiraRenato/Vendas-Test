unit uGeraSQL_Controller;

interface

uses Vcl.StdCtrls, uGeraSQL_Interface;

Type
  TController_GeraSQL = class(TinterfacedObject, iController_GeraSQL)
  Fcolunas :TMemo;
  FTabela  :TMemo;
  FCondicao :TMemo;
  class
    function New :iController_GeraSQL;
    function SetColunas(Colunas: TMemo):iController_GeraSQL;
    function SetTabela(Tabela: TMemo):iController_GeraSQL;
    function SetCondicao(Condicao: TMemo):iController_GeraSQL;
    function GeraSQL : String;
  end;

implementation

uses
  uspQuery, System.Classes, System.SysUtils;

{ TController_GeraSQL }

function TController_GeraSQL.GeraSQL: String;
var
  qry_gera_sql : tspQuery;
  colunas: TStringList;
  tabelas: TStringList;
  condicoes: TStringList;
  i: Integer;
begin
  colunas := TStringList.Create;
  tabelas := TStringList.Create;
  condicoes := TStringList.Create;

  qry_gera_sql := TspQuery.Create(nil);

  try
    for i := 0 to Fcolunas.Lines.Count - 1 do
      colunas.Add(Fcolunas.Lines.Strings[i]);

    tabelas.Add(FTabela.Lines.Text);
    condicoes.Add(FCondicao.Lines.Text);

    qry_gera_sql.spColunas := colunas;
    qry_gera_sql.spTabelas := tabelas;
    qry_gera_sql.spCondicoes := condicoes;
    //qry_gera_sql.GeraSQL;
    // Result := qryGeraSQL.SQL.Strings[0];

    Result := qry_gera_sql.GeraSQL;

  finally
    colunas.Free;
    tabelas.Free;
    condicoes.Free;
    qry_gera_sql.Free;
  end;
end;

class function TController_GeraSQL.New: iController_GeraSQL;
begin
  Result := Self.Create;
end;

function TController_GeraSQL.SetColunas(Colunas: TMemo): iController_GeraSQL;
begin
  Result := Self;
  Fcolunas := Colunas;
end;

function TController_GeraSQL.SetCondicao(Condicao: TMemo): iController_GeraSQL;
begin
  Result := Self;
  FCondicao := Condicao;
end;

function TController_GeraSQL.SetTabela(Tabela: TMemo): iController_GeraSQL;
begin
  Result := Self;
  FTabela := Tabela;
end;

end.
