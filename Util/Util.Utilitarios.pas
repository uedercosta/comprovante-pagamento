unit Util.Utilitarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, WinInet, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Vcl.ToolWin, Vcl.ComCtrls, System.DateUtils, System.IniFiles, Winapi.ShellAPI,
  System.Win.ComObj, DB, Vcl.ActnList, Vcl.ImgList, Vcl.Menus,  Vcl.ExtCtrls,
  Vcl.DBCtrls, Vcl.Mask, Winapi.UrlMon, Data.Win.ADODB, Datasnap.DBClient,
  Data.SqlExpr, ACBrConsultaCPF, ACBrBase,ACBrConsultaCNPJ, ACBrValidador, Registry, JvExMask, JvToolEdit ;



function FN_CamposObrigatorios(DataSet: TDataSet): Boolean;
procedure PR_AbreForm(aClasseForm: TComponentClass; aForm: TForm);
function FN_RTrim(Texto: string): string;
function FN_LTrim(Texto: string): string;
function FN_DateValidate(const aData: string): Boolean;
function FN_RemoveChar(const Ch: Char; const S: string): string;
function FN_RemoveAcento(Str: string): string;
function FN_BuscaTexto(Busca, Text: string): Boolean;
function FN_GeraSenha(aQuant: integer): string;
function FN_DownloadFile(SourceFile, DestFile: string): Boolean;
procedure PR_LimparTela(Formulario: TForm; LimpaImagem:Boolean);
function FN_VerificaInternet:Boolean;
function FN_FormataCEP(Texto: String): String;
function FN_FormataCPF(CPF: string): string;
Function FN_FormataCNPJ(cnpj: string): string;
function FN_RetiraFormatacao(Texto:string):string;
function FN_VersaoSistema: string;
procedure PR_DesabilitarCampos(DataSet:TDataSet; Campo: TComponent);
procedure PR_GravaIni(tipoConexao:string; servidor:string; porta:string; gravarUsuario:Boolean; bancoDados:string);
function FN_ImportacaoArquivo(texto:string; separador:string; posicao:Integer):string;
function FN_DiaUtil(Avanco_Retorno: String;VAR_Data : TDateTime) : TDateTime;
procedure PR_ExportarExecute(DataSet:TDataSet; Titulo:String);
function FN_ValidarDocumentos(Validador:TACBrValidador; nrDocumento:string;complemento:string;tipo:TACBrValTipoDocto):Boolean;
function FN_CriaDiretorios(Diretorio:String):Boolean;
function FN_Zeros(const strvalor: string;const intComprimento: integer): string;
function FN_RetornaPai(var N: TTreeNode): TTreeNode;
function IsValidEmail(const Value: string): Boolean;




