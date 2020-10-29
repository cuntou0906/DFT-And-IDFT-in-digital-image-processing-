original_f = zeros(512,512);                %����ԭʼͼ��
original_f(229:288,254:263) = ones(60,10);  %���ɰ�ɫ�����
nocenter_F = dft2D(original_f);             %���ú�������DFT
abs_nocenter_F = abs(nocenter_F);           %����ͼ���ģ
sizef = size(original_f);                   %��ȡ����ͼ��ĳߴ��С
M = sizef(1);                               %���ؾ��������
N = sizef(2);                               %���ؾ��������
center_f = zeros(M,N);                      %�������Ļ�ͼ�����ؾ���
for i = 1:M                                 %ѭ��ʵ�����Ļ�ͼ��
    for j = 1:N
        center_f(i,j) = original_f(i,j)*(-1)^(i+j);
    end
end
center_F = dft2D(center_f);                 %���ú����������Ļ�ͼ��DFT
abs_center_F = abs(center_F);               %����ͼ���ģ
logcenter_f = log(1+abs_center_F);          %�����任

figure(1)
subplot(2,2,1)                              %�ָ��ͼ����     
imshow(original_f,[])                       %��ʾԴͼ��
title('Դͼ��')                             %��ӱ���

subplot(2,2,2)                              %�ָ��ͼ����  
imshow(uint8(abs_nocenter_F))               %��ʾδ���Ļ�����ͼ��
title('δ���Ļ�����ͼ��')                    %��ӱ���

subplot(2,2,3)                              %�ָ��ͼ����     
imshow(uint8(abs_center_F))                 %��ʾ���Ļ�����ͼ��
title('���Ļ�����ͼ��')                      %��ӱ���

subplot(2,2,4)                              %�ָ��ͼ����     
imshow(logcenter_f,[])                      %��ʾ���Ļ��Ķ����仯����ͼ��
title('���Ļ��Ķ����仯����ͼ��')             %��ӱ���
