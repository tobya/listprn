program listprn;

{$APPTYPE CONSOLE}

{$R *.res}

uses

  classes, sysutils,
  listprn_config in 'listprn_config.pas';

var I, j : Integer;
paramlist : TStringlist;
cONFIG : TConfigLoader;
begin
  paramlist := TStringList.Create;

  try

     for j := 1 to ParamCount do
      begin
       paramlist.Add(ParamStr(j));
      end;

    Config := TConfigLoader.Create;

    Config.load(paramlist);


  except
    on E: Exception do
    begin
      Writeln(E.ClassName, ': ', E.Message);
    end;
  end;
  paramlist.free;
end.
