function [h,m_exp,ms_exp,ma_exp,Nma,Nms,Nt,ratioF,maxMa,maxMs,dMa,dMs,n] = getArgs()

state = GetArgsState.Main;

%% Параметры эксперимента

h = 0.005;                  %Толщина слоя, м
Nt = 1000;                  %Количество точек временного распределения
n = 1.5;                    %Показатель преломления

%% Параметры экспериментального временного распределения

ma_exp = 1000;              %Коэффициент поглощения, 1/м
ms_exp = 3000;              %Коэффициент рассеяния, 1/м
m_exp = ma_exp + ms_exp;    %Коэффициент экстинкции, 1/м
ratioF = 100;               %Отношение Fmax / F(Tmax)

%% Параметры определения характеристик рассеивающей среды

Nma = 50;                   %Количество точек по ma
Nms = 50;                   %Количество точек по ms

maxMa = 3*ma_exp;           %Максимальное ma
maxMs = 3*ms_exp;           %%Максимальное ms

% Размер ячейки
dMa = maxMa/Nma;            
dMs = maxMs/Nms;

disp('Параметры по умолчанию'); 
ishod(h, m_exp, ms_exp, ma_exp, Nma, Nms, Nt, ratioF, maxMa, maxMs, dMa, dMs, n); 

    while(state ~= GetArgsState.End)
        switch(state)
            case GetArgsState.Main
                disp('Использовать параметры по умолчанию? y/n');
                choise = input('','s');
                if(isempty(choise) || choise == 'y')
                    state = GetArgsState.End;
                elseif(choise == 'n')
                    state = GetArgsState.Change_Default_Settings;
                else
                    disp('Ошибка ввода. Попробуйте еще раз.');
                end
            case GetArgsState.Change_Default_Settings
                disp(['1) Изменить h: ' num2str(h * 1e3, 2) ' мм']);
                disp(['2) Изменить ms: ' num2str(ms_exp / 1e3) ' 1/мм и ma: ' num2str(ma_exp / 1e3) ' 1/мм']);
                disp(['3) Изменить количество точек для ma: ' num2str(Nma)]);
                disp(['4) Изменить количество точек для ms: ' num2str(Nms)]);
                disp(['5) Изменить количество точек для t: ' num2str(Nt)]);
                disp(['6) Изменить отношение Fmax/F(Tmax): ' num2str(ratioF)]);
                disp(['7) Изменить показатель преломления n: ' num2str(n)]);
                disp('8) Конец ввода');
                disp('Введите номер пункта: ');
                [choise, isChoise] = inputChoise();
                if(~isChoise)
                    continue
                end
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
                    state = GetArgsState.Change_N;
                elseif(isempty(choise) || choise == 8)
                    state = GetArgsState.Print_Table;
                else
                    disp('Ошибка ввода. Попробуйте еще раз.');
                end
            case GetArgsState.Change_H
                disp('Введите h в мм');
                [num, isUNumber] = inputUNumber();
                if(~isUNumber)
                    continue
                end
                h = num / 1e3;
                state = GetArgsState.Change_Default_Settings; 
             case GetArgsState.Change_Ms_Ma
                disp('Введите ms в 1/мм');
                [num, isUNumber] = inputUNumber();
                if(~isUNumber)
                    continue
                end
                ms_exp = num * 1e3;
                disp('Введите ma в 1/мм');
                [num, isUNumber] = inputUNumber();
                if(~isUNumber)
                    continue
                end
                ma_exp = num * 1e3;
                m_exp = ms_exp + ma_exp;
                maxMa = 3*ma_exp;    
                maxMs = 3*ms_exp;           
                dMa = maxMa/Nma;            
                dMs = maxMs/Nms;
                state = GetArgsState.Change_Default_Settings;
             case GetArgsState.Change_Nms
                disp('Введите количество точек для расчета ms');
                [num, isUInt] = inputUInt();
                if(~isUInt)
                    continue
                end
                Nms = num;
                dMs = maxMs/Nms;
                state = GetArgsState.Change_Default_Settings;
             case GetArgsState.Change_Nma
                disp('Введите количество точек для расчета ma');
                [num, isUInt] = inputUInt();
                if(~isUInt)
                    continue
                end
                Nma = num;
                dMa = maxMa/Nma;
                state = GetArgsState.Change_Default_Settings;
             case GetArgsState.Change_Nt
                disp('Введите количество точек для расчета t');
                [num, isUInt] = inputUInt();
                if(~isUInt)
                    continue
                end
                Nt = num;
                state = GetArgsState.Change_Default_Settings;
             case GetArgsState.Change_ratioF
                disp('Введите отношение Fmax/F(Tmax)');
                [num, isUInt] = inputUInt();
                if(~isUInt)
                    continue
                end
                ratioF = num;
                state = GetArgsState.Change_Default_Settings;
             case GetArgsState.Change_N
                disp('Введите показатель преломления');
                [num, isUNumber] = inputUNumber();
                if(~isUNumber)
                    continue
                end
                n = num;
                state = GetArgsState.Change_Default_Settings;
             case GetArgsState.Print_Table
                disp('Исходные экспериментальные параметры'); 
                ishod(h, m_exp, ms_exp, ma_exp, Nma, Nms, Nt, ratioF, maxMa, maxMs, dMa, dMs, n);
                state = GetArgsState.End;
        end
    end 
    
    function [num, isUInt] = inputUInt()
       
            num = str2num(input('','s'));
            
            if(isempty(num))
                disp('Ошибка: Введено не число')
                isUInt = false;
                return
            end
            
            if(int32(num) < num)
               disp('Ошибка: Введено дробное число')
               isUInt = false;
               return
            end
            
            if(num < 0)
               disp('Ошибка: Введено отрицательное число')
               isUInt = false;
               return
            end
            
            if(num == 0)
               disp('Ошибка: Введено неверное число')
               isUInt = false;
               return
            end 
            isUInt = true;
    end

    function [num, isUNumber] = inputUNumber()
        
            num = str2num(input('','s'));
            if(isempty(num))
                disp('Ошибка: Введено не число')
                isUNumber = false;
                return
            end
            
            if(num < 0)
               disp('Ошибка: Введено отрицательное число')
               isUNumber = false;
               return
            end
            
            if(num == 0)
               disp('Ошибка: Введено неверное число')
               isUNumber = false;
               return
            end 
            isUNumber = true; 
    end

     function [num, isChoise] = inputChoise()

                numStr = input('','s');
                if(strlength(numStr) == 0)
                   isChoise = true;
                   num = [];
                   return
                end
                num = str2num(numStr);  
                if(num < 0)
                   disp('Ошибка: Введено отрицательное число')
                   isChoise = false;
                   return
                end

                if(isempty(num))
                disp('Ошибка: Введено не число')
                isChoise = false;
                return
                end
        
                isChoise = true; 
        end
end