function[t, F_plus] = calc(h, m_exp, ms_exp, Tmax, Nt)

%% ����������
zeta0 = 0;
zeta = h;
v = 299792450;
u0 = 1;

%% ���������� �������
t0 = (zeta - zeta0)/v;
t = 0:Tmax/(Nt - 1):Tmax;
t = t';
F_plus = zeros(length(t), 1);
 
%% ���������� ������������������ ���������� ������������� �������� ���������
for i = 1:length(t)
    if (t(i) < t0)
        F_plus(i) = 0;
    else
        F_plus(i) = u0*m_exp*v*dirac(m_exp*v*t(i)-m_exp*(zeta - zeta0))*exp(-m_exp*(zeta - zeta0)) ...
        + u0*v*heaviside(v*t(i) - (zeta - zeta0))*(ms_exp*(zeta - zeta0)/sqrt((v*t(i))^2 - (zeta - zeta0)^2)) ...
        * besseli(1, ms_exp*sqrt((v*t(i)).^2 - (zeta - zeta0)^2))*exp(-m_exp*v*t(i));
    end 
end
end