Const

 MSG_SEM_REGISTRO        : PAnsiChar = 'Nenhum Registro Encontrado no filtro utilizado !';
 MSG_FUNCAO_NAO_HAB      : PAnsiChar = 'Rotina ainda não programada !';
 MSG_ERRO_GENERICO       : PAnsiChar = 'Atenção: Ocorreu um erro ao executar a ação.';
 MSG_GRAVADO_SUCESSO     : PAnsiChar = 'Registro Gravado com Sucesso!';
 MSG_CANC_ALTERACAO      : PAnsiChar = 'Todas as alterações foram desfeitas!';
 MSG_APAGADO_SUCESSO     : PAnsiChar = 'Registro Excluído com Sucesso!';
 MSG_CONF_EXCLUSAO       : PAnsiChar = 'Deseja Realmente Excluir esse Registro?';
 MSG_CONF_EXPORTACAO     : PAnsiChar = 'Deseja Realmente Exportar esse dados?';
 MSG_CONF_IMPORTACAO     : PAnsiChar = 'Deseja Realmente Importar esse dados?';
 MSG_CONF_FINAL_SISTEMA  : PAnsiChar = 'Deseja Realmente Finalizar a Aplicação?';
 MSG_SEM_INTERNET        : PAnsiChar = 'Verifique sua conexão de rede.'+#13#10+'Não há sinal de internet!!!';
 MSG_CAMPO_OBRIGATORIO   : PAnsiChar = 'Impossível : Campo Obrigatório não preenchido';
 MSG_NAO_CIDADE          : PAnsiChar = 'Cidade não encontrada!!!' +#13#10+ 'Proceda com a correção.';
 MSG_NAO_PAIS            : PAnsiChar = 'País não encontrado!!!' +#13#10+ 'Proceda com a correção.';
 MSG_NAO_CNAEF           : PAnsiChar = 'CNAEF não encontrado!!!' +#13#10+ 'Proceda com a correção.';
 MSG_CNPJ_INVALIDO       : PAnsiChar = 'Nº do CNPJ está inválido!!!'+#13#10+ 'Proceda com a correção.';
 MSG_CPF_INVALIDO        : PAnsiChar = 'Nº do CPF está inválido!!!'+#13#10+ 'Proceda com a correção.';
 MSG_INSC_EST_INVALIDO   : PAnsiChar = 'Nº da Inscrição Estadual está inválido!!!'+#13#10+ 'Proceda com a correção.';
 MSG_ERRO_AO_GRAVAR      : PAnsiChar = 'Erro ao tentar gravar o registro!!!';
 MSG_EDICAO_NAO_PERM     : PAnsiChar = 'Edição não permitida.'+#13#10+'Não há registros ou não foi selecionado.';
 MSG_EXCLUSAO_NAO_PERM   : PAnsiChar = 'Exclusão não permitida.'+#13#10+'Não há registros ou não foi selecionado.';
 MSG_USUARIO_NAO_ENCON   : PAnsiChar = 'Usuário não encontrado!!!'+#13#10+'Verifique os dados informados.';
 MSG_USUARIO_INATIVO     : PAnsiChar = 'Usuário se encontra inativo!!!'+#13#10+'Verifique com o administrador do sistema.';
 MSG_SAIR_SISTEMA        : PAnsiChar = 'Deseja finalizar o aplicativo ?';
 MSG_CONFIG_NAO_EXISTE_DB: PAnsiChar = 'As configurações do banco de dados não existe.'+#13#10+'Entre em contato com o Administrador do Sistema.';
 MSG_CONFIG_ERRO         : PAnsiChar = 'Erro nas configurações do banco de dados.'+#13#10+'Entre em contato com o Administrador do Sistema.';
 MSG_CONFIG_GRAVADAS     : PAnsiChar = 'Configurações gravadas com sucesso...';
 MSG_QUANT_TENT_LOGIN    : PAnsiChar = 'A quantidade de tentativas de login foram excedidas!!!' +#13#10+'O aplicativo será encerrado.';

 MSG_DADOS_IMPORT_SUCESS : PAnsiChar = 'Fim do processo de importação de dados.';
 MSG_DADOS_IMPORT_ERRO   : PAnsiChar = 'Selecione o arquivo a ser importado.';
 MSG_CAPTCHA_NAO_INFOR   : PAnsiChar = 'Informe o captcha, para efetuar a consulta dos dados!!!';
 MSG_CAPTCHA_ERRO        : PAnsiChar = 'O captcha informado é inválido!!!';
 MSG_CNPJ_CPF_NAO_INFOR  : PAnsiChar = 'Informe o número do CNPJ ou CPF, para efetuar a consulta dos dados!!!';
 MSG_CNPJ_CPF_INVALIDO   : PAnsiChar = 'Número de documento informado é inválido, para efetuar a consulta dos dados!!!';

 MSG_ERRO_COMANDO_SQL    : PAnsiChar = 'Erro ao executar comando SQL.';

  //------------------------------------------------------------------------------
  // Mensagens registros existentes
  //------------------------------------------------------------------------------

 MSG_PAIS_EXISTE         : PAnsiChar = 'Esse Código do País já existe!!!';
 MSG_ESTADO_EXISTE       : PAnsiChar = 'Esse Código do Estado já existe!!!';
 MSG_CIDADE_EXISTE       : PAnsiChar = 'Esse Código de Cidade já existe!!!';


 implementation


Const
  //------------------------------------------------------------------------------
  // Mensagens de Confirmação/Decisao do kernel
  //------------------------------------------------------------------------------



  Kernel_Aviso_RegistrosVinculados : string = 'Exclusão Impossível. '+ #13 +
                      ' Motivo : Existe Registros Cadastrados com estas Informações.';
  Kernel_Aviso_Exclusao_RegistroPadrao : string = 'Exclusão Impossivel. '+ #13 +
                           ' Motivo: Registro Padrão do Banco de Dados';
  Kernel_Aviso_Alteracao_RegistroPadrao : string = 'Alteração Impossivel. '+ #13 +
                           ' Motivo: Registro Padrão do Banco de Dados';

  //==============================================================================
  // Mensagens do Empresa de SoftHouse
  //==============================================================================
