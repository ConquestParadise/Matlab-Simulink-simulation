clear all
ts=0.0025; %����ʱ����
t=0:ts:10-ts;
fs=1/ts; %����Ƶ��
df=fs/length(t);  %fft��Ƶ�ʷֱ���
msg=randint(100,1,[-3,3],123);
msg1=msg*ones(1,fs/10); %��չ��ȡ���ź���ʽ
msg2=reshape(msg1.',1,length(t));
Pm=fft(msg2)/fs; 
f=-fs/2:df:fs/2-df;
subplot(2,1,1);plot(f,fftshift(abs(Pm)));  
title('��Ϣ�ź�Ƶ��');

A=4;
fc=100;
Sdsb=msg2.*cos(2*pi*fc*t);
Pdsb=fft(Sdsb)/fs; %�ѵ��ź�Ƶ��
subplot(2,1,2);plot(f,fftshift(abs(Pdsb)));
title('DSBSC�ź�Ƶ��');
axis([-200 200 0 2]);

Pc=sum(abs(Sdsb).^2 / length(Sdsb)); %�ѵ��źŹ���
Ps=sum(abs(msg2).^2 / length(msg2)); %��Ϣ�źŹ���




