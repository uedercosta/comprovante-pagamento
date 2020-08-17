unit Util.UAssertionErro;

interface

implementation

uses Winapi.Windows, System.SysUtils, Util.VerificaException;

procedure AssertErrorHandler(const Message, Filename: string; LineNumber: Integer; ErrorAddr: Pointer);
var
   LocalUnit: string;
begin
   //pega o nome da UNIT.
   LocalUnit:= ExtractFileName(Filename);
   //captura os dados de classe e linha
   TVerificaException.setLineErro(LineNumber);
   TVerificaException.setFileErro(LocalUnit);
end;

initialization
   AssertErrorProc := @AssertErrorHandler;

end.
