begin
  var age1 := [1];
  var age2 := [2..4];
  var age3 := [11..19];
  var person_age := readInteger('Введите возраст');
  if person_age mod 100 in age3 then begin
    println(person_age, 'лет')
  end
    else if person_age mod 10 in age2 then begin
      println(person_age, 'года');
    end
      else if person_age mod 10 in age1 then begin
        println(person_age, 'год');
      end
        else println(person_age, 'лет');
end.