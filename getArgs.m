function [h,m,ms,ma,Nm,Nt] = getArgs()

state = GetArgsState.Main;

h = 20;
m = 2.5;
ms = 1.5;
ma = m - ms;
Nm = 10;
Nt = 1000;
disp('������� ����� ������');
    while(state ~= GetArgsState.End)
        switch(state)
            case GetArgsState.Main
                fprintf('1) ������������ ��������� �� ���������\n');
                fprintf('2) �������� ��������� �� ���������\n');
                choise = input('');
                if(choise == 1)
                    state = GetArgsState.End;
                elseif(choise == 2)
                    state = GetArgsState.Change_Default_Settings;
                else
                    fprintf('������ �����. ���������� ��� ���.\n');
                end
            case GetArgsState.Change_Default_Settings
                fprintf('\n');
                fprintf('1) �������� h: %.2f �\n', h);
                fprintf('2) �������� m: %.2f �^(-1) � ms: %.2f �^(-1)\n', m,ms);
                fprintf('3) �������� m: %.2f �^(-1) � ma: %.2f �^(-1)\n', m,ma);
                fprintf('4) �������� ms: %.2f �^(-1) � ma: %.2f �^(-1)\n', ms,ma);
                fprintf('5) ���������� ����� ��� ms � ma: %.d ����\n', Nm);
                fprintf('6) ���������� ����� ��� t: %.d ����\n', Nt);
                fprintf('7) ������\n')
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
                fprintf('������� h � �\n');
                h = input('');
                state = GetArgsState.Change_Default_Settings;
            case GetArgsState.Change_M_Ms
                fprintf('������� m � �^(-1)\n');
                m = input('');
                fprintf('������� ms � �^(-1)\n');
                ms = input('');
                ma = m - ms;
                state = GetArgsState.Change_Default_Settings;
            case GetArgsState.Change_M_Ma
                fprintf('������� m � �^(-1)\n');
                m = input('');
                fprintf('������� ma � �^(-1)\n');
                ma = input('');
                ms = m - ma;
                state = GetArgsState.Change_Default_Settings; 
             case GetArgsState.Change_Ms_Ma
                fprintf('������� ms � �^(-1)\n');
                ms = input('');
                fprintf('������� ma � �^(-1)\n');
                ma = input('');
                m = ms + ma;
                state = GetArgsState.Change_Default_Settings;
             case GetArgsState.Change_Nm
                fprintf('������� ���������� ����� ��� ������� ms � ma\n');
                Nm = input('');
                state = GetArgsState.Change_Default_Settings;
             case GetArgsState.Change_Nt
                fprintf('������� ���������� ����� ��� ������� t\n');
                Nt = input('');
                state = GetArgsState.Change_Default_Settings;
        end
    end

end