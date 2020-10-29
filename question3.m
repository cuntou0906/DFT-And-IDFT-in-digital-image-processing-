f = imread('rose512.tif');        %读取输入图像
f = double(f/255);                %归一化图像
F = dft2D(f);                     %调用自定义函数计算DFT
g = idft2D(F);                    %调用自定义函数计算IDFT
d = f - g;                        %计算差值图像
figure(1)
subplot(2,2,1)                    %分割绘图区域           
imshow(f,[])                      %显示归一化源图像
title('归一化源图像')              %添加标题

subplot(2,2,2)                    %分割绘图区域   
imshow(uint8(abs(F)))             %显示DFT谱图像
title('DFT谱图像')                %添加标题

subplot(2,2,3)                    %分割绘图区域   
imshow((g))                       %显示IDFT图像
title('IDFT图像')                 %添加标题

subplot(2,2,4)                    %分割绘图区域   
imshow(uint8(d))                  %显示差值图像
title('差值图像')                  %添加标题
