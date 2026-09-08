type
  TypeCompareFunction = function(a, b: real): integer;
var
  i, count: integer;
  choice: string;
  num: real;
  outputFile, inputFile: Text;
  arr: array of real;
  CompareFunction: TypeCompareFunction;
  
function CompareAsc(A, B: real): integer;
begin
  if A > B then CompareAsc := 1
  else CompareAsc := -1
end;

function CompareDesc(A, B: real): integer;
begin
  if A < B then CompareDesc := 1
  else CompareDesc := -1
end;
  
procedure Merge(var arr: array of real; left, half, right: integer; CompareFunc: TypeCompareFunction);
var
  n1, n2: integer;
  i, j, k: integer;
  L, R: array of real;
begin
  n1 := half - left + 1;
  n2 := right - half;
  SetLength(L, n1);
  SetLength(R, n2);
  for i := 0 to n1 - 1 do L[i] := arr[left + i];
  for j := 0 to n2 - 1 do R[j] := arr[half + 1 + j];
  i := 0; 
  j := 0; 
  k := left;
  while (i < n1) and (j < n2) do begin
    if (CompareFunc(L[i], R[j]) < 0) then begin
      arr[k] := L[i];
      Inc(i);
    end
    else begin
      arr[k] := R[j];
      Inc(j);
    end;
    Inc(k);
  end;
  while i < n1 do begin
    arr[k] := L[i];
    Inc(i);
    Inc(k);
  end;
  while j < n2 do begin
    arr[k] := R[j];
    Inc(j);
    Inc(k);
  end;
end;

procedure MergeSort(var arr: array of real; left, right: integer; CompareFunc: TypeCompareFunction);
var
  half: integer;
begin
  if left < right then begin
    half := left + (right - left) div 2;
    MergeSort(arr, left, half, CompareFunc);
    MergeSort(arr, half + 1, right, CompareFunc);
    Merge(arr, left, half, right, CompareFunc);
  end;
end;

procedure insertion_sort(var arr: array of real; CompareFunc: TypeCompareFunction);
var
  i, j: integer;
  key: real;
begin
  for i:=1 to High(arr) do begin
    key := arr[i];
    j := i - 1;
    while (j >= 0) and (CompareFunc(key, arr[j]) < 0) do begin
      arr[j+1] := arr[j];
      j := j - 1;
    end;
    arr[j+1] := key;
  end;
end;

begin
  assign(inputFile, 'C:\PABCWork.NET\DKR_5-input.txt');
  reset(inputFile);
  if EOF(inputFile) then begin
    writeln('Файл DKR_5-input.txt пустой!');
    close(inputFile);
    exit;
  end;
  assign(outputFile, 'C:\PABCWork.NET\DKR_5-output.txt');
  rewrite(outputFile);
  count := 0;
  SetLength(arr, count);
  while not Eof(inputFile) do begin
    SetLength(arr, count + 1);
    read(inputFile, num);
    arr[count] := num;
    Inc(count);
  end;
  repeat
    writeln('Выберите как будет сортироваться массив:');
    writeln('Сортировка по возрастанию - 1');
    writeln('Сортровка по убыванию - 2');
    readln(choice);
    case choice of
      '1': CompareFunction := CompareAsc;
      '2': CompareFunction := CompareDesc;
    end;
    if (choice = '1') or (choice = '2') then break
    else writeln('Неверно выбран способ сортировки');
  until False; 
  repeat
    writeln('Выберите сортировку:');
    writeln('Сортировка вставками - 1');
    writeln('Сортровка слиянием - 2');
    readln(choice);
    case choice of
      '1': insertion_sort(arr, CompareFunction);
      '2': MergeSort(arr, 0, High(arr), CompareFunction);
    end;
    if (choice = '1') or (choice = '2') then break
    else writeln('Неверно выбрана сортировка');
  until False;
  for i := 0 to High(arr) do write(outputFile, arr[i], ' ');
  close(inputFile);
  close(outputFile);
  writeln('Из файла DKR_5-input.txt был отсортирован массив и записан в DKR_5-output.txt');
  writeln('Программа завершена!');
end.