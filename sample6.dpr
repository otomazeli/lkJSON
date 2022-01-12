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
  ws,v1: TlkJSONstring;
  b1:TlkJsonbase;
  i: Integer;
  dt,di:TDateTime;
  sl:TStringList;
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
  s.add('today',TlkJsonDateTime.Generate(now));
  s.add('birthdate','2019-12-10T13:49:51.141Z');
  s.add('total',TlkJSONnumber.Generate(336.36));

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
  vJsonArr.Add(TlkJSONnumber.Generate(1.5));
  vJsonArr.Add(2);
  vJsonArr.Add('Odimar');
  vJsonArr.Add(False);

  js.Add('arrayOf',vJsonArr);

  sl := TStringList.Create;
  sl.Values['@Value1'] := 'Test1';
  sl.Values['@Value2'] := 'Test2';
  sl.Values['@Value3'] := 'Test3';
  js.Add('stringList', TLkJsonList.Generate(sl));
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

  writeln(IntToStr(vJsonObj.getObject('c').Count));
  writeln(TLkJsonObject(vJsonObj.getObject('c')).Key[0]);
  writeln(TLkJsonObject(vJsonObj.getObject('c')).getString(0));
  writeln(TLkJsonObject(vJsonObj.getObject('c')).getString(TLkJsonObject(vJsonObj.getObject('c')).Key[0]));
  writeln(TLkJsonObject(vJsonObj.getObject('c')).Key[1]);
  writeln(TLkJsonObject(vJsonObj.getObject('c')).getString(1));
  writeln(TLkJsonObject(vJsonObj.getObject('c')).Key[2]);
  writeln(TLkJsonObject(vJsonObj.getObject('c')).getString(2));

  vJsonArr := vJsonObj.Field['stringList'] as TlkJsonList;
  str := TlkJson.GenerateText(vJsonArr);

  vJsonArr := TlkJsonList(vJsonObj.getList('stringList'));
  str := TlkJson.GenerateText(vJsonArr);
//  b1 := TlkJsonList(vJsonObj.getList('stringList')).get('@Value1') ;
  str := vJsonObj.getList('stringList').getString('@Value1');

  str := vJsonObj.getList('arrayOf').getString(3);
  jo := vJsonObj.Field['myObj'] as TlkJsonObject;
  o := jo.Field['mystats'] as TlkJsonObject;
  di := o.getDateTime('birthdate');
  si := DateTimeToStr(di);
  writeln(si);

  jo := vJsonObj.Field['myObj'] as TlkJsonObject;
  o := jo.Field['mystats'] as TlkJsonObject;
  writeln(TLkJson.GenerateText(vJsonObj.getObject('mystats')));
  dt := o.getDateTime('today'); //Field['today'] as TlkJsonDateTime;
  si := DateTimeToStr(dt);
  writeln(si);

//  dt := vJsonObj.Field['myObj'].Field['mystats'].Field['today'] as TlkJsonDateTime;
//  str :=  dt.Value;
//  writeln(str);
//  dt := vJsonObj.Field['myObj'].Field['mystats'].Field['birthdate'] as TlkJsonDateTime;
//  str :=  dt.Value;
//  writeln(str);
  readln;
  vJsonStr := TlkJSON.GenerateText(vJsonObj);
  writeln(vJsonStr);
  readln;
  vJsonObj.Free;
end.

