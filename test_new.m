clc
clear all
%加载原始数据
load('boost40k.mat');

i=795000:796023;
y=boost40k(i,2)';
y1=boost40k(i,3)';

% randn('state',15);
% w= 0.005*randn(1024,1);
% r=0.4;
% 
% %压缩感知重构信号
% sig3=compressed(y,w,r);
% sig4=compressed(y1,w,r);
% %SVD 降噪
% yout=gen_suv(sig3,y);
% yout1=gen_suv(sig4,y);


yout=y;
yout1=y1;

% 特征提取
% y=y+w';
% y1=y1+w';

% 时域特征：最大值最小值，平均值，峭度因子、峭度、峰峰值
[ma,mi,me,Kr,ku,pk]=time_feaext(yout);
[ma1,mi1,me1,Kr1,ku1,pk1]=time_feaext(yout1);

% 变换域特征：dct fft wtc fwhtout hadamaout
[dctout,fftout,wtc,fwhtout,hadamaout]=freq_feaext(yout);
[dctout1,fftout1,wtc1,fwhtout1,hadamaout1]=freq_feaext(yout1);

%其他特征 ：PCA KPCA 卷积 线性预测变换 模态分解
[pcaout,kpcaout,convout,lpctout,emdout]=other_feaext(yout);
[pcaout1,kpcaout1,convout1,lpctout1,emdout1]=other_feaext(yout1);

%作图

% plot(pcaout,'c','linewidth',1)
% hold on
% plot(pcaout1,'g-.','linewidth',1)
% title('退化前后PCA结果对比')
% legend('退化前','退化后')
%% 
figure
plot(kpcaout,'k','linewidth',1.3)
hold on
plot(kpcaout1,'r','linewidth',1.3)
title('退化前后的KPCA结果对比')
legend('退化前','退化后')
%% 
% figure
% plot(convout,'k','linewidth',1.3)
% hold on
% plot(convout1,'r','linewidth',1.3)
% title('退化前后的卷积变换对比')
% legend('退化前','退化后')
% 
% figure
% plot(lpctout,'k','linewidth',1.3)
% hold on
% plot(lpctout1,'r','linewidth',1.3)
% title('退化前后的线性预测变换结果对比')
% legend('退化前','退化后')
% 
% figure
% plot(emdout{1,5},'b','linewidth',1.3)
% hold on
% plot(emdout1{1,5},'r','linewidth',1.3)
% title('退化前后的经验模态分解结果对比')
% legend('退化前','退化后')

% figure
% plot(pk,'k','linewidth',1.3)
% hold on
% plot(pk1,'r','linewidth',1.3)
% title('退化前后的峰峰值对比')
% legend('退化前','退化后')