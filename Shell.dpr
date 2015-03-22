program Project10;

{$APPTYPE CONSOLE}

uses
  SysUtils;

const
  P = 100000000;

type
  arr = array [1..P] of Integer;

procedure WriteMas;
var i: integer;
begin
  for i := 1 to n do
    write(a[i], ' ');
  writeln;
end;

procedure Shell(n:integer; var a:arr);
  const T = 5;
var
i, j, k, m: integer;
x: integer;
h: array [1 .. 5] of integer;
begin
h[1] := 31; h[2] := 15; h[3] := 7; h[4] := 3; h[5] := 1;
for m := 1 to T do
begin
k := h[m];
for i := k + 1 to N do
begin
x := a[i];
j := i
-
k;
while (j > k) and (x < a[j]) do
begin
a[j + k] := a[j];
j := j
-
k;
end;
if (j > k) or (x >= a[j]) then
a[j + k] := x
else
begin
a[j + k] := a[j];
a[j] := x;
end;
end;
end;
end;

var
  mas: arr;
  h: boolean;
  n, i: Integer ;
  f1, f2: TextFile;
  Time: TDateTime;
  TimeHour, TimeMin, TimeSec, TimeMil: word;
  TimeSum: double;
  name1, name2: string[80];



begin
    AssignFile(f1, ParamStr(1));
    Reset(f1);
    AssignFile(f2, ParamStr(2));
    Rewrite(f2);
    read(f1, n);
    for i:= 1 to n do
      read(f1, mas[i]);
      time:= Now;
      Shell(n, mas);
      Time:= Now-Time;
      DecodeTime(Time, TimeHour, TimeMin, TimeSec, TimeMil);
      TimeSum:= TimeMil/1000 + TimeSec + 60*TimeMin + 3600*TimeHour;
      writeln(f2, n);
      for i:= 1 to n-1 do
      write(f2, mas[i], ' ');
      writeln(f2, mas[n]);
    Write(f2, 'Шелл.');
    writeln(f2);
    Writeln(f2, floattostr(TimeSum));
    Writeln(f2);
    CloseFile(f1);
    CloseFile(f2);
end.
