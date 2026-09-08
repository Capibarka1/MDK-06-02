type PNode = ^Node;
     Node = record
       data: integer;
       next: PNode;
     end;

procedure Push(var Head: PNode; x: integer);
begin
  var NewNode: PNode;
  New(NewNode);
  NewNode^.data := x;
  NewNode^.next := Head;
  Head := NewNode;
end;

function Pop(var Head: PNode; var val: integer): boolean;
var temp: PNode;
begin
  if Head = nil then
  begin
    Pop := false;
    Exit;
  end;
  val := Head^.data;
  temp := Head;
  Head := Head^.next;
  Dispose(temp);
  Pop := true;
end;

begin
  var f: text;
  var f2: text;
  var S: PNode;
  S := nil;
  Assign(f, 'numbers.txt');
  reset(f);
  var num: integer;
  while not EOF(f) do begin
    read(f, num);
    Push(S, num)
  end;
  close(f);
  Assign(f2, 'reverse_nums.txt');
  rewrite(f2);
  while True do begin
    if Pop(S, num) = False then break;
    write(f2, num, ' ');
  end;
  close(f2);
  println('Данные из файла numbers.txt записаны в реверсированном виде в reverse_nums.txt');
end.

