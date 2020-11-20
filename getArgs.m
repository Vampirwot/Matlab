function [h,m_exp,ms_exp,ma_exp,Nma,Nms,Nt,ratioF,maxMa,maxMs,dMa,dMs,n] = getArgs()

state = GetArgsState.Main;

%% ��������� ������������

h = 0.005;                  %������� ����, �
Nt = 1000;                  %���������� ����� ���������� �������������
n = 1.5;                    %���������� �����������

%% ��������� ������������������ ���������� �������������

ma_exp = 1000;              %����������� ����������, 1/�
ms_exp = 3000;              %����������� ���������, 1/�
m_exp = ma_exp + ms_exp;    %����������� ����������, 1/�
ratioF = 100;               %��������� Fmax / F(Tmax)

%% ��������� ����������� ������������� ������������ �����

Nma = 10;                   %���������� ����� �� ma
Nms = 10;                   %���������� ����� �� ms

maxMa = 3*ma_exp;           %������������ ma
maxMs = 3*ms_exp;           %%������������ ms

% ������ ������
dMa = maxMa/Nma;            
dMs = maxMs/Nms;

disp('��������� �� ���������'); 
ishod(h, m_exp, ms_exp, ma_exp, Nma, Nms, Nt, ratioF, maxMa, maxMs, dMa, dMs, n); 

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
                disp(['3) �������� ���������� ����� ��� ma: ' num2str(Nma)]);
                disp(['4) �������� ���������� ����� ��� ms: ' num2str(Nms)]);
                disp(['5) �������� ���������� ����� ��� t: ' num2str(Nt)]);
                disp(['6) �������� ��������� Fmax/F(Tmax): ' num2str(ratioF)]);
                disp(['7) �������� ���������� ����������� n: ' num2str(n)]);
                disp('8) ������');
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
                    state = GetArgsState.Change_N;
                elseif(choise == 8)
                    state = GetArgsState.Print_Table;
                end
            case GetArgsState.Change_H
                disp('������� h � ��');
                temp = input('');
                if(checkCorrSign(temp) && checkNumber(temp))
                    h = temp / 1e3;
                    state = GetArgsState.Change_Default_Settings; 
                end
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
             case GetArgsState.Change_N
                disp('������� ���������� �����������');
                n = input('');
                state = GetArgsState.Change_Default_Settings;
             case GetArgsState.Print_Table
                disp('�������� ����������������� ���������'); 
                ishod(h, m_exp, ms_exp, ma_exp, Nma, Nms, Nt, ratioF, maxMa, maxMs, dMa, dMs, n);
                state = GetArgsState.End;
        end
    end 
    
    function [isCorrSign] = checkCorrSign(num)
        if(num < 0)
           disp('������: ������� ������������� �����');
           isCorrSign = false;
        end
        isCorrSign = true;
    end

    function [isDouble] = checkDouble(num)
       if(int32(num) < num)
           disp('������: ������� ������� �����')
           isDouble = false;
       end
       isDouble = true;
    end

    function [isNumber] = checkNumber(num)
       if(~isnumeric(num))
           disp('������: ������� �� �����')
           isNumber = false;
       end
       isNumber = true;
    end

    function [num] = inputUInt()
        %temp = 
    end
end