// i improve test for version 0.94 - add random part to names of fields;
// it smaller decrease speed of generation, but much better for testing
//
// Leon, 27/03/2007

{.$define usefastmm}

program test;

{$APPTYPE CONSOLE}

uses
{$ifdef usefastmm}
  fastmm4,
{$endif}
  windows,
  SysUtils,
  uLkJSON in 'uLkJSON.pas';

var
  js:TlkJSONobject;
  xs:TlkJSONbase;
  i,j,k,l: Integer;
  ws: String;
begin
{$ifdef USE_D2009}
  ReportMemoryLeaksOnShutdown := True;
{$endif}
  Randomize;
  js := TlkJSONobject.Create(true);
//  js.HashTable.HashOf := js.HashTable.SimpleHashOf;
  k := GetTickCount;
// syntax of adding changed to version 0.95+
  for i := 0 to 50000 do
    begin
      l := random(9999999);
      ws := 'param'+inttostr(l);
      js.add(ws,ws);
      ws := 'int'+inttostr(l);
      js.add(ws,i);
    end;
  k := GetTickCount-k;
  writeln('records inserted:',js.count);
  writeln('time for insert:',k);
  writeln('hash table counters:');
  writeln(js.hashtable.counters);

  k := GetTickCount;
  ws := TlkJSON.GenerateText(js);
  writeln('text length:',length(ws));
  k := GetTickCount-k;
// free the object
  writeln('release memory...');
  js.Free;
//  js.Free;

  writeln('time for gentext:',k);

  k := GetTickCount;
  xs := TlkJSON.ParseText(ws);

  k := GetTickCount-k;
  writeln('time for parse:',k);
  writeln('approx speed of parse (th.bytes/sec):',length(ws) div k);
  writeln('press enter...');
  readln;
  writeln(ws);
  writeln('press enter...');
  readln;
// works in 0.94+ only!
  js := TlkJSONobject(xs);
  for i := 1 to 10 do
    begin
      writeln('field ',i,' is ',js.NameOf[i]);
      writeln('type of field ',i,' is ',js.FieldByIndex[i].SelfTypeName);
      writeln('value of field ',i,' is ',js.FieldByIndex[i].Value);
      writeln;
    end;
  writeln('release memory...');
  if assigned(xs) then FreeAndNil(xs);
//  js.Free;
//}
  writeln('press enter...');
  ws := '';
  readln;
end.
