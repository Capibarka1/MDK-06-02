type anketa = record
  fio: string;
  birth: string;
  kurs: 1..5;
end;

begin
  var students :array[1..3] of anketa;
  with students[1] do begin
    fio := 'Семушин Дмитрий Александрович';
    birth := '10.09.2008';
    kurs := 2;
  end;
  with students[2] do begin
    fio := 'Селиванов Михаил Валерьевич';
    birth := '12.06.2006';
    kurs := 4;
  end;
  with students[3] do begin
    fio := 'Чижов Константин Ярославович';
    birth := '01.08.2009';
    kurs := 1;
  end;
  for var i:=1 to 3 do println(students[i].fio,'/',students[i].birth,'/ Курс:',students[i].kurs);
end.