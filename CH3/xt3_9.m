clear all   %���������⣡������������������������
ts=0.001;
fs=1/ts;
t=0 : ts :0.5;
df = fs/length(t); %DFTƵ�׷ֱ���
f = -1000:df: 1000-df;

x=6*( cos(20*pi*t)-3*sin(30*pi*t) ) .*cos(400*pi*t+3/8*pi*t);

X=fft(x)/fs;

subplot(2,1,1);plot(t,x);title('�ź�x');xlabel('ʱ��t');
%subplot(2,1,2);plot(f,fftshift(abs(X)));title('�ź�x������');xlabel('Ƶ��f');

xa=hilbert(x);
Xa=fft(xa)/fs;

figure
subplot(2,1,1);plot(t,abs(xa));title('�ź�xa����');xlabel('ʱ��t');
subplot(2,1,2);plot(f,fftshift(abs(Xa)));title('�ź�Xa����');xlabel('Ƶ��f');

