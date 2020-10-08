function [h,m,ms,ma,Nma,Nms,Nt] = getArgs()

state = GetArgsState.Main;

h = 0.005;
m = 0.0011;
ms = 0.001;
ma = m - ms;
Nma = 20;
Nms = 20;
Nt = 1000;
disp('Введите номер пункта');
    while(state ~= GetArgsState.End)
        switch(state)
            case GetArgsState.Main
                disp('1) Использовать настройки по умолчанию');
                disp('2) Изменить настройки по умолчанию');
                choise = input('');
                if(choise == 1)
                    state = GetArgsState.End;
                elseif(choise == 2)
                    state = GetArgsState.Change_Default_Settings;
                else
                    disp('Ошибка ввода. Попробуйте еще раз.');
                end
            case GetArgsState.Change_Default_Settings
                disp(['1) Изменить h: ' num2str(h, 2) ' 1/м']);
                disp(['2) Изменить m: ' num2str(m) ' 1/м и ms: ' num2str(ms) ' 1/м']);
                disp(['3) Изменить m: ' num2str(m) ' 1/м и ma: ' num2str(ma) ' 1/м']);
                disp(['4) Изменить ms: ' num2str(ms) ' 1/м и ma: ' num2str(ma) ' 1/м']);
                disp(['5) Количество точек для ma: ' num2str(Nma)]);
                disp(['6) Количество точек для ms: ' num2str(Nms)]);
                disp(['7) Количество точек для t: ' num2str(Nt)]);
                disp('8) Готово')
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
                disp('Введите h в м');
                h = input('');
                state = GetArgsState.Change_Default_Settings;
            case GetArgsState.Change_M_Ms
                disp('Введите m в 1/м');
                m = input('');
                disp('Введите ms в 1/м');
                ms = input('');
                ma = m - ms;
                state = GetArgsState.Change_Default_Settings;
            case GetArgsState.Change_M_Ma
                disp('Введите m в 1/м');
                m = input('');
                disp('Введите ma в 1/м');
                ma = input('');
                ms = m - ma;
                state = GetArgsState.Change_Default_Settings; 
             case GetArgsState.Change_Ms_Ma
                disp('Введите ms в 1/м');
                ms = input('');
                disp('Введите ma в 1/м');
                ma = input('');
                m = ms + ma;
                state = GetArgsState.Change_Default_Settings;
             case GetArgsState.Change_Nms
                disp('Введите количество точек для расчета ms');
                Nms = input('');
                state = GetArgsState.Change_Default_Settings;
             case GetArgsState.Change_Nma
                disp('Введите количество точек для расчета ma');
                Nma = input('');
                state = GetArgsState.Change_Default_Settings;
             case GetArgsState.Change_Nt
                disp('Введите количество точек для расчета t');
                Nt = input('');
                state = GetArgsState.Change_Default_Settings;
        end
    end
    disp('');
    disp('+-----------------+----------+--------------+');
    disp('| Параметр        | Значение | Ед.измерения |');
    disp('+-----------------+----------+--------------+');
disp('Параметры:');
disp(['Толщина среды - ' num2str(h, 2) ' м'])
disp(['Коэффициент экстинкции - ' num2str(m, 2) ' 1/м'])
disp(['Коэффициент рассеяния - ' num2str(ms, 2) ' 1/м'])
disp(['Коэффициент поглощения - ' num2str(ma, 2) ' 1/м'])
disp(['Количество точек для ms - ' num2str(Nms)])
disp(['Количество точек для ma - ' num2str(Nma)])
disp(['Количество точек для t - ' num2str(Nt)])

end