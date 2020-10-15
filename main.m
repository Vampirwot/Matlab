disp('======================================================================================================');
disp(' ');

disp('*******************************************************************************************************');
disp('* ��������� ����������� ���������� ������������ ����� �� ������������������ ���������� �������������  *');
disp('*******************************************************************************************************');

%% ������ ���� - ���� �������� ������
[h, m_exp, ms_exp, ma_exp, Nma, Nms, Nt, ratioF] = getArgs();

%% ������ ���� - ���������� ������������������ ���������� ������������� �������� ���������

%������� - ��������� ������������������ ������������� T_Fmax, Fmax, Tmax, F(Tmax)
[Tmax] = getTmax(h, m_exp, ms_exp, ratioF);

disp('���������� ������������������ ���������� ������������� �������� ���������');
[t, F_plus] = calc(h, m_exp, ms_exp, Tmax, Nt);

figure(1)
title('����������������� ��������� ������������� �������� ��������� ����� ����������� ����������� ������������� ����');
plot(t, F_plus, 'r');
xlabel('�����, �');
ylabel('�������� �������� ���������, ��/�');
grid on;

%% ������ ���� - ����� ���������� �����, ��������������� ������������������ ���������� �������������

disp('����� ���������� �����, ��������������� ������������������ ���������� �������������');

[ma_teor, ms_teor] = calcMaMs(F_plus, ma_exp, ms_exp, h, Nma, Nms, Tmax, Nt);

m_teor = ma_teor + ms_teor;

[t, F_plusExp] = calc(h, m_teor, ms_teor, Tmax, Nt); 

figure(2)
title('��������� ����������� �������������� ���������� ������������� �������� ��������� � �����������������');
plot(t, F_plusExp, 'r', t, F_plus, 'b');
xlabel('�����, �');
ylabel('�������� �������� ���������, ��/�');
grid on;
%% ����� ���������
disp('*******************************************************************************************************');
disp('*                                    ����� ������ ���������                                           *');
disp('*******************************************************************************************************');
