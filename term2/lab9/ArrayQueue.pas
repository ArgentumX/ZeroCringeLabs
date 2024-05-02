unit ArrayQueue;

interface

uses UnitTypes;

type
  TQueue = record
    x: array of TInfo;
    n, r: integer;
  end;
  
procedure Init(var queue: TQueue; ch: TInfo);
function IsEmpty(var queue: TQueue): boolean;
procedure AddTail(var queue: TQueue; ch: TInfo);
procedure RemoveHead(var queue: TQueue);
function GetInfoHead(var queue: TQueue): TInfo;
procedure HeadToTail(var fromQueue, toQueue: TQueue);

implementation

procedure AddMemoryAfter(var queue: TQueue);
begin
  queue.r := 10;
  SetLength(queue.x, queue.n + queue.r)
end;

procedure Init(var queue: TQueue; ch: TInfo);
begin
  queue.n := 1;
  queue.r := 10;
  SetLength(queue.x, queue.r + queue.n);
  queue.x[queue.n - 1] := ch;
end;

function IsEmpty(var queue: TQueue): boolean;
begin
  result := queue.n = 0;
end;

procedure AddTail(var queue: TQueue; ch: TInfo);
begin
  queue.n += 1;
  queue.r -= 1;
  queue.x[queue.n-1] := ch;
  
  if (queue.r = 0) then
    AddMemoryAfter(queue);
end;

procedure RemoveHead(var queue: TQueue);
var i: integer;
begin
  if not IsEmpty(queue) then begin
    for i := 1 to queue.n - 1 do begin
      queue.x[i-1] := queue.x[i];
    end;
    queue.n -= 1;
    queue.r += 1;
  end;
end;
function GetInfoHead(var queue: TQueue): TInfo;
begin
  result := queue.x[0];
end;

procedure HeadToTail(var fromQueue, toQueue: TQueue);
var ch: TInfo;
begin
  ch := GetInfoHead(fromQueue);
  RemoveHead(fromQueue);
  if not IsEmpty(toQueue) then
    AddTail(toQueue, ch)
  else
    Init(toQueue, ch);
end;

end.