function[t, F] = calc(h, m_exp, ms_exp, Tmax, Nt)

%% Постоянные
zeta0 = 0;
zeta = h;
v = 299792450;
u0 = 1;

%% Вычисление времени
t0 = (zeta - zeta0)/v;
dt=Tmax/(Nt - 1);
t = 0:dt:Tmax;
t = t';
F = zeros(length(t), 1);
 
%% Вычисление экспериментального временного распределения импульса излучения
for i = 1:length(t)
    if (t(i) < t0)
        F(i) = 0;
    else
%         F(i) = u0*m_exp*v*dirac(m_exp*v*t(i)-m_exp*(zeta - zeta0))*exp(-m_exp*(zeta - zeta0)) ...
%         + u0*v*heaviside(v*t(i) - (zeta - zeta0))*(ms_exp*(zeta - zeta0)/sqrt((v*t(i))^2 - (zeta - zeta0)^2)) ...
%         * besseli(1, ms_exp*sqrt((v*t(i)).^2 - (zeta - zeta0)^2))*exp(-m_exp*v*t(i));
%         F(i) = u0*m_exp*v*exp(-m_exp*(zeta - zeta0)) ...
%         + u0*v*(ms_exp*(zeta - zeta0)/sqrt((v*t(i))^2 - (zeta - zeta0)^2)) ...
%         * besseli(1, ms_exp*sqrt((v*t(i)).^2 - (zeta - zeta0)^2))*exp(-m_exp*v*t(i));
         F0= u0*m_exp*v*dirac(m_exp*v*t(i)-m_exp*(zeta - zeta0))*exp(-m_exp*(zeta - zeta0));
         F1=u0*v*(ms_exp*(zeta - zeta0)/sqrt((v*t(i))^2 - (zeta - zeta0)^2));
         F2=besseli(1, ms_exp*sqrt((v*t(i)).^2 - (zeta - zeta0)^2))*exp(-m_exp*v*t(i));
         F(i) = F1*F2;
    end 
end


end