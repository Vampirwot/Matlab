function [] = ishod(h, m_exp, ms_exp, ma_exp, Nma, Nms, Nt, ratioF, maxMa, maxMs, dMa, dMs)
disp('�������� ������');   
     disp('+------------------------------------------------------+');
     disp(['| ��������                              | ' '��������     |']);
     disp('+------------------------------------------------------+');
     disp([' ������� �����, ��                        ',num2str(h * 1e3, '%10.2e') ' ']);
     disp([' ����������� ����������, 1/��             ',num2str(m_exp / 1e3) ' ']);
     disp([' ����������� ���������, 1/��              ',num2str(ms_exp  / 1e3) ' ']);
     disp([' ����������� ����������, 1/��             ',num2str(ma_exp  / 1e3) ' ']);
     disp([' ���������� ����� ��� ms                  ',num2str(Nms,'%-8.2u') ' ']);
     disp([' ���������� ����� ��� ma                  ',num2str(Nma,'%-8.2u') ' ']);
     disp([' ���������� ����� ��� t                   ',num2str(Nt,'% 8u') ' ']);
     disp([' ��������� Fmax/F(Tmax)                   ',num2str(ratioF) ' ']);
     disp([' ������������ ma, 1/��                    ',num2str(maxMa / 1e3) ' ']);
     disp([' ������������ ms, 1/��                    ',num2str(maxMs / 1e3) ' ']);
     disp([' ������ ������ ma x ms, 1/�� x 1/��       ',num2str(dMa / 1e3) ' x ' ,num2str(dMs / 1e3) ' ']);
     disp('+-----------------------------------------------------+');
 end