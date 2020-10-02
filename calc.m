function[t, F_plus] = calc(h, m, ms)

%% Постоянные
zeta0 = 0;
zeta = h;
v = 299792450;
u0 = 1;

%% Вычисление времени
t0 = (zeta - zeta0)/v;
t = 0:1e-11:t0+2e-7;
t = t';
F_plus = zeros(length(t), 1);
 
%% Вычисление экспериментального временного распределения импульса излучения
for i = 1:length(t)
    if (t(i) < t0)
        F_plus(i) = 0;
    else
        F_plus(i) = u0*m*v*dirac(m*v*t(i)-m*(zeta - zeta0))*exp(-m*(zeta - zeta0)) ...
        + u0*v*heaviside(v*t(i) - (zeta - zeta0))*(ms*(zeta - zeta0)/sqrt((v*t(i))^2 - (zeta - zeta0)^2)) ...
        * besseli(1, ms*sqrt((v*t(i)).^2 - (zeta - zeta0)^2))*exp(-m*v*t(i));
    end 
end
end