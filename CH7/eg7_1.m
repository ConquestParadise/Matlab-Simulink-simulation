clear all
nsymbol=100000;
T=1;    %��������
fs=100; %ÿ�����Ų�������
ts=1/fs;    %����ʱ����
t=0:ts:T-ts;
fc=10;  %�ز�Ƶ��
c=sqrt(2/T)*cos(2*pi*fc*t); %�ز��ź�
%%
M=4;
graycode=[0 1 3 2];
EsN0=0:15;
snr1=10.^(EsN0/10); %�����ת��Ϊ����ֵ
msg=randint(1,nsymbol,4);   %��Ϣ����
msg1=graycode(msg+1);
msgmod=pammod(msg1,M).';
tx=msgmod*c;    %�ز�����
tx1=reshape(tx.',1,length(msgmod)*length(c));
spow=norm(tx1).^2/nsymbol;  %��ÿ�����ŵ�ƽ������

for indx=1:length(EsN0)
    sigma=sqrt(spow/(2*snr1(indx)));    %���ݷ��Ź�������������
    rx=tx1+sigma*randn(1,length(tx1));
    rx1=reshape(rx,length(c),length(msgmod));
    y=(c*rx1)/length(c);    %�������
    y1=pamdemod(y,M);
    decmsg=graycode(y1+1);
    [err,ber(indx)]=biterr(msg,decmsg,log2(M));
    [err,ser(indx)]=symerr(msg,decmsg);
end

semilogy(EsN0,ber,'-ko',EsN0,ser,'-k*',EsN0,1.5*qfunc(sqrt(0.4*snr1)));
title('4-PAM�ز������ź���AWGN�ŵ��µ�����');
xlabel('Es/N0');ylabel('������ʺ��������');
legend('�������','�������','�����������')

















