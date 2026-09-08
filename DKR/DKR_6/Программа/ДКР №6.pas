uses Crt;
const
  MaxSize = 1000;
  NullIndex = -1;
  NORM=LightGray; 
  SEL=LightGreen;
  N=8;

type Node = record
       val: integer;
       prev: integer;
       next: integer;
     end;
 
var Nodes: array[1..MaxSize] of Node;  
var Head := NullIndex;
var FreeHead := 1;
var x, y, punkt: integer;
var menu:array[1..N] of string[70];
var ch: char;

procedure InitArray;
begin
  for var i := 1 to MaxSize - 1 do
    Nodes[i].next := i + 1;
  Nodes[MaxSize].next := NullIndex;
  FreeHead := 1;                     
  Head := NullIndex;           
end;

function GetIndex (var FreeHead: integer): integer;
begin
  if FreeHead = NullIndex then begin
    println('Ошибка: нет свободной памяти');
    GetIndex := NullIndex;
    Exit;
  end;
  var idx := FreeHead;
  FreeHead := Nodes[FreeHead].next;
  GetIndex := idx;
end;

procedure FreeNode(idx: integer);
begin
  Nodes[idx].next := FreeHead;
  Nodes[idx].prev := NullIndex;
  FreeHead := idx;
end;

function CreateNode(val: integer): integer;
begin
  var newNode_idx: integer;
  newNode_idx := GetIndex(FreeHead);
  if newNode_idx <> NullIndex then begin
    Nodes[newNode_idx].val := val;
    Nodes[newNode_idx].next := NullIndex;
    Nodes[newNode_idx].prev := NullIndex;
  end;
  CreateNode := newNode_idx;
end;

procedure addFirst(newNode_idx: integer; var Head: integer);
begin
  if Head = NullIndex then begin
    Nodes[newNode_idx].next := newNode_idx;
    Nodes[newNode_idx].prev := newNode_idx;
    Head := newNode_idx;
  end
  else begin
    Nodes[Nodes[Head].prev].next := newNode_idx;
    Nodes[newNode_idx].prev := Nodes[Head].prev;
    Nodes[Head].prev := newNode_idx;
    Nodes[newNode_idx].next := Head;
    Head := newNode_idx;
  end;
end;

procedure addAfter(var Head: integer; newNode_idx, p: integer);
begin
  if Head = NullIndex then begin
    addFirst(newNode_idx, Head);
  end
  else begin
    Nodes[newNode_idx].next := Nodes[p].next;
    Nodes[newNode_idx].prev := p;
    Nodes[Nodes[p].next].prev := newNode_idx;
    Nodes[p].next := newNode_idx;
  end;
end;

procedure delFirst(var Head: integer);
begin
  if Head = NullIndex then begin
    println('Список пуст');
    Exit;
  end;
  if Nodes[Head].next = Head then begin
    FreeNode(Head);
    Head := NullIndex
  end
  else begin
    var newHead := Nodes[Head].next;
    Nodes[Nodes[Head].prev].next := Nodes[Head].next;
    Nodes[Nodes[Head].next].prev := Nodes[Head].prev;
    FreeNode(Head);
    Head := newHead;
  end;
end;

procedure deleteNode(var Head: integer; p: integer);
begin
  if Head = NullIndex then begin
    println('Список пуст');
    exit;
  end;
  if p = NullIndex then begin
    println('Ошибка при указании удаляемого элемента');
    exit;
  end;
  if p = Head then begin
    delFirst(Head)
  end
  else begin
    Nodes[Nodes[p].prev].next := Nodes[p].next;
    Nodes[Nodes[p].next].prev := Nodes[p].prev;
    FreeNode(p);
  end;
end;

function findNumIndex(Head, findNum: integer): integer;
begin
  var pp := Head;
  if Head = NullIndex then begin
    findNumIndex := NullIndex;
    exit;
  end;
  repeat
    if Nodes[pp].val = findNum then begin
      findNumIndex := pp;
      exit;
    end;
    pp := Nodes[pp].next;
  until pp = Head;
  findNumIndex := NullIndex;
