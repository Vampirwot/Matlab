function [Tmax] = getTmax(h, m, ms)

Tmax = 1e-6;
Nt = 1000;
l = LoadBar('Поиск Tmax и F(Tmax)');
while true
    l = l.nextStep();
    [t, F_plus] = calc(h, m, ms, Tmax, Nt);
    F_plus_max = max(F_plus);
    if(F_plus_max ~= F_plus(end))
       break 
    end
    Tmax = Tmax * 1.5;
end

while true
   l = l.nextStep();
   F_Tmax = F_plus_max / 100;
   [t, F_plus] = calc(h, m, ms, Tmax, Nt);
   if (F_plus(end) < F_Tmax)
       [tmp index] = min(abs(F_plus-F_Tmax));
       Tmax = t(index);
       break
   end
   Tmax = Tmax * 1.5;
end
l.end();
disp('Вычисление окончено');
disp(['Tmax: ' num2str(Tmax)]);
disp(['F(Tmax): ' num2str(F_plus(index))]);
disp(' ');
end