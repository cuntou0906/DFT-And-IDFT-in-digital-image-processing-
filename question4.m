original_f = zeros(512,512);                %生成原始图像
original_f(229:288,254:263) = ones(60,10);  %生成白色矩阵块
nocenter_F = dft2D(original_f);             %调用函数计算DFT
abs_nocenter_F = abs(nocenter_F);           %求谱图像的模
sizef = size(original_f);                   %获取输入图像的尺寸大小
M = sizef(1);                               %像素矩阵的行数
N = sizef(2);                               %像素矩阵的列数
center_f = zeros(M,N);                      %构造中心化图像像素矩阵
for i = 1:M                                 %循环实现中心化图像
    for j = 1:N
        center_f(i,j) = original_f(i,j)*(-1)^(i+j);
    end
end
center_F = dft2D(center_f);                 %调用函数计算中心化图像DFT
abs_center_F = abs(center_F);               %求谱图像的模
logcenter_f = log(1+abs_center_F);          %对数变换

figure(1)
subplot(2,2,1)                              %分割绘图区域     
imshow(original_f,[])                       %显示源图像
title('源图像')                             %添加标题

subplot(2,2,2)                              %分割绘图区域  
imshow(uint8(abs_nocenter_F))               %显示未中心化的谱图像
title('未中心化的谱图像')                    %添加标题

subplot(2,2,3)                              %分割绘图区域     
imshow(uint8(abs_center_F))                 %显示中心化的谱图像
title('中心化的谱图像')                      %添加标题

subplot(2,2,4)                              %分割绘图区域     
imshow(logcenter_f,[])                      %显示中心化的对数变化后谱图像
title('中心化的对数变化后谱图像')             %添加标题
