function [h,m,ms,ma] = getArgs()

state = GetArgsState.Main;

h = 20;
m = 2.5;
ms = 1.5;
ma = m - ms;
disp("¬ведите номер пункта");
    while(state ~= GetArgsState.End)
        switch(state)
            case GetArgsState.Main
                fprintf("1) »спользовать настройки по умолчанию\n");
                fprintf("2) »зменить настройки по умолчанию\n");
                choise = input("");
                if(choise == 1)
                    state = GetArgsState.End;
                elseif(choise == 2)
                    state = GetArgsState.Change_Default_Settings;
                else
                    fprintf("ќшибка ввода. ѕопробуйте еще раз.\n");
                end
                
            case GetArgsState.Change_Default_Settings
                fprintf('\n');
                fprintf('1) »зменить h: %.2f м\n', h);
                fprintf('2) »зменить m: %.2f м^(-1) и ms: %.2f м^(-1)\n', m,ms);
                fprintf('3) »зменить m: %.2f м^(-1) и ma: %.2f м^(-1)\n', m,ma);
                fprintf('4) »зменить ms: %.2f м^(-1) и ma: %.2f м^(-1)\n', ms,ma);
                fprintf('5) √отово\n')
                choise = input("");
                if(choise == 1)
                    state = GetArgsState.Change_H;
                elseif(choise == 2)
                    state = GetArgsState.Change_M_Ms;
                elseif(choise == 3)
                    state = GetArgsState.Change_M_Ma;
                elseif(choise == 4)
                    state = GetArgsState.Change_Ms_Ma;
                elseif(choise == 5)
                    state = GetArgsState.End;
                end
            case GetArgsState.Change_H
                fprintf('¬ведите h в м\n');
                h = input("");
                state = GetArgsState.Change_Default_Settings;
            case GetArgsState.Change_M_Ms
                fprintf('¬ведите m в м^(-1)\n');
                m = input("");
                fprintf('¬ведите ms в м^(-1)\n');
                ms = input("");
                ma = m - ms;
                state = GetArgsState.Change_Default_Settings;
            case GetArgsState.Change_M_Ma
                fprintf('¬ведите m в м^(-1)\n');
                m = input("");
                fprintf('¬ведите ma в м^(-1)\n');
                ma = input("");
                ms = m - ma;
                state = GetArgsState.Change_Default_Settings; 
             case GetArgsState.Change_Ms_Ma
                fprintf('¬ведите ms в м^(-1)\n');
                ms = input("");
                fprintf('¬ведите ma в м^(-1)\n');
                ma = input("");
                m = ms + ma;
                state = GetArgsState.Change_Default_Settings;
        end
    end

end