end;

procedure printList(Head: integer; way: string);
begin
  var pp := Head;
  if Head = NullIndex then begin
    println('Список пуст');
    exit;
  end;
  print('- ');
  if way = 'Common' then begin
    repeat
      print(Nodes[pp].val, ' - ');
      pp := Nodes[pp].next;
    until pp = Head;    
  end;
  if way = 'Reverse' then begin
    repeat
      pp := Nodes[pp].prev;
      print(Nodes[pp].val, ' - ');
    until pp = Head;    
  end;
  println;
end;

function GetIndexPlace(Head, num: integer): integer;
begin
  var pp := Head;
  if Head = NullIndex then begin
    GetIndexPlace := 0;
    exit;
  end;
  var i := 0;
  repeat
    inc(i);
    if num = i then begin
      GetIndexPlace := pp;
      exit;
    end;
    pp := Nodes[pp].next;
  until pp = Head;
  GetIndexPlace := 0;
end;

function GetRealNumber: string;
var
  ch: char;
  result_: string;
begin
  result_ := '';
  repeat
    ch := ReadKey;
    // Цифры
    if ch in ['0'..'9'] then begin
      result_ := result_ + ch;
      clearline;
      write(result_);
    end
    // Знак минус только в начале
    else if (ch = '-') and (length(result_) = 0) then begin
      result_ := result_ + ch;
      clearline;
      write(result_);
    end
    // Backspace
    else if (ch = #8) and (length(result_) > 0) then begin
      delete(result_, length(result_), 1);
      clearline;
      write(result_);
    end
    // Enter для завершения
    else if ch = #13 then begin
      // Проверяем, что число не пустое и не состоит только из минуса
      if (length(result_) > 0) and not ((length(result_) = 1) and (result_[1] = '-')) then break;
    end;
  until false;
  writeln();
  GetRealNumber := result_;
end;

Procedure MenuToScr;
begin
  ClrScr;
  for var i:=1 to N do begin
    GoToXY(x, y+i-1);
    print(menu[i])
  end;
  TextColor(SEL);
  GoToXY(x, y+punkt-1);
  print(menu[punkt]);
  TextColor(NORM);
end;

Procedure Punkt1(Head: integer);
begin
  repeat
    ClrScr;
    printList(Head, 'Common');
    println('Нажмите Q для возвращения');
    ch := readkey;
  until ch in [#113, #81, #1049, #1081];
end;

Procedure Punkt2(Head: integer);
begin
  repeat
    ClrScr;
    printList(Head, 'Reverse');
    println('Нажмите Q для возвращения');
    ch := readkey;
  until ch in [#113, #81, #1049, #1081];
end;

Procedure Punkt3(var Head: integer);
begin
  repeat
    ClrScr;
    println('Введите значение элемента, который хотите поместить в начало списка');
    var N := StrToInt(GetRealNumber);
    var new_indx := CreateNode(N);
    if new_indx <> NullIndex then
      addFirst(new_indx, Head)
    else
      println('Ошибка: нет свободной памяти');
    println('Нажмите Q для возвращения или Enter для новой записи значения');
    repeat
      ch := readkey;
    until ch in [#113, #81, #1049, #1081, #13];
  until ch in [#113, #81, #1049, #1081];
end;

Procedure Punkt4(var Head: integer);
begin
  repeat
    ClrScr;
    println('Введите значение элемента, после которого вы хотите разместить новый элемент');
    var S := StrToInt(GetRealNumber);
    var NumIndex := findNumIndex(Head, S);
    if NumIndex = NullIndex then begin
      println('В списке нет узла с таким значением');
    end
    else begin
      println('Введите значение элемента, который хотите поместить после того элемента');
      var N := StrToInt(GetRealNumber);
      var new_indx := CreateNode(N);
      if new_indx <> NullIndex then
        addAfter(Head, new_indx, NumIndex)
      else
        println('Ошибка: нет свободной памяти');
    end;
    println('Нажмите Q для возвращения или Enter для новой записи значения');
    repeat
      ch := readkey;
    until ch in [#113, #81, #1049, #1081, #13];
  until ch in [#113, #81, #1049, #1081];
end;

Procedure Punkt5(var Head: integer);
begin
  repeat
    ClrScr;
    println('Введите порядковый номер элемента, после которого вы хотите разместить новый элемент');
    var indx := StrToInt(GetRealNumber);
    var num_idx := GetIndexPlace(Head, indx);
    if (num_idx = NullIndex) or (num_idx = 0) then begin
      println('Элемента с таким порядковым номером нет')
    end
    else begin
      println('Введите значение элемента, который хотите поместить после того элемента');
      var N := StrToInt(GetRealNumber);
      var new_indx := CreateNode(N);
      if new_indx <> NullIndex then
        addAfter(Head, new_indx, num_idx)
      else
        println('Ошибка: нет свободной памяти');
    end;
    println('Нажмите Q для возвращения или Enter для новой записи значения');
    repeat
      ch := readkey;
    until ch in [#113, #81, #1049, #1081, #13];
  until ch in [#113, #81, #1049, #1081];
end;

Procedure Punkt6(var Head: integer);
begin
  repeat
    ClrScr;
    if Head = NullIndex then
      println('Список пуст, нечего удалять')
    else begin
      println('Удалено значение', Nodes[Head].val);
      delFirst(Head);
    end;
    println('Нажмите Q для возвращения или Enter для удаления следующего числа');
    repeat
      ch := readkey;
    until ch in [#113, #81, #1049, #1081, #13];
  until ch in [#113, #81, #1049, #1081];
end;

Procedure Punkt7(var Head: integer);
begin
  repeat
    ClrScr;
    println('Введите значение элемента, который хотите удалить');
    var S := StrToInt(GetRealNumber);
    var NumIndex := findNumIndex(Head, S);
    if NumIndex = NullIndex then begin
      println('В списке нет узла с таким значением');
    end
    else begin
      println('Удалено значение', Nodes[NumIndex].val);
      deleteNode(Head, NumIndex); 
    end;
    println('Нажмите Q для возвращения или Enter для удаления следующего числа');
    repeat
      ch := readkey;
    until ch in [#113, #81, #1049, #1081, #13];
  until ch in [#113, #81, #1049, #1081];
end;

begin
  InitArray;
  Head := NullIndex;
  menu[1] := 'Вывод двусвязного кольцевого списка';
  menu[2] := 'Вывод двусвязного кольцевого списка в обратном порядке';
  menu[3] := 'Добавление элемента в начало списка';
  menu[4] := 'Добавление элемента после некоторого элемента';
  menu[5] := 'Добавление элемента по индексу';
  menu[6] := 'Удаление элемента из начала списка';
  menu[7] := 'Удаление указанного элемента';
  menu[8] := 'Выход';
  punkt := 1;
  x := 40;
  y := 12;
  TextColor(NORM);
  MenuToScr;
  repeat
    ch := ReadKey;
    if ch = #0 then begin
      ch := ReadKey;
      case ch of
        #40:
          if punkt < N then begin
            TextColor(NORM);  
            GoToXY(x, y+punkt-1);
            write(menu[punkt]);
            punkt:=punkt+1;
            TextColor(SEL);
            GoToXY(x, y+punkt-1);
            write(menu[punkt]);
            TextColor(NORM);
          end;
        #38:
          if punkt > 1 then begin
            TextColor(NORM);  
            GoToXY(x, y+punkt-1);
            write(menu[punkt]);
            punkt:=punkt-1;
            TextColor(SEL);
            GoToXY(x, y+punkt-1);
            write(menu[punkt]);
            TextColor(NORM);
          end;
      end;
    end
    else if ch = #13 then begin
      case punkt of
        1: punkt1(Head);
        2: punkt2(Head);
        3: punkt3(Head);
        4: punkt4(Head);
        5: punkt5(Head);
        6: punkt6(Head);
        7: punkt7(Head);
        8: ch := #27;
      end;
      MenuToScr;
    end;
  until ch = #27;
  ClrScr;
end.