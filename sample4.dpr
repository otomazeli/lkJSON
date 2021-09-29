program sample4;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  uLkJSON in 'uLkJSON.pas';

var
  jso: TlkJSONobject;
  s:string;
begin
  jso := TlkJSON.ParseText('{"t5":"\\"}') as TlkJSONobject;
  s := TlkJSON.GenerateText(jso);
  writeln(s);
  writeln;
  readln;
  jso.Free;
end.
