clc
clear all


disp('Программа определения параметров рассеивающей среды по экспериментальному временному распределению');

[h, m, ms, ma, Nm, Nt] = getArgs();
fprintf('Параметры:\n');
fprintf('Толщина среды - %.2f м\n', h)
fprintf('Коэффициент экстинкции - %.2f м^(-1)\n', m)
fprintf('Коэффициент рассеяния - %.2f м^(-1)\n', ms)
fprintf('Коэффициент поглощения - %.2f м^(-1)\n', ma)

disp('Вычисление экспериментального временного распределения импульса излучения');

[t, F_plus] = calc(h, m, ms);

figure(1)
plot(t, F_plus)
grid on;

%% Второй этап

maxMa = 3*(m - ms);
maxMs = 3*ms;

Ma = 0:maxMa/Nm:maxMa;
Ms = 0:maxMs/Nm:maxMs;

[ma,ms] = calcMaMs(F_plus, Ma, Ms,h);
fprintf('Полученный коэффициент поглощения - %.2f м^(-1)\n', ma)
fprintf('Полученный коэффициент рассеяния - %.2f м^(-1)\n', ms)

m = ma + ms;

[t, F_plusExp] = calc(h, m, ms); 

figure(2)
plot(t, F_plusExp, 'r', t, F_plus, 'b')
grid on;
hold on;