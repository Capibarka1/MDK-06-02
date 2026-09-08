type anketa = record
  fio: string;
  birth: string;
  kurs: 1..5;
end;

begin
  var student: anketa;
  with student do begin
    fio := 'Семушин Дмитрий Александрович';
    birth := '10.09.2008';
    kurs := 2;
  end;
  println(student.fio,'/',student.birth,'/ Курс:',student.kurs);
end.