unit WebModuleUnit1;

interface

uses
  System.SysUtils, System.Classes, Web.HTTPApp, RegularExpressions,
  Generics.Collections;

type
  TWebModule1 = class(TWebModule)
    procedure WebModule1DefaultHandlerAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure WebModule1DoActionAction(Sender: TObject; Request: TWebRequest;
      Response: TWebResponse; var Handled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WebModuleClass: TComponentClass = TWebModule1;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TWebModule1.WebModule1DefaultHandlerAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  Response.Content :=
    '<html>' +
    '<head><title>Web Server Application</title></head>' +
    '<body>Web Server Application</body>' +
    '</html>';
end;

{http://localhost:8080/Do.a?xx=13&yy=800}
procedure TWebModule1.WebModule1DoActionAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
var
 paramString: string;
 i: Integer;
 parsmItems, arr: TArray<string>;
 dict: TDictionary<string,string>;
 var s, key: string;
begin
  paramString := request.ReadString(1000);
  parsmItems := TRegEx.Split(paramString, '&');
  dict := TDictionary<string,string>.Create;
  for i := 0 to Length(parsmItems) -1 do
  begin
    arr := TRegEx.Split(parsmItems[i], '=');
    dict.AddOrSetValue(arr[0], arr[1]);
  end;
  for key in dict.Keys do
  begin
    s := s + '<br />' + dict.Items[key];
  end;
  Response.Content :=
    '<html>' +
    '<head><title>Do Page. Web Server Application</title></head>' +
    '<body><h2>Demo</h2><span>' + s + '</span></body>' +
    '</html>';
end;

end.
