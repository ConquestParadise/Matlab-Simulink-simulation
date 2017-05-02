clear all
ts=0.0025;
t=0:ts:5-ts;
fs=1/ts;
df=fs/length(t);  %fft��Ƶ�ʷֱ���
msg=randint(10,1,[-3,3],123);
msg1=msg*ones(1,fs/2);
msg2=reshape(msg1.',1,length(t));
Pm=fft(msg2)/fs;
f=-fs/2:df:fs/2-df;
subplot(3,1,1);plot(t,msg2);
title('��Ϣ�ź�');

fc=300;
s1=0.5*msg2.*cos(2*pi*fc*t); %USSB�źŵ�ͬ�����
hmsg=imag(hilbert(msg2)); %��Ϣ�źŵ�ϣ�����ر任
s2=0.5*hmsg.*sin(2*pi*fc*t); %USSB�źŵ���������
Sussb=s1-s2; %����USSB�ź�

y=Sussb.*cos(2*pi*fc*t); %��ɽ��
Y=fft(y)./fs; %������Ƶ��
f_stop=100;
n_stop=floor(f_stop/df);
Hlow=zeros(size(f));
Hlow(1:n_stop)=4;
Hlow(length(f)-n_stop+1:end)=4;
DEM=Y.*Hlow; %����ź�ͨ��LPF
dem=real(ifft(DEM))*fs; %���յõ��Ľ���ź�
subplot(3,1,2);plot(t,dem);
title('�������Ľ���ź�');

y1=awgn(Sussb,20,'measured');
y2=y1.*cos(2*pi*fc*t); %��ɽ��
Y2=fft(y2)/fs; 
DEM1=Y2.*Hlow;
dem1=real(ifft(DEM1))*fs;  %���յõ��Ľ���ź�
subplot(3,1,3);plot(t,dem1);
title('�����Ϊ20dbʱ�Ľ���ź�')





















