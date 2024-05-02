program lab9;

uses UnitTypes, LinkedStack, LinkedQueue, LinkedDeque;

var
  fin, fout: TextFile;
  stack: TStack;
  headQueue, tailQueue: TQueue;
  headDeque, tailDeque: TDeque;

function filterEpsilon(x: TInfo): boolean;
begin
  result := ((x.val >= -1.5) and (x.val <= 8.6));
end;

procedure WriteStack(var fout: TextFile; var top: TStack);
var
  ch: TInfo;
  toStack: TStack;
begin
  writeln(fout);
  write(fout, '[STACK] ');
  while not IsEmpty(top) do
  begin
    ch := GetInfo(top);
    TopToTop(top, toStack);
    write(fout, ch);
    write(fout, ' ');
  end;
  top := toStack;
end;
procedure RemoveStackElements(var stack: TStack; f: filterFunc);
var
  ch: TInfo;
  toStack: TStack;
begin
  while not IsEmpty(stack) do
  begin
    ch := GetInfo(stack);
    if not f(ch) then begin
      TopToTop(stack, toStack);
    end
    else
      RemoveTop(stack);
  end;
  stack := toStack;
end;






procedure ReadAllLinked(var fin: TextFile; var stack: TStack; var headQueue, tailQueue: TQueue; var headDeque, tailDeque: TDeque);
var
  val: T;
  ch: TInfo;
begin
  reset(fin);
  read(fin, val);
  ch.val := val;
  Init(stack, ch);
  Init(headQueue, tailQueue, ch);
  Init(headDeque, tailDeque, ch);
  while not eof(fin) do
  begin
    read(fin, val);
    ch.val := val;
    AddTop(stack, ch);
    AddTail(headQueue, tailQueue, ch);
    AddHead(headDeque, tailDeque, ch);
  end;
end;

procedure WriteQueueLinked(var fout: TextFile; var headQueue, tailQueue: TQueue);
var
  ch: TInfo;
  toHeadQueue, toTailQueue: TQueue;
begin
  writeln(fout);
  write(fout, '[QUEUE] ');
  while not IsEmpty(headQueue) do
  begin
    ch := GetInfoHead(headQueue, tailQueue);
    HeadToTail(headQueue, tailQueue, toHeadQueue, toTailQueue);
    write(fout, ch);
    write(fout, ' ');
  end;
  headQueue := toHeadQueue;
  tailQueue := toTailQueue;
end;

procedure WriteDeque(var fout: TextFile; var headDeque, tailDeque: TDeque);
var
  ch: TInfo;
  toHeadDeque, toTailDeque: TDeque;
begin
  writeln(fout);
  write(fout, '[DEQUE] ');
  while not IsEmpty(headDeque) do
  begin
    ch := GetInfoTail(headDeque, tailDeque);
    TailToHead(headDeque, tailDeque, toHeadDeque, toTailDeque);
    write(fout, ch);
    write(fout, ' ');
  end;
  headDeque := toHeadDeque;
  tailDeque := toTailDeque;
end;

procedure RemoveQueueElementsLinked(var headQueue, tailQueue: TQueue; f: filterFunc);
var
  ch: TInfo;
  toHeadQueue, toTailQueue: TQueue;
begin
  while not IsEmpty(headQueue) do
  begin
    ch := GetInfoHead(headQueue, tailQueue);
    if not f(ch) then begin
      HeadToTail(headQueue, tailQueue, toHeadQueue, toTailQueue);
    end
    else
      RemoveHead(headQueue, tailQueue);
  end;
  headQueue := toHeadQueue;
  tailQueue := toTailQueue;
end;

procedure RemoveDequeElementsLinked(var headQueue, tailQueue: TDeque; f: filterFunc);
var
  ch: TInfo;
  toHeadDeque, toTailDeque: TDeque;
