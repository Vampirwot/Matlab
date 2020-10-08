clc
clear all

disp('��������� ����������� ���������� ������������ ����� �� ������������������ ���������� �������������');

[h, m, ms, ma, Nma, Nms, Nt, Tmax] = getArgs();


disp('���������� ������������������ ���������� ������������� �������� ���������');

[t, F_plus] = calc(h, m, ms, Tmax, Nt);

figure(1)
plot(t, F_plus)
grid on;

%% ������ ����

[ma,ms] = calcMaMs(F_plus, ma, ms, h, Nma, Nms, Tmax, Nt);

m = ma + ms;

[t, F_plusExp] = calc(h, m, ms, Tmax, Nt); 

figure(2)
plot(t, F_plusExp, 'r', t, F_plus, 'b')
grid on;
hold on;