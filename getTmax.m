function [Tmax] = getTmax(h, m, ms, ratioF, Nt, n)

Tmax = 1e-11;
disp('����� Fmax ������������������ ���������� ������������� F(t),');
l = LoadBar('������� ���� T_peak, ������������� ������� Tmax � F(Tmax)');
while true
    l = l.nextStep();
    [t, F_plus] = calc(0, h, m, ms, Tmax, Nt, n);
    [F_plus_max, ind] = max(F_plus);
    T_peak = t(ind);
    if(F_plus_max ~= F_plus(end))
       break 
    end
    Tmax = Tmax * 1.5;
end

while true
   l = l.nextStep();
   F_Tmax = F_plus_max / ratioF;
   [t, F_plus] = calc(0, h, m, ms, Tmax, Nt, n);
   if (F_plus(end) < F_Tmax)
       [tmp index] = min(abs(F_plus-F_Tmax));
       Tmax = t(index);
       break
   end
   Tmax = Tmax * 1.5;
end
l.end();
[F_plus_max, ind] = max(F_plus);
T_peak = t(ind);
disp(['T_peak = ' num2str(T_peak * 1e11, '%.2f') ' ��']);
disp(['Fmax = ' num2str(F_plus_max, '%.2f') ' ��']);
disp(['Tmax = ' num2str(Tmax * 1e11, '%.2f') ' ��']);
disp(['F(Tmax) = ' num2str(F_plus(index), '%.2f') ' ��']);
disp(['����������� ��������� Fmax/F(Tmax) = ' num2str(F_plus_max/F_plus(index), '%.2f')]);
disp(' ');
end