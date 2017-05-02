clear all
ts=0.0025; %����ʱ����
t=0:ts:5-ts;
fs=1/ts;  %����Ƶ��400
msg=randint(10,1,[-3,3],123);
msg1=msg*ones(1,fs/2); %��չ��ȡ���ź���ʽ
msg2=reshape(msg1.',1,length(t));

subplot(3,1,1);plot(t,msg2);
title('��Ϣ�ź�');

A=4;
fc=100;
Sam=(A+msg2).*cos(2*pi*fc*t);

dems=abs(hilbert(Sam))-A; %����첨������ȥ��ֱ������
subplot(3,1,2);plot(t,dems);  
title('�������Ľ���ź�')

y=awgn(Sam,20,'measured'); 
dems2=abs(hilbert(y))-A; %����첨������ȥ��ֱ������
subplot(3,1,3);plot(t,dems2);
title('�����Ϊ20dBʱ�Ľ���ź�')




