function []= user_scenario()
 
pause(2);
%% ����������
zeta0 = input('������� ���������� ����� ���������� � ���������� ������� �������: ');
zeta = input('������� ���������� ����� ���������� � ������� ������� �������: ');
m = input('������� ���������� ���������� �������: ');
ms = input('������� ���������� ��������� �������: ');
 
%% ��������� 
u0 = 1;
v = 299792450;              %�������� ����� v = 299 792 458 �/�
t0 = (zeta-zeta0)/v;
 
%% ����������
 
t = 0:1e-11:t0+5e-7;
t = t';
F_plus = zeros(length(t), 1);
dir = zeros(length(t), 1);
heav = zeros(length(t), 1);
bes = zeros(length(t), 1);
 
disp('���������� ������������������ ���������� ������������� �������� ���������')
%����� ������
 
for i = 1:length(t)
    if (t(i) < t0)
        F_plus(i) = 0;
    else
        F_plus(i) = u0*m*v*dirac(m*v*t(i)-m*(zeta - zeta0))*exp(-m*(zeta - zeta0)) ...
        + u0*v*heaviside(v*t(i) - (zeta - zeta0))*(ms*(zeta - zeta0)/sqrt((v*t(i))^2 - (zeta - zeta0)^2)) ...
        * besseli(1, ms*sqrt((v*t(i)).^2 - (zeta - zeta0)^2))*exp(-m*v*t(i));
        dir(i) = dirac(m*v*t(i)-m*(zeta - zeta0));
        heav(i) = heaviside(v*t(i) - (zeta - zeta0));
        bes(i) = besseli(1, ms*sqrt((v*t(i)).^2 - (zeta - zeta0)^2));
    end 
end
 
figure(1)
plot(t, F_plus);
grid on;
 
%��������� ����
 
ma = (m - ms) * 3;
%���������� ����� � ��������� (�� ����� - 100 ����, � ��� �������)
 
 
 
 

