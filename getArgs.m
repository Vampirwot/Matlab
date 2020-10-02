function [h,m,ms,ma,Nm,Nt] = getArgs()

state = GetArgsState.Main;

h = 20;
m = 2.5;
ms = 1.5;
ma = m - ms;
Nm = 10;
Nt = 1000;
disp('Введите номер пункта');
    while(state ~= GetArgsState.End)
        switch(state)
            case GetArgsState.Main
                fprintf('1) Использовать настройки по умолчанию\n');
                fprintf('2) Изменить настройки по умолчанию\n');
                choise = input('');
                if(choise == 1)
                    state = GetArgsState.End;
                elseif(choise == 2)
                    state = GetArgsState.Change_Default_Settings;
                else
                    fprintf('Ошибка ввода. Попробуйте еще раз.\n');
                end
            case GetArgsState.Change_Default_Settings
                fprintf('\n');
                fprintf('1) Изменить h: %.2f м\n', h);
                fprintf('2) Изменить m: %.2f м^(-1) и ms: %.2f м^(-1)\n', m,ms);
                fprintf('3) Изменить m: %.2f м^(-1) и ma: %.2f м^(-1)\n', m,ma);
                fprintf('4) Изменить ms: %.2f м^(-1) и ma: %.2f м^(-1)\n', ms,ma);
                fprintf('5) Количество точек для ms и ma: %.d штук\n', Nm);
                fprintf('6) Количество точек для t: %.d штук\n', Nt);
                fprintf('7) Готово\n')
                choise = input('');
                if(choise == 1)
                    state = GetArgsState.Change_H;
                elseif(choise == 2)
                    state = GetArgsState.Change_M_Ms;
                elseif(choise == 3)
                    state = GetArgsState.Change_M_Ma;
                elseif(choise == 4)
                    state = GetArgsState.Change_Ms_Ma;
                elseif(choise == 5)
                    state = GetArgsState.Change_Nm;
                elseif(choise == 6)
                    state = GetArgsState.Change_Nt;
                elseif(choise == 7)
                    state = GetArgsState.End;
                end
            case GetArgsState.Change_H
                fprintf('Введите h в м\n');
                h = input('');
                state = GetArgsState.Change_Default_Settings;
            case GetArgsState.Change_M_Ms
                fprintf('Введите m в м^(-1)\n');
                m = input('');
                fprintf('Введите ms в м^(-1)\n');
                ms = input('');
                ma = m - ms;
                state = GetArgsState.Change_Default_Settings;
            case GetArgsState.Change_M_Ma
                fprintf('Введите m в м^(-1)\n');
                m = input('');
                fprintf('Введите ma в м^(-1)\n');
                ma = input('');
                ms = m - ma;
                state = GetArgsState.Change_Default_Settings; 
             case GetArgsState.Change_Ms_Ma
                fprintf('Введите ms в м^(-1)\n');
                ms = input('');
                fprintf('Введите ma в м^(-1)\n');
                ma = input('');
                m = ms + ma;
                state = GetArgsState.Change_Default_Settings;
             case GetArgsState.Change_Nm
                fprintf('Введите количество точек для расчета ms и ma\n');
                Nm = input('');
                state = GetArgsState.Change_Default_Settings;
             case GetArgsState.Change_Nt
                fprintf('Введите количество точек для расчета t\n');
                Nt = input('');
                state = GetArgsState.Change_Default_Settings;
        end
    end

end