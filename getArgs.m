function [h,m_exp,ms_exp,ma_exp,Nma,Nms,Nt,ratioF] = getArgs()

state = GetArgsState.Main;

h = 0.005;
m_exp = 0.0011;
ms_exp = 0.001;
ma_exp = m_exp - ms_exp;
Nma = 20;
Nms = 20;
Nt = 1000;
ratioF = 100;
    while(state ~= GetArgsState.End)
        switch(state)
            case GetArgsState.Main
                disp('������������ ��������� �� ���������? y/n');
                choise = input('','s');
                if(isempty(choise) || choise == 'y')
                    state = GetArgsState.End;
                elseif(choise == 'n')
                    state = GetArgsState.Change_Default_Settings;
                else
                    disp('������ �����. ���������� ��� ���.');
                end
            case GetArgsState.Change_Default_Settings
                disp('������� ����� ������');
                disp(['1) �������� h: ' num2str(h, 2) ' �']);
                disp(['2) �������� m: ' num2str(m_exp) ' 1/� � ms: ' num2str(ms_exp) ' 1/�']);
                disp(['3) �������� m: ' num2str(m_exp) ' 1/� � ma: ' num2str(ma_exp) ' 1/�']);
                disp(['4) �������� ms: ' num2str(ms_exp) ' 1/� � ma: ' num2str(ma_exp) ' 1/�']);
                disp(['5) ���������� ����� ��� ma: ' num2str(Nma)]);
                disp(['6) ���������� ����� ��� ms: ' num2str(Nms)]);
                disp(['7) ���������� ����� ��� t: ' num2str(Nt)]);
                disp(['8) ��������� Fmax/F(Tmax): ' num2str(ratioF)]);
                disp('9) ������');
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
                    state = GetArgsState.Change_ratioF;    
                elseif(choise == 9)
                    state = GetArgsState.End;
                end
            case GetArgsState.Change_H
                disp('������� h � ��');
                h = input('') / 1e3;
                state = GetArgsState.Change_Default_Settings;
            case GetArgsState.Change_M_Ms
                disp('������� m � 1/��');
                m_exp = input('') / 1e3;
                disp('������� ms � 1/��');
                ms_exp = input('') / 1e3;
                ma_exp = m_exp - ms_exp;
                state = GetArgsState.Change_Default_Settings;
            case GetArgsState.Change_M_Ma
                disp('������� m � 1/��');
                m_exp = input('') / 1e3;
                disp('������� ma � 1/��');
                ma_exp = input('') / 1e3;
                ms_exp = m_exp - ma_exp;
                state = GetArgsState.Change_Default_Settings; 
             case GetArgsState.Change_Ms_Ma
                disp('������� ms � 1/��');
                ms_exp = input('') / 1e3;
                disp('������� ma � 1/��');
                ma_exp = input('') / 1e3;
                m_exp = ms_exp + ma_exp;
                state = GetArgsState.Change_Default_Settings;
             case GetArgsState.Change_Nms
                disp('������� ���������� ����� ��� ������� ms');
                Nms = input('');
                state = GetArgsState.Change_Default_Settings;
             case GetArgsState.Change_Nma
                disp('������� ���������� ����� ��� ������� ma');
                Nma = input('');
                state = GetArgsState.Change_Default_Settings;
             case GetArgsState.Change_Nt
                disp('������� ���������� ����� ��� ������� t');
                Nt = input('');
                state = GetArgsState.Change_Default_Settings;
             case GetArgsState.Change_ratioF
                disp('������� ��������� Fmax/F(Tmax)');
                ratioF = input('');
                state = GetArgsState.Change_Default_Settings;   
        end
    end
 disp('�������� ������');   
 if(getVersion()<2016)
     disp('+----------------------------------------------+');
     disp(['| ��������                      | ' '��������     |']);
     disp('+----------------------------------------------+');
     disp([' ������� �����, �                 ',num2str(h, '%10.2e') ' ']);
     disp([' ����������� ����������, 1/�      ',num2str(m_exp, '%-8.2e') ' ']);
     disp([' ����������� ���������, 1/�       ',num2str(ms_exp, '%-8.2e') ' ']);
     disp([' ����������� ����������, 1/�      ',num2str(ma_exp, '%-8.2e') ' ']);
     disp([' ���������� ����� ��� ms          ',num2str(Nms,'%-8.2u') ' ']);
     disp([' ���������� ����� ��� ma          ',num2str(Nma,'%-8.2u') ' ']);
     disp([' ���������� ����� ��� t           ',num2str(Nt,'% 8u') ' ']);
     disp([' ��������� Fmax/F(Tmax)           ',num2str(ratioF) ' ']);
     disp('+----------------------------------------------+');
 else
    printTable(...
        {'��������','��������'},...
        {'������� �����',strcat(num2str(h, 2),' �')},...
        {'����������� ����������',strcat( num2str(m_exp, 2),' 1/�')},...
        {'����������� ���������',strcat(num2str(ms_exp, 2),' 1/�')},...
        {'����������� ����������',strcat(num2str(ma_exp, 2),' 1/�')},...
        {'���������� ����� ��� ms',num2str(Nms)},...
        {'���������� ����� ��� ma', num2str(Nma)},...
        {'���������� ����� ��� t',num2str(Nt)},...
        {'��������� Fmax/F(Tmax)',num2str(ratioF)})
 end
    
end