function [Tmax] = getTmax(h, m, ms, ratioF)

Tmax = 1e-11;
Nt = 1000;
l = LoadBar('Поиск T_Fmax, Fmax, Tmax и F(Tmax)');
while true
    l = l.nextStep();
    [t, F_plus] = calc(h, m, ms, Tmax, Nt);
    [F_plus_max, ind] = max(F_plus);
    T_Fmax = t(ind);
    if(F_plus_max ~= F_plus(end))
       break 
    end
    Tmax = Tmax * 1.5;
end

while true
   l = l.nextStep();
   F_Tmax = F_plus_max / ratioF;
   [t, F_plus] = calc(h, m, ms, Tmax, Nt);
   if (F_plus(end) < F_Tmax)
       [tmp index] = min(abs(F_plus-F_Tmax));
       Tmax = t(index);
       break
   end
   Tmax = Tmax * 1.5;
end
l.end();
[F_plus_max, ind] = max(F_plus);
T_Fmax = t(ind);
disp(['T_Fmax, с: ', num2str(T_Fmax, 2)]);
disp(['Fmax, Дж/с: ', num2str(F_plus_max)]);
disp(['Tmax, с: ', num2str(Tmax, 2)]);
disp(['F(Tmax), Дж/с: ', num2str(F_plus(index))]);
disp(' ');
end