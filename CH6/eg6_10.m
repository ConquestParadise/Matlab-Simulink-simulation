clear all
nsymbol=100000; %ÿ��������·��͵ķ�����

Fd=1; %���Ų���Ƶ��
Fs=10;  %�˲�������Ƶ��
rolloff=0.25;   %����ϵ��
delay=5;    %�˲���ʱ��
M=4;
graycode=[0 1 3 2];
EsN0=0:15;
msg=randint(1,nsymbol,4);   %��Ϣ����
msg1=graycode(msg+1);   %����ӳ��
msgmod=pammod(msg1,M); %4PAMӳ��
rrcfilter=rcosine(Fd,Fs,'fir/sqrt',rolloff,delay);
s=rcosflt(msgmod,Fd,Fs,'filter',rrcfilter); %ͨ�����������˲��������������
%%
for indx=1:length(EsN0)
    decmsg=zeros(1,nsymbol);
    r=awgn(real(s),EsN0(indx)-7,'measured');
    rx=rcosflt(r,Fd,Fs,'Fs/filter',rrcfilter);  %ͨ���������ҽ������
    rx1=downsample(rx,Fs); %���������
    rx2=rx1(2*delay+1:end-2*delay); %ȥ���ӳ�
    msg_demod=pamdemod(rx2,M);
    decmsg=graycode(msg_demod+1);   %������ӳ��
    [err,ber(indx)]=biterr(msg,decmsg,log2(M));
    [err,ser(indx)]=symerr(msg,decmsg);
end

semilogy(EsN0,ber,'-ko',EsN0,ser,'-k*',EsN0,1.5*qfunc(sqrt(0.4*10.^(EsN0/10))));
title('4-PAM�ź���AWGN��������ŵ��µ�����');
xlabel('Es/N0');ylabel('������ʺ��������');
legend('�������','�������','�����������');





