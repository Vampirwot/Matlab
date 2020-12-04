function[ma_teor, ms_teor] = calcMaMs(F, ma_exp, ms_exp, h, Tmax, Nt, maxMa, maxMs, dMa, dMs, n)

Ma = dMa/2:dMa:maxMa - dMa/2;
Ms = dMs/2:dMs:maxMs - dMs/2;

ma = Ma(1);
ms = Ms(1);
receivedQuadr = intmax;

progress = ProgressBar(length(Ma)* length(Ms));
quadr = zeros(length(Ma), length(Ms));
quadr_n = zeros(length(Ma), length(Ms));
k = 0;
    for i = 1:length(Ma)
        for j = 1:length(Ms)
            k=k+1;
            progress = progress.print(k);
            M = Ma(i) + Ms(j);
            [t, f] = calc(0, h, M, Ms(j), Tmax, Nt, n);
           
            stdF = std(f - F);
            quadr_n(i, j) = sum((f - F).^2); 
            quadr(i, j) = stdF;

            if(isnan(stdF))
               continue;
            end
           
            if receivedQuadr > stdF%% quadr_n(i, j)%%stdF
                receivedQuadr = stdF; %%quadr_n(i, j);%%stdF;
                ma = Ma(i);
                ms = Ms(j);
            end
        end
    end
    ma_teor = ma;
    ms_teor = ms;

delta_ma = abs(ma_teor - ma_exp);
delta_ms = abs(ms_teor - ms_exp);

figure()
[Ms, Ma] = meshgrid(Ms, Ma);
surf(Ma/1000, Ms/1000, quadr)
set(gca,'ZScale','log')
colorbar
title('Квадратичный функционал')
xlabel('Коэффициент поглощения, 1/мм')
ylabel('Коэффициент рассеяния, 1/мм')
zlabel('Квадратичный функционал, Дж*с')
grid on;

figure()
surf(Ma/1000, Ms/1000, 1./quadr)
title('Обратный квадратичный функционал')
xlabel('Коэффициент поглощения, 1/мм')
ylabel('Коэффициент рассеяния, 1/мм')
zlabel('*Квадратичный функционал, Дж*с')
grid on;

maxQuadr = max(max(quadr));
minQuadr = min(min(quadr));

disp(['Максимальное значение квадратичного функционала = ' num2str(maxQuadr)])
disp(['Минимальное значение квадратичного функционала = ' num2str(minQuadr)])
disp(['Полученное значение квадратичного функционала = ' num2str(receivedQuadr)])

vivod(ma_exp, ms_exp, ma_teor, ms_teor, delta_ma, delta_ms, dMa, dMs);
    
end