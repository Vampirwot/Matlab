function [] = ishod(h, m_exp, ms_exp, ma_exp, Nma, Nms, Nt, ratioF, maxMa, maxMs, dMa, dMs, n) 
     disp('+----------------------------------------------------------+');
     disp(['| ��������                                  | ' '��������     |']);
     disp('+----------------------------------------------------------+');
     disp([' ������� ����� h, ��                         ',num2str(h * 1e3) ' ']);
     disp([' ���������� ����������� n                    ',num2str(n) ' ']);
     disp([' ����������� ���������� ma, 1/��             ',num2str(ma_exp  / 1e3) ' ']);
     disp([' ����������� ��������� ms, 1/��              ',num2str(ms_exp  / 1e3) ' ']);
     disp([' ����������� ���������� m, 1/��              ',num2str(m_exp / 1e3) ' ']);
     disp([' ���������� ����� ��� ms Nma                 ',num2str(Nms) ' ']);
     disp([' ���������� ����� ��� ma Nms                 ',num2str(Nma) ' ']);
     disp([' ���������� ����� �� ������� Nt              ',num2str(Nt) ' ']);
     disp([' ��������� Fmax/F(Tmax)                      ',num2str(ratioF) ' ']);
     disp([' ������������ ma, 1/��                       ',num2str(maxMa / 1e3) ' ']);
     disp([' ������������ ms, 1/��                       ',num2str(maxMs / 1e3) ' ']);
     disp([' ������ ������ ma x ms, 1/�� x 1/��          ',num2str(dMa / 1e3) ' x ' ,num2str(dMs / 1e3) ' ']);
     disp('+----------------------------------------------------------+');
 end