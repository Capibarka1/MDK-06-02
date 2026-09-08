type PNode = ^Node;   
     Node = record   
       num: integer;
       next: PNode;      
     end;

function CreateNode(NewNum: integer): PNode;
begin
  var NewNode: PNode;
  New(NewNode);
  NewNode^.num := NewNum;
  NewNode^.next := nil;
  Result := NewNode;
end;

procedure AddFirst ( var Head: PNode; NewNode: PNode );
begin
  NewNode^.next := Head;
  Head := NewNode;
end;

procedure AddAfter ( var pp: PNode; NewNode: PNode );
begin
  NewNode^.next := pp^.next;
  pp^.next := NewNode;
end;

procedure AddLast ( var Head: PNode; NewNode: PNode );
var pp: PNode;
begin
  if Head = nil then
    AddFirst (Head, NewNode)
  else begin
    pp := Head;
    while pp^.next <> nil do 
      pp := pp^.next;
    AddAfter (pp, NewNode);
  end;
end;

begin
  var Head: PNode;
  Head := nil;
  var N := ReadInteger('Введите количество чисел в списке');
  for var i:=1 to N do begin
    var num := Random(-100, 100);
    var newNode := CreateNode(num);
    AddLast(Head, NewNode);
  end;
  println('=======Вывод всего списка========');
  var pp := Head;
  var i := 1;
  while pp <> nil do begin
    println(i, 'элемент =', pp^.num);
    pp := pp^.next;
    inc(i);
  end;
  println('=======Вывод чётных элементов списка========');
  pp := Head;
  i := 1;
  while pp <> nil do begin
    if pp^.num mod 2 = 0 then println(i, 'элемент =', pp^.num);
    pp := pp^.next;
    inc(i);
  end;
end.