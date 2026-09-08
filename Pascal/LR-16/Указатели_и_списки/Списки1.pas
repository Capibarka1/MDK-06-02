type PNode = ^Node;   { указатель на узел }   
     Node = record    { структура узла }
       word: string[100]; { слово }
       count: integer;   { счетчик повторов слов }
       next: PNode;      { ссылка на следующий }
     end;

function CreateNode(NewWord: string): PNode;
begin
  var NewNode: PNode;
  New(NewNode);
  NewNode^.word := NewWord;
  NewNode^.count := 1;
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

procedure AddBefore(var Head: PNode; p, NewNode: PNode);
begin
  var pp: PNode;
  pp := Head;
  if p = Head then
    AddFirst ( Head, NewNode )  // добавление в начало списка
  else begin
    while (pp <> nil)  and  (pp^.next <> p) do // поиск узла, за которым следует узел p
      pp := pp^.next;
    if pp <> nil then AddAfter ( pp, NewNode ); // добавляем после узла pp
  end;
end;

function Find(Head: PNode; NewWord: string): PNode;
begin
  var pp: PNode;
  pp := Head;
  // пока не конец списка и слово в просматриваемом узле не равно искомому
  while (pp <> nil) and (NewWord <> pp^.word) do 
    pp := pp^.next;
  Result := pp;
end;

function FindPlace(Head: PNode; NewWord: string): PNode;
begin
  var pp: PNode;
  pp := Head;
  while (pp <> nil) and (NewWord > pp^.word) do
    pp := pp^.next;
  Result := pp;
// слово NewWord в алфавитном порядке находится перед pp^.word
end;

function TakeWord ( F: Text ) : string;
begin
  Result := ''; { пустая строка }
  var c := ' ';     { пробел – чтобы войти в цикл }  
    { пропускаем спецсимволы и пробелы }
  while not eof(f) and (c <= ' ') do 
    read(F, c);  
    { читаем слово }  
  while not eof(f) and (c > ' ') do begin
    Result := Result + c;
    read(F, c);
  end;
end;

begin
  var Head: PNode;
  Head := nil;
  var f: text;
  Assign(f, 'Списки1.txt');
  reset(f);
  While true do begin
    var word_from_file := TakeWord(f);
    if word_from_file = '' then break;
    var find_word := find(Head, word_from_file);
    if find_word = nil then begin
      var new_node := CreateNode(word_from_file);
      var place := FindPlace(Head, word_from_file);
      AddBefore(Head, place, new_node);
    end
    else inc(find_word^.count);
  end;
  close(f);
  var counter := 0;
  var pp := Head;
  while pp <> nil do begin
    inc(counter);
    pp := pp^.next;       
  end;
  println('Количество различных слов в тексте (количество лементов списка) :', counter);
end.