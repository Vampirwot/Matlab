clc
clear all
close all
warning('off','all')

ps = 1e12;

disp('======================================================================================================');
disp(' ');

disp('*******************************************************************************************************');
disp('* Программа определения параметров рассеивающей среды по экспериментальному временному распределению  *');
disp('*******************************************************************************************************');

%% Первый этап - ввод исходных данных
disp('1 этап. Ввод исходных экспериментальных параметров');
disp('--------------------------------------------------');
[h, m_exp, ms_exp, ma_exp, Nma, Nms, Nt, ratioF, maxMa, maxMs, dMa, dMs, n] = getArgs();

%% Второй этап - Вычисление экспериментального временного распределения импульса излучения

%Подэтап - Параметры экспериментального распределения T_Fmax, Fmax, Tmax, F(Tmax)
[Tmax] = getTmax(h, m_exp, ms_exp, ratioF, Nt, n);

disp('2 этап. Вычисление экспериментального временного распределения импульса излучения');
disp('---------------------------------------------------------------------------------');
[t, F, t0, F0, dt] = calc(0, h, m_exp, ms_exp, Tmax, Nt, n);
disp(['Полная энергия временного распределения = ' num2str(sum(F)*dt) ' Дж']);

F_max = max(F);

f = figure();
subplot(2, 1, 1)
F0_legend = sprintf('Баллистический компонент F0: %.2e Вт', F0);
semilogy([t0*ps, t0*ps], [1, F0], 'k');
hold on;
grid on;
semilogy(t * ps, F, 'r');
title({ 'Экспериментальное временное распределение импульса излучения' ; 'после прохождения однородного рассеивающего слоя,'; ['дискретизация по времени ', num2str(dt * 1e12), ' пс, t_0 =', num2str(t0 * 1e12), ' пс']});
xlabel('Время, пс');
ylabel('Интенсивность излучения, Вт');
legend(F0_legend,'Рассеянный компонент')
if (F0 / max(F) > 1)
    axis([0 max(t * ps) 0 F0 * 10])
else
    axis([0 max(t * ps) 0 F_max * 10])
end

leftarrow = text(t0*ps, 1, '\leftarrow');
leftarrow.Clipping= 'on';
leftarrow.Rotation=45;
text_t0 = text(leftarrow.Extent(1)+leftarrow.Extent(3),leftarrow.Extent(2)+leftarrow.Extent(4),'t_0');
text_t0.Clipping = 'on';

subplot(2, 1, 2)
if (F0 / max(F) > 1)
    plot([t0*ps, t0*ps], [0, F_max * 1.1], 'k');
    axis([0 max(t * ps) 0 F_max * 1.3])
else
    plot([t0*ps, t0*ps], [0, F_max * 0.9], 'k');
    axis([0 max(t * ps) 0 F_max * 1.1])
end
hold on;
grid on;
plot(t * ps, F, 'r');
title({ 'Экспериментальное временное распределение импульса излучения' ; 'после прохождения однородного рассеивающего слоя,'; ['дискретизация по времени ', num2str(dt * 1e12), ' пс, t_0 =', num2str(t0 * 1e12), ' пс']});
xlabel('Время, пс');
ylabel('Интенсивность излучения, Вт');
legend(F0_legend,'Рассеянный компонент')
leftarrow1 = text(t0*ps, 0, '\leftarrow');
leftarrow1.Clipping= 'on';
leftarrow1.Rotation=45;
text_t01 = text(leftarrow1.Extent(1)+leftarrow1.Extent(3),leftarrow1.Extent(2)+leftarrow1.Extent(4),'t_0');
text_t01.Clipping = 'on';
z = zoom;
z.Enable = 'on';
z.ActionPostCallback = {@figureChangeCallback,text_t0,leftarrow,text_t01,leftarrow1};
f.SizeChangedFcn = {@figureChangeCallback,text_t0,leftarrow,text_t01,leftarrow1};

disp(' ');

%% Третий этап - Поиск параметров среды, соответствующих экспериментальному временному распределению

disp('3 этап. Поиск параметров среды, соответствующих экспериментальному временному распределению');
disp('-------------------------------------------------------------------------------------------');
[ma_teor, ms_teor] = calcMaMs(F, ma_exp, ms_exp, h, Tmax, Nt, maxMa, maxMs, dMa, dMs, n);

m_teor = ma_teor + ms_teor;

[t, F_teor, t0, F0] = calc(0, h, m_teor, ms_teor, Tmax, Nt, n); 

F_teor_max = max(F_teor);
f1 = figure();
subplot(2, 1, 1)
semilogy(t * ps, F, 'b', t * ps, F_teor, 'r');
hold on;
grid on;
semilogy([t0*ps, t0*ps], [1, F0], 'k');
axis([0 max(t * ps) 0 max(F0,max(F_teor_max,F_max)) * 10])

title({'Полученное теоретическое и экспериментальное временные' ; ' распределения импульса излучения'; ['t_0 = ', num2str(t0 * ps), ' пс']});
xlabel('Время, пс');
ylabel('Интенсивность излучения, Вт');
F0_text = sprintf('Баллистический компонент F0: %.2e Вт', F0);
legend('Экспериментальное распределение','Теоретическое распределение', F0_text)

leftarrow2 = text(t0*ps, 1, '\leftarrow');
leftarrow2.Clipping= 'on';
leftarrow2.Rotation=45;
text_t02 = text(leftarrow2.Extent(1)+leftarrow2.Extent(3),leftarrow2.Extent(2)+leftarrow2.Extent(4),'t_0');
text_t02.Clipping = 'on';

subplot(2, 1, 2)
plot(t * ps, F, 'b', t * ps, F_teor, 'r');
hold on;
grid on;
if (F0 / max(F_teor) > 1)
    plot([t0*ps, t0*ps], [0, F_teor_max * 1.1], 'k');
    axis([0 max(t * ps) 0 max(F_teor_max, F_max) * 1.3])
else
    plot([t0*ps, t0*ps], [0, F_teor_max * 0.9], 'k');
    axis([0 max(t * ps) 0 max(F_teor_max, F_max) * 1.1])
    
end
title({'Полученное теоретическое и экспериментальное временные' ; ' распределения импульса излучения'; ['t_0 = ', num2str(t0 * ps), ' пс']});
xlabel('Время, пс');
ylabel('Интенсивность излучения, Вт');
legend('Экспериментальное распределение','Теоретическое распределение', F0_text)

leftarrow3 = text(t0*ps, 0, '\leftarrow');
leftarrow3.Clipping= 'on';
leftarrow3.Rotation=45;
text_t03 = text(leftarrow3.Extent(1)+leftarrow3.Extent(3),leftarrow3.Extent(2)+leftarrow3.Extent(4),'t_0');
text_t03.Clipping = 'on';
z = zoom;
z.Enable = 'on';
z.ActionPostCallback = {@figureChangeCallback,text_t02,leftarrow2,text_t03,leftarrow3};
f1.SizeChangedFcn = {@figureChangeCallback,text_t02,leftarrow2,text_t03,leftarrow3};

%% Конец программы
disp('*******************************************************************************************************');
disp('*                                        Конец работы                                                 *');
disp('*******************************************************************************************************');
