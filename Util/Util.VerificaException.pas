unit Util.VerificaException;

interface

uses
   Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
   System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
   Vcl.ExtCtrls, Vcl.StdCtrls, DB, FireDAC.Phys.MSSQL;

type
   TVerificaException = class
   public
      class function TrataExcception(E:Exception): boolean;

      class procedure setLineErro(Value: Integer);
      class procedure setFileErro(Value: string);

      class function getLineErro: Integer;
      class function getFileErro: string;

      class procedure SalvarLog(E:Exception);
   end;

implementation

{ TMyExcessoes }

var FcFileErro: string;
    FcLineErro: Integer;

//--------- Aqui ficam os retornos das exceções geradas por mim --------------------------------

class function TVerificaException.TrataExcception(E: Exception):boolean;
begin
//   if E is EDatabaseError then begin
//      result:= True;
//      Application.MessageBox('Ocorreu um erro de conexão ao banco de dados' +
//        #13#10 + 'Por favor, entre em contato com o suporte para solucionar o problema.' +
//        #13#10 + 'Mensagem: '+ AnsiChar( E.Message)  +
//        #13#10 + 'Classe: ' + AnsiChar(E.ClassName),
//        'Atenção', MB_OK + MB_ICONWARNING);
//   else
   if E is EMSSQLNativeException then
     begin
       Result:= True;
       Application.MessageBox('Erro ao consultar os dados no sistema.' +
         #13#10 + 'Informe ao administrador do sistema.', 'Atenção', MB_OK +
         MB_ICONWARNING);
     end
   else

   if E is EAccessViolation then
     begin
       Result:= True;
       Application.MessageBox('O sistema está tentando acessar um objeto que não foi criado.' +
         #13#10 + 'Informe ao administrador do sistema.', 'Atenção', MB_OK +
         MB_ICONWARNING);
     end
   else

   if E is EZeroDivide then begin
      result:= True;
      Application.MessageBox('O sistema está tentando executar uma divisão por zero.' +
         #13#10 + 'Verifique parametros.', 'Atenção', MB_OK +
         MB_ICONWARNING);
   end
   else begin
      result:= False;
   end;
end;

//--------- Aqui terminam os retornos das exceções geradas por mim --------------------------------

class function TVerificaException.getFileErro: string;
begin
   result:= FcFileErro;
end;

class function TVerificaException.getLineErro: Integer;
begin
   result:= FcLineErro;
end;

class procedure TVerificaException.setFileErro(Value: string);
begin
   FcFileErro:= Value;
end;

class procedure TVerificaException.setLineErro(Value: Integer);
begin
   FcLineErro:= Value;
end;

//salva no disco os arquivos de log conforme pegue erros não tratados pelo programador...
class procedure TVerificaException.SalvarLog(E: Exception);
var
   ListaErro: TStringList;
   LocalDir, LocalFile: string;
begin
   LocalDir:= ExtractFilePath(Application.ExeName) + 'log';
   if not DirectoryExists(LocalDir) then
      CreateDir(LocalDir);
   //pega o arquivo pela data do dia
   LocalFile:= LocalDir + '\' + FormatDateTime('yyyy-mm-dd', Now) + '-erro.txt';
   //Inicializa a lista
   ListaErro:= TStringList.Create;
   try
      if FileExists(LocalFile) then
         ListaErro.LoadFromFile(LocalFile);

      //adiciona na lista os novos erros
      ListaErro.Add('--------------------------------------------------');
      ListaErro.Add('Data: ' + DateToStr(Date));
      ListaErro.Add('Hora: ' + TimeToStr(now));
      ListaErro.Add('Erro: ' + E.Message);
      ListaErro.Add('Classe: ' + E.ClassName);
      ListaErro.Add('Linha: ' + IntToStr(FcLineErro));
      ListaErro.Add('Arquivo: ' + FcFileErro);
      ListaErro.SaveToFile(LocalFile);
   finally
      ListaErro.Free;
   end;
end;

end.
