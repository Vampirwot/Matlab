function [Tmax] = getTmax(h, m, ms)

Tmax = 1e-6;
Nt = 10000;
while true
    [t, F_plus] = calc(h, m, ms, Tmax, Nt);
    F_plus_max = max(F_plus);
    if(F_plus_max == F_plus(end))
       break 
    end
    Tmax = Tmax * 1.5;
end

while true
   F_Tmax = F_plus_max / 100;
   if (F_plus(end) < F_Tmax)
       [tmp index] = min(abs(F_plus-F_Tmax));
       Tmax = t(index);
       break
   end
   Tmax = Tmax * 1.5; 
end
end