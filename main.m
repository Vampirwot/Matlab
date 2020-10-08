clc
clear all

disp('Программа определения параметров рассеивающей среды по экспериментальному временному распределению');

[h, m, ms, ma, Nm, Nt] = getArgs();
disp('Параметры:');
disp(['Толщина среды - ' num2str(h, 2) ' 1/м'])
disp(['Коэффициент экстинкции - ' num2str(m, 2) ' 1/м'])
disp(['Коэффициент рассеяния - ' num2str(ms, 2) ' 1/м'])
disp(['Коэффициент поглощения - ' num2str(ma, 2) ' 1/м'])



disp('Вычисление экспериментального временного распределения импульса излучения')

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
disp(['Полученный коэффициент поглощения - ' num2str(ma, 2) ' 1/м'])
disp(['Полученный коэффициент рассеяния - ' num2str(ms, 2) ' 1/м'])

m = ma + ms;

[t, F_plusExp] = calc(h, m, ms); 

figure(2)
plot(t, F_plusExp, 'r', t, F_plus, 'b')
grid on;
hold on;