begin
  while not IsEmpty(headQueue) do
  begin
    ch := GetInfoTail(headQueue, tailQueue);
    if not f(ch) then begin
      TailToTail(headQueue, tailQueue, toHeadDeque, toTailDeque);
    end
    else
      RemoveTail(headQueue, tailQueue);
  end;
  headQueue := toHeadDeque;
  tailQueue := toTailDeque;
end;

{procedure ReadAllArray(var fin: TextFile; var stack: TStack; var queue: TQueue; var deque: TDeque);
var
  val: T;
  ch: TInfo;
begin
  reset(fin);
  read(fin, val);
  ch.val := val;
  Init(stack, ch);
  Init(queue, ch);
  Init(deque, ch);
  while not eof(fin) do
  begin
    read(fin, val);
    ch.val := val;
    AddTop(stack, ch);
    AddTail(queue, ch);
    AddHead(deque, ch);
  end;
end;


procedure WriteQueueArray(var fout: TextFile; var queue: TQueue);
var
  ch: TInfo;
  toQueue: TQueue;
begin
  writeln(fout);
  write(fout, '[QUEUE] ');
  while not IsEmpty(queue) do
  begin
    ch := GetInfoHead(queue);
    HeadToTail(queue, toQueue);
    write(fout, ch);
    write(fout, ' ');
  end;
  queue := toQueue;
end;

procedure WriteDequeArray(var fout: TextFile; var deque: TDeque);
var
  ch: TInfo;
  toDeque: TDeque;
begin
  writeln(fout);
  write(fout, '[DEQUE] ');
  while not IsEmpty(deque) do
  begin
    ch := GetInfoTail(deque);
    TailToHead(deque, toDeque);
    write(fout, ch);
    write(fout, ' ');
  end;
  deque := toDeque;
end;

procedure RemoveQueueElementsArray(var queue: TQueue; f: filterFunc);
var
  ch: TInfo;
  toQueue: TQueue;
begin
  while not IsEmpty(queue) do
  begin
    ch := GetInfoHead(queue);
    if not f(ch) then begin
      HeadToTail(queue, toQueue);
    end
    else
      RemoveHead(queue);
  end;
  queue := toQueue;
end;

procedure RemoveDequeElementsArray(var deque: TDeque; f: filterFunc);
var
  ch: TInfo;
  toDeque: TDeque;
begin
  while not IsEmpty(deque) do
  begin
    ch := GetInfoTail(deque);
    if not f(ch) then begin
      TailToTail(deque, toDeque);
    end
    else
      RemoveTail(deque);
  end;
  deque := toDeque;
end;}



begin
  if ParamCount < 2 then begin
    writeln('Недостаточно параметров!');
  end
  else
  begin
    if not FileExists(ParamStr(1)) then
    begin
      writeln('Невозможно открыть файл ''', ParamStr(1), ''' для чтения')
    end
      else
    begin
        { Assigning }
      AssignFile(fin, ParamStr(1));
      AssignFile(fout, ParamStr(2));
      Append(fout);
      writeln(fout);
      writeln(fout, 'New start');
      
      {ReadAllArray(fin, stack, headQueue, headDeque);
      RemoveStackElements(stack, filterEpsilon);
      RemoveQueueElementsArray(headQueue, filterEpsilon);
      RemoveDequeElementsArray(headDeque, filterEpsilon);
      WriteStack(fout, stack);
      WriteQueueArray(fout, headQueue);
      WriteDequeArray(fout, headDeque);}
      
      ReadAllLinked(fin, stack, headQueue, tailQueue, headDeque, tailDeque);
      RemoveStackElements(stack, filterEpsilon);
      RemoveQueueElementsLinked(headQueue, tailQueue, filterEpsilon);
      RemoveDequeElementsLinked(headDeque, tailDeque, filterEpsilon);
      WriteStack(fout, stack);
      WriteQueueLinked(fout, headQueue, tailQueue);
      WriteDeque(fout, headDeque, tailDeque);
      
      
        { Final }
      CloseFile(fin);
      CloseFile(fout);
      writeln('end');
    end;
  end;
end.