program sample3;

{$APPTYPE CONSOLE}

uses
  variants,
  SysUtils,
  uLkJSON in 'uLkJSON.pas';

var
  js,xs:TlkJSONobject;
  ws: TlkJSONstring;
  s,s2: String;
begin
  s := '{"string1":"123","\"string2\"":"two",'+
    '"childobject":{"objstr1":"Oone","objstr2":"Otwo"}}';
  js := TlkJSON.ParseText(s) as TlkJSONobject;

  s2 := vartostr(js.Field['"string2"'].Value);
  writeln(s2);

  readln;
  js.Free;  
end.
