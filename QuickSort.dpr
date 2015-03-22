program Project20;

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

procedure sort(L,R: integer);
var
i,j,w,x: integer;
begin
i := L;
j := R;
x := a[(L+R) div 2];
REPEAT
while a[i] < x do
i := i+1;
while x < a[j] do
j := j-1;
if i <= j then
begin
w:= a[i];
a[i]:= a[j];
a[j]:= w;
i:= i+1;
j:= j-1;
end;
UNTIL i>j;
if L < j then
sort(L, j);
if i < R then
sort(i, R);
end;
procedure QuickSort;
begin
sort(1,N);
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
      QuickSort;
      Time:= Now-Time;
      DecodeTime(Time, TimeHour, TimeMin, TimeSec, TimeMil);
      TimeSum:= TimeMil/1000 + TimeSec + 60*TimeMin + 3600*TimeHour;
      writeln(f2, n);
      for i:= 1 to n-1 do
      write(f2, mas[i], ' ');
      writeln(f2, mas[n]);
    Write(f2, 'Быстрая.');
    writeln(f2);
    Writeln(f2, floattostr(TimeSum));
    Writeln(f2);
    CloseFile(f1);
    CloseFile(f2);
end.







