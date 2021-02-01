clc
clear all
%����ԭʼ����
load('boost40k.mat');

i=795000:796023;
y=boost40k(i,2)';
y1=boost40k(i,3)';

% randn('state',15);
% w= 0.005*randn(1024,1);
% r=0.4;
% 
% %ѹ����֪�ع��ź�
% sig3=compressed(y,w,r);
% sig4=compressed(y1,w,r);
% %SVD ����
% yout=gen_suv(sig3,y);
% yout1=gen_suv(sig4,y);


yout=y;
yout1=y1;

% ������ȡ
% y=y+w';
% y1=y1+w';

% ʱ�����������ֵ��Сֵ��ƽ��ֵ���Ͷ����ӡ��Ͷȡ����ֵ
[ma,mi,me,Kr,ku,pk]=time_feaext(yout);
[ma1,mi1,me1,Kr1,ku1,pk1]=time_feaext(yout1);

% �任��������dct fft wtc fwhtout hadamaout
[dctout,fftout,wtc,fwhtout,hadamaout]=freq_feaext(yout);
[dctout1,fftout1,wtc1,fwhtout1,hadamaout1]=freq_feaext(yout1);

%�������� ��PCA KPCA ��� ����Ԥ��任 ģ̬�ֽ�
[pcaout,kpcaout,convout,lpctout,emdout]=other_feaext(yout);
[pcaout1,kpcaout1,convout1,lpctout1,emdout1]=other_feaext(yout1);

%��ͼ

% plot(pcaout,'c','linewidth',1)
% hold on
% plot(pcaout1,'g-.','linewidth',1)
% title('�˻�ǰ��PCA����Ա�')
% legend('�˻�ǰ','�˻���')
%% 
figure
plot(kpcaout,'k','linewidth',1.3)
hold on
plot(kpcaout1,'r','linewidth',1.3)
title('�˻�ǰ���KPCA����Ա�')
legend('�˻�ǰ','�˻���')
%% 
% figure
% plot(convout,'k','linewidth',1.3)
% hold on
% plot(convout1,'r','linewidth',1.3)
% title('�˻�ǰ��ľ���任�Ա�')
% legend('�˻�ǰ','�˻���')
% 
% figure
% plot(lpctout,'k','linewidth',1.3)
% hold on
% plot(lpctout1,'r','linewidth',1.3)
% title('�˻�ǰ�������Ԥ��任����Ա�')
% legend('�˻�ǰ','�˻���')
% 
% figure
% plot(emdout{1,5},'b','linewidth',1.3)
% hold on
% plot(emdout1{1,5},'r','linewidth',1.3)
% title('�˻�ǰ��ľ���ģ̬�ֽ����Ա�')
% legend('�˻�ǰ','�˻���')

% figure
% plot(pk,'k','linewidth',1.3)
% hold on
% plot(pk1,'r','linewidth',1.3)
% title('�˻�ǰ��ķ��ֵ�Ա�')
% legend('�˻�ǰ','�˻���')