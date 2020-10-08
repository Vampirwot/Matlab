clc
clear all

disp('��������� ����������� ���������� ������������ ����� �� ������������������ ���������� �������������');

[h, m, ms, ma, Nm, Nt] = getArgs();
disp('���������:');
disp(['������� ����� - ' num2str(h, 2) ' 1/�'])
disp(['����������� ���������� - ' num2str(m, 2) ' 1/�'])
disp(['����������� ��������� - ' num2str(ms, 2) ' 1/�'])
disp(['����������� ���������� - ' num2str(ma, 2) ' 1/�'])



disp('���������� ������������������ ���������� ������������� �������� ���������')

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
disp(['���������� ����������� ���������� - ' num2str(ma, 2) ' 1/�'])
disp(['���������� ����������� ��������� - ' num2str(ms, 2) ' 1/�'])

m = ma + ms;

[t, F_plusExp] = calc(h, m, ms); 

figure(2)
plot(t, F_plusExp, 'r', t, F_plus, 'b')
grid on;
hold on;