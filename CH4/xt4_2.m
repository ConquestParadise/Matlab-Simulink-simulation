clear all
t=0:0.001:10;
x=sawtooth(t,0.5);
snr=20;
y=awgn(x,snr);
subplot(2,1,1);plot(t,x);title('���ǲ��ź�');
subplot(2,1,2);plot(t,y);title('�����˸�˹������������ǲ��ź�')