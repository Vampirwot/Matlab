function [h,m_exp,ms_exp,ma_exp,Nma,Nms,Nt,ratioF,maxMa,maxMs,dMa,dMs] = getArgs()

state = GetArgsState.Main;

%% Параметры эксперимента

h = 0.005;                  %Толщина слоя, м
Nt = 1000;                  %Количество точек временного распределения

%% Параметры экспериментального временного распределения

ma_exp = 1000;              %Коэффициент поглощения, 1/м
ms_exp = 3000;              %Коэффициент рассеяния, 1/м
m_exp = ma_exp + ms_exp;    %Коэффициент экстинкции, 1/м
ratioF = 100;               %Отношение Fmax / F(Tmax)

%% Параметры определения характеристик рассеивающей среды

Nma = 5;                   %Количество точек по ma
Nms = 5;                   %Количество точек по ms

maxMa = 3*ma_exp;           %Максимальное ma
maxMs = 3*ms_exp;           %%Максимальное ms

% Размер ячейки
dMa = maxMa/Nma;            
dMs = maxMs/Nms;

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
                disp(['1) Изменить h: ' num2str(h * 1e3, 2) ' мм']);
                disp(['2) Изменить ms: ' num2str(ms_exp / 1e3) ' 1/мм и ma: ' num2str(ma_exp / 1e3) ' 1/мм']);
                disp(['3) Количество точек для ma: ' num2str(Nma)]);
                disp(['4) Количество точек для ms: ' num2str(Nms)]);
                disp(['5) Количество точек для t: ' num2str(Nt)]);
                disp(['6) Отношение Fmax/F(Tmax): ' num2str(ratioF)]);
                disp('7) Готово');
                choise = input('');
                if(choise == 1)
                    state = GetArgsState.Change_H;
                elseif(choise == 2)
                    state = GetArgsState.Change_Ms_Ma;
                elseif(choise == 3)
                    state = GetArgsState.Change_Nma;
                elseif(choise == 4)
                    state = GetArgsState.Change_Nms;
                elseif(choise == 5)
                    state = GetArgsState.Change_Nt;
                elseif(choise == 6)
                    state = GetArgsState.Change_ratioF;    
                elseif(choise == 7)
                    state = GetArgsState.End;
                end
            case GetArgsState.Change_H
                disp('Введите h в мм');
                h = input('') / 1e3;
                state = GetArgsState.Change_Default_Settings; 
             case GetArgsState.Change_Ms_Ma
                disp('Введите ms в 1/мм');
                ms_exp = input('') * 1e3;
                disp('Введите ma в 1/мм');
                ma_exp = input('') * 1e3;
                m_exp = ms_exp + ma_exp;
                maxMa = 3*ma_exp;    
                maxMs = 3*ms_exp;           
                dMa = maxMa/Nma;            
                dMs = maxMs/Nms;
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
             case GetArgsState.Change_ratioF
                disp('Введите отношение Fmax/F(Tmax)');
                ratioF = input('');
                state = GetArgsState.Change_Default_Settings;   
        end
    end
ishod(h, m_exp, ms_exp, ma_exp, Nma, Nms, Nt, ratioF, maxMa, maxMs, dMa, dMs); 
end