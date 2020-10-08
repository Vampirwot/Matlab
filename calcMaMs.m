function[ma_teor, ms_teor] = calcMaMs(F, ma_exp, ms_exp, h, Nma, Nms, Tmax, Nt)

maxMa = 3*ma_exp;
maxMs = 3*ms_exp;

dMa = maxMa/Nma;
dMs = maxMs/Nms;

Ma = dMa/2:dMa:maxMa - dMa/2;
Ms = dMs/2:dMs:maxMs - dMs/2;

ma = Ma(1);
ms = Ms(1);
min = intmax;

progress = ProgressBar(length(Ma)* length(Ms));
k = 0;
    for i = 1:length(Ma)
        for j = 1:length(Ms)
            k=k+1;
            progress = progress.print(k);
            M = Ma(i) + Ms(j);
            [t, f] = calc(h, M, Ms(j), Tmax, Nt);
           
            stdF = std(f - F);

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
disp(['Полученный коэффициент поглощения - ' num2str(ma_teor, 2) ' 1/м'])
disp(['Полученный коэффициент рассеяния - ' num2str(ms_teor, 2) ' 1/м'])
    
end