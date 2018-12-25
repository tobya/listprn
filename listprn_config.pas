unit listprn_config;

interface

uses sysutils,classes,vcl.Printers;

Type

  TConfigLoader = class
  private
    procedure HaltWithError(ErrorNo: Integer; Msg: String);
    function DefaultPrinterName: String;
    public
    procedure Load(Params: TStrings);
    procedure Log(Msg: string);
    procedure WriteOut(Msg: String);

  end;

implementation


procedure TConfigLoader.Load(Params: TStrings);
var  f , iParam, idx: integer;
pstr : string;
id, value, DefaultPrnName : string;
Output : TStringList;
  I: Integer;




begin
  //Initialise
  iParam := 0;
  Output := TStringList.Create;

  log('Loading Configuration...');
  log('Parameter Count is ' + inttostr(params.Count));

  if Params.Count = 0 then
  begin
    //  log('Parameters Expected: -H for help');
    //  halt(1);

        for Idx := 0 to Printer.Printers.Count -1 do
      begin
        Output.Add(Printer.Printers.Strings[Idx]);
      end;
  end ;



  While iParam <= Params.Count -1 do
  begin

    pstr := Params[iParam];

    id := UpperCase( pstr);
    if ParamCount -1  > iParam then
    begin
      try
        value := Trim(Params[iParam +1]);
      except on E: Exception do
        HaltWithError(202,E.message);
      end;
    end
    else
    begin
      value := '';
    end;

    //jump to next id + value
    inc(iParam,2);


    if (id = '-D') or
       (id = '--DEFAULT') then
    begin
      Output.Add(DefaultPrinterName());
    end
    else if (id = '-J') or
       (id = '--JSON') then
    begin
      Output.Add('{"Printers":[');
    DefaultPrnName := DefaultPrinterName();
   for Idx := 0 to Printer.Printers.Count -1 do
      begin
        if IDx > 0 then
        begin
          Output.Add(',');
        end;

        Output.Add('  {"PrinterName" : "' +Printer.Printers.Strings[Idx] +  '"');
        if Printer.Printers[Idx] = DefaultPrnName then
        begin
          Output.Add('   ,"Default": true');
        end else begin
          Output.Add('   ,"Default": false');
        end;

        Output.Add('   } '                );
      end;
         Output.Add('  ]}');
    end
    else
    begin
      HaltWithError(203,'Unknown Switch:' + pstr);
    end;




  end;

  for I := 0 to Output.Count -1 do
  begin
    WriteOut(Output.Strings[i]);
  end;

  Output.Free;

end;

procedure TConfigLoader.HaltWithError(ErrorNo: Integer; Msg: String);
begin
  WriteOut(Msg);
  WriteOut('Exiting with Error Code : ' + inttostr(ErrorNo));

  Halt(ErrorNo);
end;

procedure TConfigLoader.Log(Msg: string);
begin
   // writeln(Msg);
end;

procedure TConfigLoader.WriteOut(Msg: String);
begin
    writeln(Msg);
end;

function TConfigLoader.DefaultPrinterName : String;
var
 DefaultPrnName : String;
begin
      Printer.PrinterIndex := -1;
      DefaultPrnName := Printer.Printers.Strings[Printer.PrinterIndex];
      Result := DefaultPrnName;
end;

end.
