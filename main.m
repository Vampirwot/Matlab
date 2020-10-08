clc
clear all


disp('��������� ����������� ���������� ������������ ����� �� ������������������ ���������� �������������');

[h, m, ms, ma, Nm, Nt] = getArgs();
fprintf('���������:\n');
fprintf('������� ����� - %.2f �\n', h)
fprintf('����������� ���������� - %.2f �^(-1)\n', m)
fprintf('����������� ��������� - %.2f �^(-1)\n', ms)
fprintf('����������� ���������� - %.2f �^(-1)\n', ma)

disp('���������� ������������������ ���������� ������������� �������� ���������');

[t, F_plus] = calc(h, m, ms);

figure(1)
plot(t, F_plus)
grid on;

%% ������ ����

maxMa = 3*(m - ms);
maxMs = 3*ms;

Ma = 0:maxMa/Nm:maxMa;
Ms = 0:maxMs/Nm:maxMs;

[ma,ms] = calcMaMs(F_plus, Ma, Ms,h);
fprintf('���������� ����������� ���������� - %.2f �^(-1)\n', ma)
fprintf('���������� ����������� ��������� - %.2f �^(-1)\n', ms)

m = ma + ms;

[t, F_plusExp] = calc(h, m, ms); 

figure(2)
plot(t, F_plusExp, 'r', t, F_plus, 'b')
grid on;
hold on;