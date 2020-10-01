function [h,m,ms,ma] = getArgs()

state = GetArgsState.Main;

h = 20;
m = 2.5;
ms = 1.5;
ma = m - ms;
disp('Введите номер пункта');
    while(state ~= GetArgsState.End)
        switch(state)
            case GetArgsState.Main
                disp('1) �?спользовать настройки по умолчанию')
                disp('2) �?зменить настройки по умолчанию')
                choise = input('');
                if(choise == 1)
                    state = GetArgsState.End;
                elseif(choise == 2)
                    state = Change_Default_Settings;
                else
                    disp('Ошибка ввода. Попробуйте еще раз.')
                end
                
            case GetArgsState.Change_Default_Settings
                
            case GetArgsState.Change_H
                
        end
    end

end

