clc
clear all

disp('Программа определения параметров рассеивающей среды по экспериментальному временному распределению');

[h, m, ms, ma, Nma, Nms, Nt] = getArgs();

disp('Определение Tmax');
[Tmax] = getTmax(h, m, ms);
disp('Вычисление экспериментального временного распределения импульса излучения');
[t, F_plus] = calc(h, m, ms, Tmax, Nt);

[temp t1] = min(abs(t-Tmax));

figure(1)
plot(t, F_plus, 'r',Tmax, F_plus(t1), '*');
grid on;

%% Второй этап

% [ma,ms] = calcMaMs(F_plus, ma, ms, h, Nma, Nms, Tmax, Nt);
% 
% m = ma + ms;
% 
% [t, F_plusExp] = calc(h, m, ms, Tmax, Nt); 
% 
% figure(2)
% plot(t, F_plusExp, 'r', t, F_plus, 'b')
% grid on;