program sample5;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  windows,
  classes,
  uLkJSON in 'uLkJSON.pas';

var
  vJsonObj: TlkJsonObject;
  vJsonStr: String;
begin
  vJsonObj := TlkJSONstreamed.loadfromfile('source.txt') as TlkJsonObject;
  vJsonStr := TlkJSON.GenerateText(vJsonObj);
  writeln(vJsonStr);
  readln;
  vJsonObj.Free;
end.

