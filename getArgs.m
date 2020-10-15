function [h,m_exp,ms_exp,ma_exp,Nma,Nms,Nt] = getArgs()

state = GetArgsState.Main;

h = 0.005;
m_exp = 0.0011;
ms_exp = 0.001;
ma_exp = m_exp - ms_exp;
Nma = 20;
Nms = 20;
Nt = 1000;
    while(state ~= GetArgsState.End)
        switch(state)
            case GetArgsState.Main
                disp('Использовать настройки по умолчанию? y/n');
                choise = input('','s');
                if(isempty(choise) || choise == 'y')
                    state = GetArgsState.End;
                elseif(choise == 'n')
                    state = GetArgsState.Change_Default_Settings;
                else
                    disp('Ошибка ввода. Попробуйте еще раз.');
                end
            case GetArgsState.Change_Default_Settings
                disp('Введите номер пункта');
                disp(['1) Изменить h: ' num2str(h, 2) ' м']);
                disp(['2) Изменить m: ' num2str(m_exp) ' 1/м и ms: ' num2str(ms_exp) ' 1/м']);
                disp(['3) Изменить m: ' num2str(m_exp) ' 1/м и ma: ' num2str(ma_exp) ' 1/м']);
                disp(['4) Изменить ms: ' num2str(ms_exp) ' 1/м и ma: ' num2str(ma_exp) ' 1/м']);
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
                disp('Введите h в мм');
                h = input('') / 1e3;
                state = GetArgsState.Change_Default_Settings;
            case GetArgsState.Change_M_Ms
                disp('Введите m в 1/мм');
                m_exp = input('') / 1e3;
                disp('Введите ms в 1/мм');
                ms_exp = input('') / 1e3;
                ma_exp = m_exp - ms_exp;
                state = GetArgsState.Change_Default_Settings;
            case GetArgsState.Change_M_Ma
                disp('Введите m в 1/мм');
                m_exp = input('') / 1e3;
                disp('Введите ma в 1/мм');
                ma_exp = input('') / 1e3;
                ms_exp = m_exp - ma_exp;
                state = GetArgsState.Change_Default_Settings; 
             case GetArgsState.Change_Ms_Ma
                disp('Введите ms в 1/мм');
                ms_exp = input('') / 1e3;
                disp('Введите ma в 1/мм');
                ma_exp = input('') / 1e3;
                m_exp = ms_exp + ma_exp;
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
 if(getVersion()<2016)
     disp('+----------------------------------------------+');
     disp(['| Параметр                      | ' 'Значение     |']);
     disp('+----------------------------------------------+');
     disp([' Толщина среды                    ',num2str(h, '%10.2e') ' м ']);
     disp([' Коэффициент экстинкции           ',num2str(m_exp, '%-8.2e') ' 1/м ']);
     disp([' Коэффициент рассеяния            ',num2str(ms_exp, '%-8.2e') ' 1/м ']);
     disp([' Коэффициент поглощения           ',num2str(ma_exp, '%-8.2e') ' 1/м ']);
     disp([' Количество точек для ms          ',num2str(Nms,'%-8.2u') ' ']);
     disp([' Количество точек для ma          ',num2str(Nma,'%-8.2u') ' ']);
     disp([' Количество точек для t           ',num2str(Nt,'% 8u') ' ']);
     disp('+----------------------------------------------+');
 else
    printTable(...
        {'Параметр','Значение'},...
        {'Толщина среды',strcat(num2str(h, 2),' м')},...
        {'Коэффициент экстинкции',strcat( num2str(m_exp, 2),' 1/м')},...
        {'Коэффициент рассеяния',strcat(num2str(ms_exp, 2),' 1/м')},...
        {'Коэффициент поглощения',strcat(num2str(ma_exp, 2),' 1/м')},...
        {'Количество точек для ms',num2str(Nms)},...
        {'Количество точек для ma', num2str(Nma)},...
        {'Количество точек для t',num2str(Nt)});
 end
    
end