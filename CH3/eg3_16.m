clear all
ts=0.01;
fs=1/ts;
t=0:ts:10;
df=fs/length(t);
f=-50:df:50-df;
x=exp(-10*abs(t-5)).*cos(2*pi*20*t);
xa=hilbert(x);

fc1=20;
xl1=xa.*exp(-j*2*pi*fc1*t);
Xl1=fft(xl1)/fs;
subplot(2,1,1);plot(t,real(xl1));title('fcΪ20Hzʱ�ĵ�ͨ�ź�ͬ�����');xlabel('ʱ��t');
subplot(2,1,2);plot(f,fftshift(abs(Xl1)));title('fcΪ20Hzʱ�ĵ�ͨ�źŷ�����');xlabel('Ƶ��f');

fc2=10;
xl2=xa.*exp(-j*2*pi*fc2*t);
Xl2=fft(xl2)/fs;

figure
subplot(2,1,1);plot(t,real(xl2));title('fcΪ10Hzʱ�ĵ�ͨ�ź�ͬ�����');xlabel('ʱ��t');
subplot(2,1,2);plot(f,fftshift(abs(Xl2)));title('fcΪ10Hzʱ��ͨ�źŵķ�����');xlabel('Ƶ��f');




