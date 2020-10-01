clc
clear all

greetings = sprintf('Программа определения параметров рассеивающей среды по экспериментальному временному распределению');
disp(greetings);

[h, m, ms, ma] = getArgs();
fprintf('Параметры:\n');
fprintf('Толщина среды - %.2f м\n', h)
fprintf('Коэффициент экстинкции - %.2f м^(-1)\n', m)
fprintf('Коэффициент рассеяния - %.2f м^(-1)\n', ms)
fprintf('Коэффициент поглощения - %.2f м^(-1)\n', ma)

[t, F_plus] = calc(h, m, ms);

figure(1)
plot(t, F_plus)
grid on;
