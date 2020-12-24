clc
clear all
close all
warning('off','all')

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

f = figure();
subplot(2, 1, 1)
semilogy(t * 1e12, F, 'r', [t0*1e12, t0*1e12], [1, F0], 'k');
axis([0 max(t*1e12) 0 F0])
title({ '����������������� ��������� ������������� �������� ���������' ; '����� ����������� ����������� ������������� ����,'; ['������������� �� ������� ', num2str(dt * 1e12), ' ��, t_0 =', num2str(t0 * 1e12), ' ��']});
xlabel('�����, ��');
ylabel('������������� ���������, ��');
grid on;
leftarrow = text(t0*1e12, 1, '\leftarrow');
leftarrow.Clipping= 'on';
leftarrow.Rotation=45;
text_t0 = text(leftarrow.Extent(1)+leftarrow.Extent(3),leftarrow.Extent(2)+leftarrow.Extent(4),"t_0");
text_t0.Clipping = 'on';

subplot(2, 1, 2)
p = plot(t * 1e12, F, 'r', [t0*1e12, t0*1e12], [0, F0], 'k');
axis([0 max(t*1e12) 0 F0])
%message = text(t0*1e12, F0/2, '\leftarrow t_0');
title({ '����������������� ��������� ������������� �������� ���������' ; '����� ����������� ����������� ������������� ����,'; ['������������� �� ������� ', num2str(dt * 1e12), ' ��, t_0 =', num2str(t0 * 1e12), ' ��']});
xlabel('�����, ��');
ylabel('������������� ���������, ��');
grid on;
leftarrow1 = text(t0*1e12, 0, '\leftarrow');
leftarrow1.Clipping= 'on';
leftarrow1.Rotation=45;
text_t01 = text(leftarrow1.Extent(1)+leftarrow1.Extent(3),leftarrow1.Extent(2)+leftarrow1.Extent(4),"t_0");
text_t01.Clipping = 'on';
z = zoom;
z.Enable = 'on';
z.ActionPostCallback = {@figureChangeCallback,text_t0,leftarrow,text_t01,leftarrow1};
f.SizeChangedFcn = {@figureChangeCallback,text_t0,leftarrow,text_t01,leftarrow1};

disp(' ');

%% ������ ���� - ����� ���������� �����, ��������������� ������������������ ���������� �������������

disp('3 ����. ����� ���������� �����, ��������������� ������������������ ���������� �������������');
disp('-------------------------------------------------------------------------------------------');
[ma_teor, ms_teor] = calcMaMs(F, ma_exp, ms_exp, h, Tmax, Nt, maxMa, maxMs, dMa, dMs, n);

m_teor = ma_teor + ms_teor;

[t, F_exp, t0, F0] = calc(0, h, m_teor, ms_teor, Tmax, Nt, n); 

f1 = figure();
subplot(2, 1, 1)
semilogy(t * 1e12, F_exp, 'r', t * 1e12, F, 'b');
hold on;
grid on;
semilogy([t0*1e12, t0*1e12], [1, F0], 'k', 'LineWidth', 2);
axis([0 max(t * 1e12) 0 F0])
title({'���������� ������������� � ����������������� ���������' ; ' ������������� �������� ���������'; ['t_0 = ', num2str(t0 * 1e12), ' ��']});
legend('����������������� �������������','������������� �������������', '�������������� ���������')
xlabel('�����, ��');
ylabel('������������� ���������, ��');
% text(t0*1e12, sqrt(F0), '\leftarrow t_0');
leftarrow2 = text(t0*1e12, 1, '\leftarrow');
leftarrow2.Clipping= 'on';
leftarrow2.Rotation=45;
text_t02 = text(leftarrow2.Extent(1)+leftarrow2.Extent(3),leftarrow2.Extent(2)+leftarrow2.Extent(4),"t_0");
text_t02.Clipping = 'on';

subplot(2, 1, 2)
plot(t * 1e12, F_exp, 'r', t * 1e12, F, 'b');
hold on;
plot([t0*1e12, t0*1e12], [0, F0], 'k', 'LineWidth', 2);
% text(t0*1e12, F0/2, '\leftarrow t_0')
title({'���������� ������������� � ����������������� ���������' ; ' ������������� �������� ���������'; ['t_0 = ', num2str(t0 * 1e12), ' ��']});
legend('����������������� �������������','������������� �������������', '�������������� ���������')
xlabel('�����, ��');
ylabel('������������� ���������, ��');
grid on;
leftarrow3 = text(t0*1e12, 0, '\leftarrow');
leftarrow3.Clipping= 'on';
leftarrow3.Rotation=45;
text_t03 = text(leftarrow3.Extent(1)+leftarrow3.Extent(3),leftarrow3.Extent(2)+leftarrow3.Extent(4),"t_0");
text_t03.Clipping = 'on';
z = zoom;
z.Enable = 'on';
z.ActionPostCallback = {@figureChangeCallback,text_t02,leftarrow2,text_t03,leftarrow3};
f1.SizeChangedFcn = {@figureChangeCallback,text_t02,leftarrow2,text_t03,leftarrow3};

% z = zoom;
% z.Enable = 'on';
% z.ActionPostCallback = {@figureChangeCallback,text_t0,leftarrowLine};

%% ����� ���������
disp('*******************************************************************************************************');
disp('*                                        ����� ������                                                 *');
disp('*******************************************************************************************************');
