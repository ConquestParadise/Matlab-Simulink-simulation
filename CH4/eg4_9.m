clear all
fd=10; %������Ƶ��10
ts=1/1000; %�źų���ʱ����
t=0:ts:1;
h1=rayleigh(fd,t); %�����ŵ�����

fd=20;
h2=rayleigh(fd,t); 
subplot(2,1,1);plot(20*log10(abs(h1(1:1000))));
title('fd=10Hzʱ�ŵ���������')
xlabel('ʱ��');ylabel('����');

subplot(2,1,2);plot(20*log10(abs(h2(1:1000))));
title('fd=20Hz�ŵ���������');
xlabel('ʱ��');ylabel('����');
