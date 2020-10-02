clc
clear all

greetings = sprintf('��������� ����������� ���������� ������������ ����� �� ������������������ ���������� �������������');
disp(greetings);

[h, m, ms, ma] = getArgs();
fprintf('���������:\n');
fprintf('������� ����� - %.2f �\n', h)
fprintf('����������� ���������� - %.2f �^(-1)\n', m)
fprintf('����������� ��������� - %.2f �^(-1)\n', ms)
fprintf('����������� ���������� - %.2f �^(-1)\n', ma)

[t, F_plus] = calc(h, m, ms);

figure(1)
plot(t, F_plus)
grid on;
