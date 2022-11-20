# listprn
List Windows Printers :Command Line Utility
![Run_listprn](https://user-images.githubusercontent.com/325502/202925140-1e033cd4-9885-4668-b478-e98631cc3c0f.png)

## Help

Get help

> listprn -h

````
PS C:\Users\tobya\listprn> .\listprn.exe -h
ListPrn.exe
Commandline utility for listing Windows Printers.
SourceCode:https://github.com/tobya/listprn
Version:0.2
Call with no params to get list of printers
-H :Help Message
-J :Output as JSON
-D :Show Default Printer
````

## JSON Output
Can output JSON details to make it easier for another service to use.

> listprn -j
