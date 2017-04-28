clear all
ts=0.01; %�ز�Ƶ��20 Hz,����ʱ����
fs=1/ts;   % ����Ƶ��100 hz
t=0:ts:10;
df = fs/length(t);   %DFT��Ƶ�ʷֱ���
f=-50:df:50-df;    %Ƶ��ʸ��
x=exp(-10*abs(t-5)).*cos(2*pi*20*t);
X=fft(x)/fs;   %���ź�Ƶ��

xa=hilbert(x);
Xa=fft(xa)/fs;
subplot(2,1,1);plot(t,x);title('�ź�x');xlabel('ʱ��t');
subplot(2,1,2);plot(f,fftshift(abs(X)));title('�ź� x ������');xlabel('Ƶ��f');

figure
subplot(2,1,1);plot(t,abs(xa));title('�ź�xa����');xlabel('ʱ��t');
subplot(2,1,2);plot(f,fftshift(abs(Xa)));title('�ź�xa������');xlabel('Ƶ��f');