function [h,m,ms,ma,Nma,Nms,Nt,Tmax] = getArgs()

state = GetArgsState.Main;

h = 0.005;
m = 0.0011;
ms = 0.001;
ma = m - ms;
Nma = 20;
Nms = 20;
Nt = 1000;
Tmax = 1e-6;
disp('Введите номер пункта');
    while(state ~= GetArgsState.End)
        switch(state)
            case GetArgsState.Main
                disp('1) Использовать настройки по умолчанию\n');
                disp('2) Изменить настройки по умолчанию\n');
                choise = input('');
                if(choise == 1)
                    state = GetArgsState.End;
                elseif(choise == 2)
                    state = GetArgsState.Change_Default_Settings;
                else
                    fprintf('Ошибка ввода. Попробуйте еще раз.\n');
                end
            case GetArgsState.Change_Default_Settings
                disp('\n');
                disp(['1) Изменить h: %.2f м\n' num2str(h)]);
                disp(['2) Изменить m: ' num2str(m) ' м^(-1) и ms: ' num2str(ms) ' м^(-1)\n']);
                disp(['3) Изменить m: ' num2str(m) ' м^(-1) и ma: ' num2str(ma) ' м^(-1)\n']);
                disp(['4) Изменить ms: ' num2str(ms) ' м^(-1) и ma: %.2f м^(-1)\n',num2str(ma)]);
                disp(['5) Количество точек для ma: %.d штук\n', num2str(Nma)]);
                disp(['6) Количество точек для ms: %.d штук\n', num2str(Nms)]);
                disp(['7) Количество точек для t: %.d штук\n', num2str(Nt)]);
                disp('8) Готово\n')
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
                    state = GetArgsState.Change_Nma;
                elseif(choise == 6)
                    state = GetArgsState.Change_Nms;
                elseif(choise == 7)
                    state = GetArgsState.Change_Nt;
                elseif(choise == 8)
                    state = GetArgsState.End;
                end
            case GetArgsState.Change_H
                disp('Введите h в м\n');
                h = input('');
                state = GetArgsState.Change_Default_Settings;
            case GetArgsState.Change_M_Ms
                disp('Введите m в м^(-1)\n');
                m = input('');
                disp('Введите ms в м^(-1)\n');
                ms = input('');
                ma = m - ms;
                state = GetArgsState.Change_Default_Settings;
            case GetArgsState.Change_M_Ma
                disp('Введите m в м^(-1)\n');
                m = input('');
                disp('Введите ma в м^(-1)\n');
                ma = input('');
                ms = m - ma;
                state = GetArgsState.Change_Default_Settings; 
             case GetArgsState.Change_Ms_Ma
                disp('Введите ms в м^(-1)\n');
                ms = input('');
                disp('Введите ma в м^(-1)\n');
                ma = input('');
                m = ms + ma;
                state = GetArgsState.Change_Default_Settings;
             case GetArgsState.Change_Nms
                disp('Введите количество точек для расчета ms\n');
                Nms = input('');
                state = GetArgsState.Change_Default_Settings;
             case GetArgsState.Change_Nma
                disp('Введите количество точек для расчета ma\n');
                Nma = input('');
                state = GetArgsState.Change_Default_Settings;
             case GetArgsState.Change_Nt
                disp('Введите количество точек для расчета t\n');
                Nt = input('');
                state = GetArgsState.Change_Default_Settings;
        end
    end
    
disp('Параметры:');
disp(['Толщина среды - ' num2str(h, 2) ' 1/м'])
disp(['Коэффициент экстинкции - ' num2str(m, 2) ' 1/м'])
disp(['Коэффициент рассеяния - ' num2str(ms, 2) ' 1/м'])
disp(['Коэффициент поглощения - ' num2str(ma, 2) ' 1/м'])
disp(['Количество точек для ms - ' num2str(Nms)])
disp(['Количество точек для ma - ' num2str(Nma)])
disp(['Количество точек для t - ' num2str(Nt)])

end