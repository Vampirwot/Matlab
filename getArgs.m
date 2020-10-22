function [h,m_exp,ms_exp,ma_exp,Nma,Nms,Nt,ratioF,maxMa,maxMs,dMa,dMs] = getArgs()

state = GetArgsState.Main;

%% ��������� ������������

h = 0.005;                  %������� ����, �
Nt = 1000;                  %���������� ����� ���������� �������������

%% ��������� ������������������ ���������� �������������

ma_exp = 1000;              %����������� ����������, 1/�
ms_exp = 3000;              %����������� ���������, 1/�
m_exp = ma_exp + ms_exp;    %����������� ����������, 1/�
ratioF = 100;               %��������� Fmax / F(Tmax)

%% ��������� ����������� ������������� ������������ �����

Nma = 5;                   %���������� ����� �� ma
Nms = 5;                   %���������� ����� �� ms

maxMa = 3*ma_exp;           %������������ ma
maxMs = 3*ms_exp;           %%������������ ms

% ������ ������
dMa = maxMa/Nma;            
dMs = maxMs/Nms;

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
                disp(['1) �������� h: ' num2str(h * 1e3, 2) ' ��']);
                disp(['2) �������� ms: ' num2str(ms_exp / 1e3) ' 1/�� � ma: ' num2str(ma_exp / 1e3) ' 1/��']);
                disp(['3) ���������� ����� ��� ma: ' num2str(Nma)]);
                disp(['4) ���������� ����� ��� ms: ' num2str(Nms)]);
                disp(['5) ���������� ����� ��� t: ' num2str(Nt)]);
                disp(['6) ��������� Fmax/F(Tmax): ' num2str(ratioF)]);
                disp('7) ������');
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
                disp('������� h � ��');
                h = input('') / 1e3;
                state = GetArgsState.Change_Default_Settings; 
             case GetArgsState.Change_Ms_Ma
                disp('������� ms � 1/��');
                ms_exp = input('') * 1e3;
                disp('������� ma � 1/��');
                ma_exp = input('') * 1e3;
                m_exp = ms_exp + ma_exp;
                maxMa = 3*ma_exp;    
                maxMs = 3*ms_exp;           
                dMa = maxMa/Nma;            
                dMs = maxMs/Nms;
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
ishod(h, m_exp, ms_exp, ma_exp, Nma, Nms, Nt, ratioF, maxMa, maxMs, dMa, dMs); 
end