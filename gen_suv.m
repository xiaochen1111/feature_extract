
function yout=gen_suv(ynew,yin)
% yin ԭʼ�ź�
% ynew �ع�֮����ź� 
s=yin;
y=ynew;
N=length(y);
% subplot(4,1,1); plot(s,'LineWidth',1.5)
% title('ԭʼģ���ź� ','FontSize',16)
% set(gca,'box','off')
% %set(gca,��linewidth��,1.5);
% subplot(4,1,2); plot(y,'LineWidth',1.5)
% title('ԭʼģ���ź�+��˹����','FontSize',16)
% set(gca,'box','off')
%set(gca,��linewidth��,1.5);
%%
%===== ����Ҷ�任��� ====
% NFFT = 2^nextpow2(N); % Next power of 2 from length of y
% Y = fft(y,NFFT)/N;
% f = N/2*linspace(0,1,NFFT/2+1);
% subplot(4,1,3);plot(f,4*abs(Y(1:NFFT/2+1)),'LineWidth',1.5) %�鿴�źŵ�Ƶ�ף���Ϊ����ֵȥ��һ��ѡ��2*�ź���Ƶ�ĸ���
% title('Ƶ�� ','FontSize',16)
% set(gca,'box','off')
%set(gca,��linewidth��,1.5);

n=8;

%=============================
%==== ����ֵ�ֽ� ====
%%
for i=1:N/2+1
t=i:i+N/2-1;
for j=1:N/2
A(j,i)=y(t(j)); %��һά�ź��ع�Ϊ����������ֵ�ֽ�
end
end
[U,S,V] = svd(A);

%=============================
%==== �ع��ź� =====
X=zeros(size(A));
for i=1:n;%ѡȡǰn��������ֵ
X=X+U(:,i)*S(i,i)*V(:,i)';
end
yout=zeros(1,N);
for i=1:N
a=0;m=0;
for j1=1:N/2
for j2=1:N/2+1
if i+1==j1+j2
a=a+X(j1,j2); %�Ѿ����ع���һά�ź�
m=m+1;
end
end
end
yout(i)=a/m;
end
% JG(N/2+1:end)=X(:,end);
%%
% %%%%%%%%%%%%%��ͼ%%%%%%%%%%%%%%%%%%%%%%%%%
% subplot(4,1,4);plot(yout,'LineWidth',1.5)
% title('����ֵ�����ź�','FontSize',16)
% xlabel('ʱ��','FontSize',16)
% set(gca,'box','off')
% %set(gca,��linewidth��,1.5);
% set(gcf,'color','w')

