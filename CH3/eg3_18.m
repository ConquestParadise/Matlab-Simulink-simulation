clear all    %��������غ�������������������ʱ��Ҫ���������
ts = 0.002;  %���ó������
tao=-1:ts:1;  %| tao| >1ʱ������غ���ֵ��С
B=20;
f0=100;
R=sinc(2*B*tao) .* cos(2*pi*f0*tao);

fs=1/ts;  %����Ƶ��
df = fs/length(tao); %Ƶ�ʷֱ���
f = -fs/2 : df :fs/2-df;  %����Ƶ��ʸ��
S = fft(R)/fs; %���㹦�����ܶ�
subplot(2,1,1);plot(tao,R);title('����غ���');xlabel('tao');ylabel('R');
subplot(2,1,2);plot(f,fftshift(abs(S)));title('�������ܶ�');xlabel('f');ylabel('S');