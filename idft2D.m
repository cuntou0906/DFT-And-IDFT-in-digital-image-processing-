function [ f ] = idft2D(F)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  idft2D()函数实现一个的二维快速傅里叶逆变换(IFFT)图像
%  F表示：FFT图像                      f表示：输入图像 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
F = conj(F);                %求F矩阵的共轭矩阵   
sizeF = size(F);            %获取输入图像的尺寸大小
M = sizeF(1);               %像素矩阵的行数
N = sizeF(2);               %像素矩阵的列数
f = zeros(M,N);             %定义输出矩阵
fxv = zeros(M,N);           %定义中间矩阵
% 循环：以下通过两轮一维傅里叶变换实现F*的二维FFT计算
for i = 1:M
    fxv(i,:)=fft(F(i,:));   %循环M次计算f(x,v)
end
for j = 1:N
    f(:,j)=fft(fxv(:,j));   %循环N次计算MNf*(x,y)
end
    f = real(f)/M/N;        %计算f(x,y)
end 