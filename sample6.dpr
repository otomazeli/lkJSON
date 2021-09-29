program sample6;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  windows,
  classes,
  uLkJSON in 'uLkJSON.pas';

var
  vJsonObj: TlkJsonObject;
  vJsonStr,str,si: String;
  vJsonArr:TlkJsonlist;
  js,jo,o,s,x:TlkJSONobject;
  ws: TlkJSONstring;
  i: Integer;
begin
  js := TlkJSONobject.Create;
  jo := TlkJSONobject.Create;
  jo.Add('item1','value 1');
  jo.Add('item2', '[3,4,5]');
  jo.Add('item3','value 3');

  js.Add('desc','And now for something completelly different');
  js.Add('c',jo);
  o := TlkJSONobject.Create;
  o.Add('name','Odimar Tomazeli');
  o.Add('address','1225 Pellerin');
  s := TlkJSONobject.Create;
  s.add('id',1);
  s.add('desc','test');
  s.add('isOld',true);
  s.add('today',now);
  s.add('birthdate','2019-12-10T13:49:51.141Z');
  s.add('total',336.36);

  o.Add('mystats',s);
 // s.free;
  js.add('myObj',o);

  vJsonArr := TlkJsonList.Create;
  for i:=0 to 5 do begin
    x := TlkJsonObject.Create();
    x.Add('id',i);
    x.Add('name','Name '+IntToStr(i));
    x.Add('address','Address '+IntToStr(i));
    x.Add('phone','575-'+IntToStr(i)+'56'+IntToStr(i));
    vJsonArr.Add(x)
  end;

  js.Add('arrayOfObjs',vJsonArr);

  vJsonArr := TlkJsonList.Create;
  vJsonArr.Add(1);
  vJsonArr.Add(1.5);
  vJsonArr.Add(2);
  vJsonArr.Add('Odimar');
  vJsonArr.Add(False);

  js.Add('arrayOf',vJsonArr);

  str := TlkJSON.GenerateText(js);

  TlkJSONstreamed.SaveToFile(js as TlkJsonObject,'source2.json');
// get the text of object
//  s := TlkJSON.GenerateText(js);
//  writeln(s);
//  writeln;
//  writeln('more readable variant:');
// (ver 1.03+) generate readable text
//  i := 0;
//  s := GenerateReadableText(js,i);
//  writeln(s);

  o.free;
  //s.Free;
  jo.free;
  //js.Free;




  vJsonObj := TlkJSONstreamed.loadfromfile('source2.json') as TlkJsonObject;

// restore object (parse text)
//  js := TlkJSON.ParseText(s) as TlkJSONobject;
// and get string back
// old syntax
//  ws := js.Field['namestring'] as TlkJSONstring;
//  s := ws.Value;
//  writeln(s);
// syntax of 0.99+
//  s := js.getString('namestring');
//  writeln(s);

  jo := vJsonObj.Field['myObj'] as TlkJsonObject;
  o := jo.Field['mystats'] as TlkJsonObject;
  ws := o.Field['birthdate'] as TlkJSONstring;
  si := ws.Value;
  writeln(si);
  ws := vJsonObj.Field['myObj'].Field['mystats'].Field['birthdate'] as TlkJSONstring;
  str := ws.Value;
  writeln(str);
  readln;
  js.Free;
  vJsonStr := TlkJSON.GenerateText(vJsonObj);
  writeln(vJsonStr);
  readln;
  vJsonObj.Free;
end.

