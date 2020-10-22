function[ma_teor, ms_teor] = calcMaMs(F, ma_exp, ms_exp, h, Tmax, Nt, maxMa, maxMs, dMa, dMs)

Ma = dMa/2:dMa:maxMa - dMa/2;
Ms = dMs/2:dMs:maxMs - dMs/2;

ma = Ma(1);
ms = Ms(1);
min = intmax;

progress = ProgressBar(length(Ma)* length(Ms));
quadr = zeros(length(Ma), length(Ms));
k = 0;
    for i = 1:length(Ma)
        for j = 1:length(Ms)
            k=k+1;
            progress = progress.print(k);
            M = Ma(i) + Ms(j);
            [t, f] = calc(h, M, Ms(j), Tmax, Nt);
           
            stdF = std(f - F);
            quadr(i, j) = stdF;

            if(isnan(stdF))
               continue;
            end
           
            if min > stdF
                min = stdF;
                ma = Ma(i);
                ms = Ms(i);
            end
        end
    end
    ma_teor = ma;
    ms_teor = ms;

delta_ma = abs(ma_teor - ma_exp);
delta_ms = abs(ms_teor - ms_exp);

figure(2)
surf(Ma, Ms, quadr)
title('Зависимость среднеквадратическое отклонение от коэффициентов поглощения и рассеяния')
xlabel('Коэффициент поглощения, 1/м')
ylabel('Коэффициент рассеяния, 1/м')
zlabel('Среднеквадратическое отколонение, Дж/с')
grid on;

vivod(ma_exp, ms_exp, ma_teor, ms_teor, delta_ma, delta_ms, dMa, dMs);
    
end