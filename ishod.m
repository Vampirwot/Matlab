function [] = ishod(h, m_exp, ms_exp, ma_exp, Nma, Nms, Nt, ratioF, maxMa, maxMs, dMa, dMs)
disp('�������� ������');   
 if(getVersion()<2016)
     disp('+----------------------------------------------+');
     disp(['| ��������                      | ' '��������     |']);
     disp('+----------------------------------------------+');
     disp([' ������� �����, �                 ',num2str(h, '%10.2e') ' ']);
     disp([' ����������� ����������, 1/�      ',num2str(m_exp, '%-8.2e') ' ']);
     disp([' ����������� ���������, 1/�       ',num2str(ms_exp, '%-8.2e') ' ']);
     disp([' ����������� ����������, 1/�      ',num2str(ma_exp, '%-8.2e') ' ']);
     disp([' ���������� ����� ��� ms          ',num2str(Nms,'%-8.2u') ' ']);
     disp([' ���������� ����� ��� ma          ',num2str(Nma,'%-8.2u') ' ']);
     disp([' ���������� ����� ��� t           ',num2str(Nt,'% 8u') ' ']);
     disp([' ��������� Fmax/F(Tmax)           ',num2str(ratioF) ' ']);
     disp([' ������������ ma, 1/�             ',num2str(maxMa) ' ']);
     disp([' ������������ ms, 1/�             ',num2str(maxMs) ' ']);
     disp([' ������ ������ ma x ms            ',num2str(dMa, '%8.2e') ' x ' ,num2str(dMs, '%8.2e') ' ']);
     disp('+----------------------------------------------+');
 end