function FN_CriaDiretorios(Diretorio:String):Boolean;
begin
try
if not DirectoryExists(Diretorio) then
  begin
      forceDirectories(Diretorio);
      Result:=True;
  end;
except
Result:=False;
end;
end;

function FN_VerificaInternet: boolean;
var
  Flags : Cardinal;
begin
  if not InternetGetConnectedState(@Flags, 0) then
    Result:=false
  else
    Result:=True;
end;


function FN_CamposObrigatorios(DataSet: TDataSet): Boolean;
var
  i: integer;
begin
  { verifica quais os campos que estão em branco no cadastro }
  Result := True;
  for i := 0 to DataSet.FieldCount - 1 do
  begin
    if DataSet.Fields[i].Required then
      if (DataSet.Fields[i].IsNull) or (DataSet.Fields[i].AsString = '') then
      begin
        MessageDlg('Campo: "' + DataSet.Fields[i].DisplayLabel +'" está vazio!'+#13#10+MSG_CAMPO_OBRIGATORIO, mtInformation, [mbOk], 0);
        Result := False;
        DataSet.Fields[i].FocusControl;
        break;
      end;
  end;
end;

{ Abre formularios }
procedure PR_AbreForm(aClasseForm: TComponentClass; aForm: TForm);
begin
  Application.CreateForm(aClasseForm, aForm);
  try
    aForm.ShowModal;
  finally
    aForm.Free;
  end;
end;

{ Remove os espaços em branco à direita da string }
function FN_RTrim(Texto: string): string;
var
  i: integer;
begin
  i := Length(Texto) + 1;
  while True do
  begin
    Dec(i);
    if i <= 0 then
      break;
    if Texto[i] <> #32 then
      break;
  end;
  Result := Copy(Texto, 1, i);
end;

{ Remove os espaços em branco à direita da string }
function FN_LTrim(Texto: string): string;
var
  i: integer;
begin
  i := 0;
  while True do
  begin
    inc(i);
    if i > Length(Texto) then
      break;
    if Texto[i] <> #32 then
      break;
  end;
  Result := Copy(Texto, i, Length(Texto));
end;

{ Valida uma data }
function FN_DateValidate(const aData: string): Boolean;
begin
  try
    StrToDate(aData);
    Result := True;
  except
    Result := False;
  end;
end;

{ Remove caracter passado como parâmetro }
function FN_RemoveChar(const Ch: Char; const S: string): string;
var
  Posicao: integer;
begin
  Result := S;
  Posicao := Pos(Ch, Result);
  while Posicao > 0 do
  begin
    Delete(Result, Posicao, 1);
    Posicao := Pos(Ch, Result);
  end;
end;

{ Remove acentos da string passada como parâmetro }
function FN_RemoveAcento(Str: string): string;
const
  ComAcento = 'àâêôûãõáéíóúçüÀÂÊÔÛÃÕÁÉÍÓÚÇÜ';
  SemAcento = 'aaeouaoaeioucuAAEOUAOAEIOUCU';
var
  x: integer;
begin
  for x := 1 to Length(Str) do
    if Pos(Str[x], ComAcento) <> 0 then
      Str[x] := SemAcento[Pos(Str[x], ComAcento)];
  Result := Str;
end;

{ Pesquisa um caractere na string, retornando se achou }
function FN_BuscaTexto(Busca, Text: string): Boolean;
begin
  Result := (Pos(Busca, Text) > 0);
end;

{ Gera caracteres aleatórios para senha }
function FN_GeraSenha(aQuant: integer): string;
var
  i: integer;
const
  Str = '1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
begin
  for i := 1 to aQuant do
  begin
    Randomize;
    Result := Result + Str[Random(Length(Str)) + 1];
  end;
end;

{ Limpa a tela }
procedure PR_LimparTela(Formulario: TForm; LimpaImagem:Boolean);
var
  i: integer;
begin
  for i := 0 to Formulario.ComponentCount - 1 do
  begin
    if Formulario.Components[i] is TEdit then
      (Formulario.Components[i] as TEdit).Clear;
    if Formulario.Components[i] is TMemo then
      (Formulario.Components[i] as TMemo).Clear;
    if Formulario.Components[i] is TMaskEdit then
      (Formulario.Components[i] as TMaskEdit).Clear;
    if LimpaImagem = true then
      begin
        if Formulario.Components[i] is TImage then
          (Formulario.Components[i] as TImage).Picture:=nil;
      end;
    if Formulario.Components[i] is TJvDateEdit then
      (Formulario.Components[i] as TJvDateEdit).Clear;
    if Formulario.Components[i] is TComboBox then
      (Formulario.Components[i] as TComboBox).ItemIndex:=0;
    if Formulario.Components[i] is TButtonedEdit then
      (Formulario.Components[i] as TButtonedEdit).Clear;


  end;
end;

{ Insere zeros }
function FN_StrZero(const strvalor: string;
  const intComprimento: integer): string;
var
  strZeros, strRetorno: string;
  intTamanho, intContador: integer;
begin
  intTamanho := Length(Trim(strvalor));
  strZeros := ' ';
  for intContador := 1 to intComprimento do
    strZeros := strZeros + '0';
  strRetorno := Copy(Trim(strZeros) + Trim(strvalor), intTamanho + 1,
    intComprimento);
  Result := strRetorno;
end;

{ Nome do usuario logado }
function FN_GetNetUserName: string;
Var
  NetUserNameLength: DWord;
Begin
  NetUserNameLength := 50;
  SetLength(Result, NetUserNameLength);
  GetUserName(pChar(Result), NetUserNameLength);
  SetLength(Result, StrLen(pChar(Result)));
End;

{ formata cpf }
function FN_FormataCPF(CPF: string): string;
begin
  Result := Copy(CPF, 1, 3) + '.' + Copy(CPF, 4, 3) + '.' + Copy(CPF, 7, 3) +
    '-' + Copy(CPF, 10, 2);
end;

{ formata cnpj }
Function FN_Formatacnpj(cnpj: string): string;
begin
  Result := Copy(cnpj, 1, 2) + '.' + Copy(cnpj, 3, 3) + '.' + Copy(cnpj, 6, 3) +
    '/' + Copy(cnpj, 9, 4) + '-' + Copy(cnpj, 13, 2);
end;

{ formata cep }
function FN_FormataCEP(Texto: String): String;
var
  TamanhoStr: integer;
  TamanhoRet: integer;
begin
  Texto := Trim(Texto);
  TamanhoStr := Length(Texto);
  if TamanhoStr < 8 then
    for TamanhoRet := 1 to 8 - TamanhoStr do
      Texto := '0' + Texto;
  FN_FormataCEP := Copy(Texto, 1, 2) + '.' + Copy(Texto, 3, 3) + '-' +
    Copy(Texto, 6, 3);
end;

{ Valor por Extenso }
function FN_ValorPorExtenso(vlr: real): string;
const
  unidade: array [1 .. 19] of string = ('um', 'dois', 'três', 'quatro', 'cinco',
    'seis', 'sete', 'oito', 'nove', 'dez', 'onze', 'doze', 'treze', 'quatorze',
    'quinze', 'dezesseis', 'dezessete', 'dezoito', 'dezenove');
  centena: array [1 .. 9] of string = ('cento', 'duzentos', 'trezentos',
    'quatrocentos', 'quinhentos', 'seiscentos', 'setecentos', 'oitocentos', 'novecentos');
  dezena: array [2 .. 9] of string = ('vinte', 'trinta', 'quarenta', 'cinquenta', 'sessenta', 'setenta', 'oitenta', 'noventa');
  qualificaS: array [0 .. 4] of string = ('', 'mil', 'milhão', 'bilhão', 'trilhão');
  qualificaP: array [0 .. 4] of string = ('', 'mil', 'milhões', 'bilhões', 'trilhões');
var
  inteiro: Int64;
  resto: real;
  vlrS, S, saux, vlrP, centavos: string;
  n, unid, dez, cent, tam, i: integer;
  umReal, tem: Boolean;
begin
  if (vlr = 0) then
  begin
    FN_ValorPorExtenso := 'zero';
    exit;
  end;
  inteiro := trunc(vlr);
  resto := vlr - inteiro;
  vlrS := inttostr(inteiro);
  if (Length(vlrS) > 15) then
  begin
    FN_ValorPorExtenso := 'Erro: valor superior a 999 trilhões.';
    exit;
  end;
  S := '';
  centavos := inttostr(round(resto * 100));
  i := 0;
  umReal := False;
  tem := False;
  while (vlrS <> '0') do
  begin
    tam := Length(vlrS);
    if (tam > 3) then
    begin
      vlrP := Copy(vlrS, tam - 2, tam);
      vlrS := Copy(vlrS, 1, tam - 3);
    end
    else
    begin
      vlrP := vlrS;
      vlrS := '0';
    end;
    if (vlrP <> '000') then
    begin
      saux := '';
      if (vlrP = '100') then
        saux := 'cem'
      else
      begin
        n := strtoint(vlrP);
        cent := n div 100;
        dez := (n mod 100) div 10;
        unid := (n mod 100) mod 10;
        if (cent <> 0) then
          saux := centena[cent];
        if ((dez <> 0) or (unid <> 0)) then
        begin
          if ((n mod 100) <= 19) then
          begin
            if (Length(saux) <> 0) then
              saux := saux + ' e ' + unidade[n mod 100]
            else
              saux := unidade[n mod 100];
          end
          else
          begin
            if (Length(saux) <> 0) then
              saux := saux + ' e ' + dezena[dez]
            else
              saux := dezena[dez];
            if (unid <> 0) then
              if (Length(saux) <> 0) then
                saux := saux + ' e ' + unidade[unid]
              else
                saux := unidade[unid];
          end;
        end;
      end;
      if ((vlrP = '1') or (vlrP = '001')) then
      begin
        if (i = 0) then
          umReal := True
        else
          saux := saux + ' ' + qualificaS[i];
      end
      else if (i <> 0) then
        saux := saux + ' ' + qualificaP[i];
      if (Length(S) <> 0) then
        S := saux + ', ' + S
      else
        S := saux;
    end;
    if (((i = 0) or (i = 1)) and (Length(S) <> 0)) then
      tem := True;
    i := i + 1;
  end;
  if (Length(S) <> 0) then
  begin
    if (umReal) then
      S := S + ' real'
    else if (tem) then
      S := S + ' reais'
    else
      S := S + ' de reais';
  end;
  if (centavos <> '0') then
  begin
    if (Length(S) <> 0) then
      S := S + ' e ';
    if (centavos = '1') then
      S := S + 'um centavo'
    else
    begin
      n := strtoint(centavos);
      if (n <= 19) then
        S := S + unidade[n]
      else
      begin
        unid := n mod 10;
        dez := n div 10;
        S := S + dezena[dez];
        if (unid <> 0) then
          S := S + ' e ' + unidade[unid];
      end;
      S := S + ' centavos';
    end;
  end;
  FN_ValorPorExtenso := S;
end;

{ Delete arquivo Recursivo }
function FN_DeleteRecursivo(FullPath: string): Boolean;
var
  sr: TSearchRec;
  FullName: string;
begin
  Result := True;
  if (FindFirst(FullPath + '\*.*', faAnyFile, sr) = 0) then
    try
      repeat
        FullName := IncludeTrailingPathDelimiter(FullPath) + sr.Name;
        if (sr.Name <> '.') and (sr.Name <> '..') then
        begin
          if ((sr.Attr and faDirectory) = 0) then
            Result := DeleteFile(FullName)
          else
            Result := FN_DeleteRecursivo(FullName);
        end;
      until (FindNext(sr) <> 0) or not Result;
    finally
      FindClose(sr);
    end;
  Result := Result and DirectoryExists(FullPath) and RemoveDir(FullPath);
end;

{ Download de arquivos }
function FN_DownloadFile(SourceFile, DestFile: string): Boolean;
begin
  try
    Result := UrlDownloadToFile(nil, pChar(SourceFile), pChar(DestFile),
      0, nil) = 0;
  except
    Result := False;
  end;
end;


{ Retira a formatação }
function FN_RetiraFormatacao(Texto:string):string;
begin
  Result := StringReplace(StringReplace(StringReplace(Texto,'.','',[rfReplaceAll]),'-','',[rfReplaceAll]),'/','',[rfReplaceAll]);
end;

{ Pega a versão do Sistema }
function FN_VersaoSistema: string;
var
  VerInfoSize: DWORD;
  VerInfo: Pointer;
  VerValueSize: DWORD;
  VerValue: PVSFixedFileInfo;
  Dummy: DWORD;
begin
  VerInfoSize := GetFileVersionInfoSize(PChar(ParamStr(0)), Dummy);
  GetMem(VerInfo, VerInfoSize);
  GetFileVersionInfo(PChar(ParamStr(0)), 0,VerInfoSize, VerInfo);
  VerQueryValue(VerInfo, '\', Pointer(VerValue),VerValueSize);
  with VerValue^ do
  begin
    Result := IntToStr(dwFileVersionMS shr 16);
    Result := Result + '.' + IntToStr(dwFileVersionMS and $FFFF);
    Result := Result + '.' + IntToStr(dwFileVersionLS shr 16);
    Result := Result + '.' + IntToStr(dwFileVersionLS and $FFFF);
  end;
  FreeMem(VerInfo, VerInfoSize);
end;

{ Desabilita os Campos Selecionados }
procedure PR_DesabilitarCampos(DataSet:TDataSet; Campo: TComponent);
begin
  if DataSet.State = dsEdit then
    TDBEdit(Campo).Enabled := False
  else if DataSet.State = dsInsert then
    TDBEdit(Campo).Enabled := True;
end;

{ Grava INI de Conexão }
procedure PR_GravaIni(tipoConexao:string; servidor:string; porta:string; gravarUsuario:Boolean; bancoDados:string);
var
  Ini:TIniFile;
begin
Ini:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'Config.ini');
Ini.WriteString('Servidor','TipoConexao',tipoConexao);
Ini.WriteString('Servidor','Endereco', Servidor);
Ini.WriteString('Servidor','Porta', Porta);
Ini.WriteBool('Servidor','LembraUsuario', GravarUsuario);
Ini.WriteString('Servidor','BancoDados', BancoDados);
Ini.Free;
MessageDlg(MSG_CONFIG_GRAVADAS, mtInformation, [mbOK],0);
end;

{ Importação de Dados }
function FN_ImportacaoArquivo(texto:string; separador:string; posicao:Integer):string;
var
aux:string;
i, contador:Integer;
begin
aux:='';
Result:='';
contador:=0;
for I := 1 to Length(texto) do
  begin
    if Copy(texto, i,1) <> separador then
      begin
        aux:=aux + Copy(texto, i, 1)
      end
    else
      begin
        contador:=contador + 1;
        if contador = posicao then
          Break
        else
          aux:='';
      end;
  end;
Result:=aux;
end;

{ Verifica se é Dia util }
function FN_DiaUtil(Avanco_Retorno: String;VAR_Data : TDateTime) : TDateTime;
begin
if Avanco_Retorno = 'A' then
  begin
    if DayOfWeek(VAR_Data) = 7 then
       begin
         VAR_Data:=VAR_Data + 2
       end
    else if DayOfWeek(VAR_Data) = 1 then
      begin
        VAR_Data:=VAR_Data + 1 ;
      end;
  end
else if Avanco_Retorno = 'R' then
  begin
    if DayOfWeek(VAR_Data) = 7 then
       begin
         VAR_Data:=VAR_Data -1
       end
    else if DayOfWeek(VAR_Data) = 1 then
      begin
        VAR_Data:=VAR_Data - 2 ;
      end;
  end;
Result:=VAR_Data;
end;

{ Exportar para o Excel }
procedure PR_ExportarExecute(DataSet:TDataSet; Titulo:String);
var
  ObjXLS: Variant;
  Linha,i: Integer;
begin
  DataSet.Filtered := False;
  Linha := 2;
  ObjXLS := CreateOleObject('Excel.Application');
  ObjXLS.Caption := Titulo;
  ObjXLS.Visible := False;
  ObjXLS.WorkBooks.add(1);
  //ObjXLS.WorkBooks[1].Sheets[1].Delete;
 // ObjXLS.WorkBooks[1].Sheets[2].Delete;
  for i:=0 to DataSet.FieldCount-1 do
    begin
      ObjXLS.cells[1, i+1].font.name := 'Courier New';
      ObjXLS.cells[1, i+1].font.bold := true;
      ObjXLS.cells[1, i+1].font.size := 9;
      ObjXLS.Cells[1, i+1] := DataSet.Fields[i].DisplayLabel;
    end;
  DataSet.DisableControls;
  try
    while not DataSet.Eof do
    begin
      for i:=0 to DataSet.FieldCount-1 do
        begin
          ObjXLS.cells[linha, i+1].font.name := 'Courier New';
          ObjXLS.cells[linha, i+1].font.size := 9;
          ObjXLS.Cells[linha, i+1] := DataSet.Fields[i].AsString;
	    //Para formatar a Célula
	    //ObjXLS.Cells[i,4].NumberFormat := 'R$ #.##0,00_);(R$ #.##0,00)';
        end;
      Linha := Linha + 1;
      DataSet.Next;
    end;
    ObjXLS.Columns.AutoFit;
    ObjXLS.Visible := True;
    MessageDlg ('Exportação Concluída com Sucesso!'+#13#10+'Foram gerados '+IntToStr(DataSet.RecordCount)+' registros.' ,mtInformation,[mbOK],0);
  finally
    DataSet.EnableControls;
    ObjXLS := Unassigned;
  end;
end;

procedure PR_Sair;
begin
if MessageDlg(MSG_SAIR_SISTEMA, mtConfirmation, [mbYes,mbNo],0)=IDYES  then
  begin
    Application.Terminate;
  end
else Abort;
end;

{ Validação de documentos }
function FN_ValidarDocumentos(Validador:TACBrValidador; nrDocumento:string;complemento:string;tipo:TACBrValTipoDocto):Boolean;
begin
if tipo = docCPF then
  begin
    with Validador do
      begin
        Documento:= nrDocumento;
        Validador.TipoDocto:= tipo;
        Complemento:= '';
        if Validador.Validar = false then
          begin
            MessageDlg(MSG_CPF_INVALIDO, mtInformation, [mbOK],0);
            Result:=false;
          end
        else
          begin
            Result:=True;
          end;
      end;
  end
else if tipo = docCNPJ then
  begin
    with Validador do
      begin
        Documento:=nrDocumento;
        Complemento:='';
        Validador.TipoDocto:=tipo;
        if Validador.Validar = false then
          begin
            MessageDlg(MSG_CNPJ_INVALIDO, mtInformation, [mbOK],0);
            Result:=false
          end
        else
          begin
            Result:=True;
          end;
      end;
  end
else if tipo = docInscEst then
  begin
    with Validador do
      begin
        Documento:=nrDocumento;
        Complemento:=complemento;
        Validador.TipoDocto:=tipo;
        if Validador.Validar = false then
          begin
            MessageDlg(MSG_INSC_EST_INVALIDO, mtInformation, [mbOK],0);
            Result:=false
          end
        else
          begin
            Result:=True;
          end
      end;
  end
end;

function FN_Zeros(const strvalor: string;const intComprimento: integer): string;
var
  strZeros, strRetorno: string;
  intTamanho, intContador: integer;
begin
inttamanho:= Length(Trim(strValor));
strZeros:= ' ';
  for intContador:= 1 to intComprimento do
    strZeros:= strZeros + '0';
strRetorno:= Copy(Trim(strZeros)+Trim(strValor),intTamanho+1,intComprimento);
Result:= strRetorno;
end;

function FN_RetornaPai(var N: TTreeNode): TTreeNode;
begin
  while True do
  begin
    if N.GetPrev <> nil then
      N := N.GetPrev
    else
      Break;
  end;
  Result := N;
end;

function IsValidEmail(const Value: string): Boolean;
  function CheckAllowed(const s: string): Boolean;
  var
    i: Integer;
  begin
    Result := False;
    for i := 1 to Length(s) do
      if not(s[i] in ['a' .. 'z', 'A' .. 'Z', '0' .. '9', '_', '-', '.']) then
        Exit;
    Result := true;
  end;
var
  i: Integer;
  NamePart, ServerPart: string;
begin
  Result := False;
  i := Pos('@', Value);
  if i = 0 then
    Exit;
  NamePart := Copy(Value, 1, i - 1);
  ServerPart := Copy(Value, i + 1, Length(Value));
  if (Length(NamePart) = 0) or ((Length(ServerPart) < 5)) then
    Exit;
  i := Pos('.', ServerPart);
  if (i = 0) or (i > (Length(ServerPart) - 2)) then
    Exit;
  Result := CheckAllowed(NamePart) and CheckAllowed(ServerPart);
end;



end.



