function[ma, ms] = calcMaMs(F, ma, ms, h, Nma, Nms, Tmax, Nt)

maxMa = 3*ma;
maxMs = 3*ms;

dMa = maxMa/Nma;
dMs = maxMs/Nms;

Ma = dMa/2:dMa:maxMa - dMa/2;
Ms = dMs/2:dMs:maxMs - dMs/2;

ma = Ma(1);
ms = Ms(1);
min = intmax;
    for i = 1:length(Ma)
        for j = 1:length(Ms)
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
    
disp(['Полученный коэффициент поглощения - ' num2str(ma, 2) ' 1/м'])
disp(['Полученный коэффициент рассеяния - ' num2str(ms, 2) ' 1/м'])
    
end