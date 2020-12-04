clc
clear all
close all

disp('======================================================================================================');
disp(' ');

disp('*******************************************************************************************************');
disp('* ��������� ����������� ���������� ������������ ����� �� ������������������ ���������� �������������  *');
disp('*******************************************************************************************************');

%% ������ ���� - ���� �������� ������
disp('1 ����. ���� �������� ����������������� ����������');
disp('--------------------------------------------------');
[h, m_exp, ms_exp, ma_exp, Nma, Nms, Nt, ratioF, maxMa, maxMs, dMa, dMs, n] = getArgs();

%% ������ ���� - ���������� ������������������ ���������� ������������� �������� ���������

%������� - ��������� ������������������ ������������� T_Fmax, Fmax, Tmax, F(Tmax)
[Tmax] = getTmax(h, m_exp, ms_exp, ratioF, Nt, n);

disp('2 ����. ���������� ������������������ ���������� ������������� �������� ���������');
disp('---------------------------------------------------------------------------------');
[t, F, t0, F0, dt] = calc(0, h, m_exp, ms_exp, Tmax, Nt, n);
disp(['������ ������� ���������� ������������� = ' num2str(sum(F)*dt) ' ��']);

figure()
semilogy(t * 1e12, F + 1, 'r', [t0*1e12, t0*1e12], [1, F0], 'k');
title({ '����������������� ��������� ������������� �������� ���������' ; '����� ����������� ����������� ������������� ����,'; ['������������� �� ������� ', num2str(dt * 1e12), ' ��, t0 =', num2str(t0 * 1e12), ' ��']});
xlabel('�����, ��');
ylabel('������������� ���������, ��');
grid on;
disp(' ');

%% ������ ���� - ����� ���������� �����, ��������������� ������������������ ���������� �������������

disp('3 ����. ����� ���������� �����, ��������������� ������������������ ���������� �������������');
disp('-------------------------------------------------------------------------------------------');
[ma_teor, ms_teor] = calcMaMs(F, ma_exp, ms_exp, h, Tmax, Nt, maxMa, maxMs, dMa, dMs, n);

m_teor = ma_teor + ms_teor;

[t, F_exp, t0, F0] = calc(0, h, m_teor, ms_teor, Tmax, Nt, n); 

figure()
semilogy(t * 1e12, F_exp + 1, 'r', t * 1e12, F + 1, 'b');
hold on;
semilogy([t0*1e12, t0*1e12], [1, F0], 'k', 'LineWidth', 2);
title({'���������� ������������� ����������������� ���������' ; ' ������������� �������� ���������'; ['t0 = ', num2str(t0 * 1e12), ' ��']});
legend('����������������� �������������','������������� �������������', '�������������� ���������')
xlabel('�����, ��');
ylabel('������������� ���������, ��');
grid on;
%% ����� ���������
disp('*******************************************************************************************************');
disp('*                                        ����� ������                                                 *');
disp('*******************************************************************************************************');
