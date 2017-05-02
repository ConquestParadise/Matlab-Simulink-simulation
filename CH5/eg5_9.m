clear all
ts=0.0025; %����ʱ����
t=0:ts:10-ts;
fs=1/ts;
df=fs/length(t); %fftƵ�׷ֱ���
msg=randint(100,1,[-3,3],123);
msg1=msg*ones(1,fs/10);
msg2=reshape(msg1.',1,length(t));
Pm=fft(msg2)/fs;  %��Ϣ�ź�Ƶ��
f=-fs/2:df:fs/2-df;
%%
subplot(2,1,1);plot(f,fftshift(abs(Pm)));
title('��Ϣ�ź�Ƶ��');
%%
fc=100;
Sdsb=msg2.*cos(2*pi*fc*t); %DSB�ź�
Pdsb=fft(Sdsb)/fs;

%%
f_stop=100; %LPF��ֹƵ��
n_stop=floor(f_stop/df);
Hlow=zeros(size(f));  %���LPF
Hlow(1:n_stop)=1;
Hlow(length(f)-n_stop+1:end)=1;
Plssb=Pdsb.*Hlow; %LSSB�ź�Ƶ��
%%
subplot(2,1,2);plot(f,fftshift(abs(Plssb)));
title('�ѵ��ź�Ƶ��');
axis([-200 200 0 2]);

%%
Slssb=real(ifft(Plssb))*fs;
Pc=sum(abs(Slssb).^2) / length(Slssb); %�ѵ��źŹ���
Ps=sum(abs(msg2).^2)/length(msg2);







