program listprn;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  vcl.Printers;



  var I : Integer;
begin

  try
    { TODO -oUser -cConsole Main : Insert code here }
    for I := 0 to Printer.Printers.Count -1 do
      begin
        writeln(Printer.Printers.Strings[I]);
      end;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
