function [] = ishod(h, m_exp, ms_exp, ma_exp, Nma, Nms, Nt, ratioF, maxMa, maxMs, dMa, dMs)
disp('Исходные данные');   
 if(getVersion()<2016)
     disp('+----------------------------------------------+');
     disp(['| Параметр                      | ' 'Значение     |']);
     disp('+----------------------------------------------+');
     disp([' Толщина среды, м                 ',num2str(h, '%10.2e') ' ']);
     disp([' Коэффициент экстинкции, 1/м      ',num2str(m_exp, '%-8.2e') ' ']);
     disp([' Коэффициент рассеяния, 1/м       ',num2str(ms_exp, '%-8.2e') ' ']);
     disp([' Коэффициент поглощения, 1/м      ',num2str(ma_exp, '%-8.2e') ' ']);
     disp([' Количество точек для ms          ',num2str(Nms,'%-8.2u') ' ']);
     disp([' Количество точек для ma          ',num2str(Nma,'%-8.2u') ' ']);
     disp([' Количество точек для t           ',num2str(Nt,'% 8u') ' ']);
     disp([' Отношение Fmax/F(Tmax)           ',num2str(ratioF) ' ']);
     disp([' Максимальное ma, 1/м             ',num2str(maxMa) ' ']);
     disp([' Максимальное ms, 1/м             ',num2str(maxMs) ' ']);
     disp([' Размер ячейки ma x ms            ',num2str(dMa, '%8.2e') ' x ' ,num2str(dMs, '%8.2e') ' ']);
     disp('+----------------------------------------------+');
 end