f = imread('rose512.tif');        %��ȡ����ͼ��
f = double(f/255);                %��һ��ͼ��
F = dft2D(f);                     %�����Զ��庯������DFT
g = idft2D(F);                    %�����Զ��庯������IDFT
d = f - g;                        %�����ֵͼ��
figure(1)
subplot(2,2,1)                    %�ָ��ͼ����           
imshow(f,[])                      %��ʾ��һ��Դͼ��
title('��һ��Դͼ��')              %��ӱ���

subplot(2,2,2)                    %�ָ��ͼ����   
imshow(uint8(abs(F)))             %��ʾDFT��ͼ��
title('DFT��ͼ��')                %��ӱ���

subplot(2,2,3)                    %�ָ��ͼ����   
imshow((g))                       %��ʾIDFTͼ��
title('IDFTͼ��')                 %��ӱ���

subplot(2,2,4)                    %�ָ��ͼ����   
imshow(uint8(d))                  %��ʾ��ֵͼ��
title('��ֵͼ��')                  %��ӱ���
