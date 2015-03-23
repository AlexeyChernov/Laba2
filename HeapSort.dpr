program Project30;
{$APPTYPE CONSOLE}

uses
SysUtils;

const
P = 100000000;

type
arr = array [1..P] of Integer;


var
a: arr;
n, i: Integer ;
f1, f2: TextFile;
Time: TDateTime;
TimeHour, TimeMin, TimeSec, TimeMil: word;
TimeSum: double;

procedure WriteMas(a: arr; n: integer);
var i: integer;
begin
for i := 1 to n do
write(a[i], ' ');
writeln;
end;

procedure HeapSort(N: integer);
procedure shift(L,R: integer);
var
i,j: integer;
x:
integer;
begin
i:=L;
j:=2*i;
x:=a[i];
if (j<R) and (a[j]<a[j+1]) then
j:=j+1;
while (j<=R) and (x<a[j]) do
begin
a[i]:=a[j];
i:=j;
j:=2*j;
if (j<R) and (a[j]<a[j+1]) then
j:=j+1;
end;
a[i]:=x;
end;
var
L,R: integer;
x:integer;
begin
L:=(N div 2)+1;
R:=N;
while L>1 do
begin
L:=L-1;
shift(L,R);
end;
while R>1 do
begin
x:=a[1];
a[1]:=a[R];
a[R]:=x;
R:=R-1;
shift(L,R);
end;
end;


begin
AssignFile(f1, ParamStr(1));
Reset(f1);
AssignFile(f2, ParamStr(2));
Rewrite(f2);
read(f1, n);
for i:= 1 to n do
read(f1, a[i]);
time:= Now;
HeapSort(n);
Time:= Now-Time;
DecodeTime(Time, TimeHour, TimeMin, TimeSec, TimeMil);
TimeSum:= TimeMil/1000 + TimeSec + 60*TimeMin + 3600*TimeHour;
writeln(f2, n);
for i:= 1 to n-1 do
write(f2, a[i], ' ');
writeln(f2, a[n]);
Write(f2, 'Ïèðàìèäêà.');
writeln(f2);
Writeln(f2, floattostr(TimeSum));
Writeln(f2);
CloseFile(f1);
CloseFile(f2);
end.







