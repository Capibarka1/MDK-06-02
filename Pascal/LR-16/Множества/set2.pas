type t_chs = set of Char;
const
  lett: t_chs = ['a'..'z','A'..'Z','_'];
  num: t_chs = ['0'..'9'];

begin
  var str := ReadString('Введите строку');
  var flag := true;
  for var i:=1 to length(str) do begin
    if i = 1 then begin
      if str[1] not in lett then begin
        flag := false;
        break
      end;
    end
    else if (str[i] not in lett) and (str[i] not in num) then begin
      flag := false;
      break
    end;
  end;
  
  if flag then println('Строка введена корректно')
  else println('Строка введена некорректно!!!')
end.