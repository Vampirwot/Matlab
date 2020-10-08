function[ma, ms] = calcMaMs(F, Ma, Ms, h)

ma = Ma(1);
ms = Ms(1);
min = intmax;
    for i = 1:length(Ma)
        for j = 1:length(Ms)
            M = Ma(i) + Ms(j);
            [t, f] = calc(h, M, Ms(j));
           
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
end