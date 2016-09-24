{
������ ������������ ���������� ����������
}
unit EsConsole;

interface

implementation

uses
  Windows;

{
�������� ��������� ��������� ����� � ������������ ����� �
�� ���������� SysUtils �, ��������������, ��� �������������
����� ������. ���������� ���������� ������ ���� � 25� ����
��������� ���������� � ��������� ������� ����� �� ��������
������������ ���������.
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
  Rewrite(Output); // �������� ������������� �����
  { � ��������� �����������. ���� � ���� ���-�� ��
  ����, �� ���� ����������� �������� }
  TTextRec(Output).InOutFunc := @ConOutFunc;
  TTextRec(Output).FlushFunc := @ConOutFunc;
end.
