{
Модуль “русификации“ консольных приложений
}
unit EsConsole;

interface

implementation

uses
  Windows;

{
Описание структуры приведено здесь с единственной целью –
не подключать SysUtils и, соответственно, код инициализации
этого модуля. Консольные приложения обычно малы и 25К кода
обработки исключений – несколько высокая плата за описание
единственной структуры.
}
type
  TTextRec = record
    Handle: Integer;
    Mode: Integer;
    BufSize: Cardinal;
    BufPos: Cardinal;
    BufEnd: Cardinal;
    BufPtr: PChar;
    OpenFunc: Pointer;
    InOutFunc: Pointer;
    FlushFunc: Pointer;
    CloseFunc: Pointer;
    UserData: array[1..32] of Byte;
    name: array[0..259] of Char;
    Buffer: array[0..127] of Char;
end;

function ConOutFunc(var Text: TTextRec): Integer;
var
  Dummy: Cardinal;
  SavePos: Integer;
begin
  SavePos := Text.BufPos;
  if SavePos > 0 then
  begin
    Text.BufPos := 0;
    CharToOemBuff(Text.BufPtr, Text.BufPtr, SavePos);
    if WriteFile(Text.Handle, Text.BufPtr^, SavePos, Dummy, nil) then
      Result := 0
    else
      Result := GetLastError;
  end
  else
    Result := 0;
end;

initialization
  Rewrite(Output); // Проводим инициализацию файла
  { И подменяем обработчики. Есть в этом что-то от
  хака, но цель оправдывает средства }
  TTextRec(Output).InOutFunc := @ConOutFunc;
  TTextRec(Output).FlushFunc := @ConOutFunc;
end.
