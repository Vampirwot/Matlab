function [Tmax] = getTmax(h, m, ms, ratioF)

Tmax = 1e-11;
Nt = 1000;
disp('����� ��������� ������������������ ���������� ������������� Fmax,');
disp('������� ��������� T_Fmax, ������ ������� ������������������ ')
l = LoadBar('���������� ������������� F(Tmax) � � ������� Tmax');
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
disp(['T_Fmax, ��: ', num2str(T_Fmax * 1e11, '%.2f')]);
disp(['Fmax, ��: ', num2str(F_plus_max, '%.2f')]);
disp(['Tmax, ��: ', num2str(Tmax * 1e11, '%.2f')]);
disp(['F(Tmax), ��: ', num2str(F_plus(index), '%.2f')]);
disp(['����������� ��������� Fmax/F(Tmax): ', num2str(F_plus_max/F_plus(index), '%.2f')]);
disp(' ');
end