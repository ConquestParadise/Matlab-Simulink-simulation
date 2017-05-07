clear all
nsymbol=100000;
M=8;
graycode=[0 1 2 3 6 7 4 5];
EsN0=5:20;
snr1=10.^(EsN0/10);
msg=randint(1,nsymbol,M);   %��Ϣ����
msg1=graycode(msg+1);
msgmod=dpskmod(msg1,M); %����8-DPSK����
spow=norm(msgmod).^2/nsymbol;   %��ÿ�����ŵ�ƽ������

for indx=1:length(EsN0)
    sigma=sqrt(spow/(2*snr1(indx)));    %���ݷ��Ź�������������
    rx=msgmod+sigma*(randn(1,length(msgmod))+j*randn(1,length(msgmod)));
    y=dpskdemod(rx,M);
    decmsg=graycode(y+1);
    [err,ber(indx)]=biterr(msg(2:end),decmsg(2:end),log2(M));
    [err,ser(indx)]=symerr(msg(2:end),decmsg(2:end));
end

ser1=2*qfunc(sqrt(snr1)*pi/M);
ber1=1/log2(M)*ser1;    %�����������

semilogy(EsN0,ber,'-ko',EsN0,ser,'-k*',EsN0,ser1,EsN0,ber,'-k.');
title('8-DPSK�ز������ź���AWGN�ŵ��µ�����');
xlabel('Es/N0');ylabel('������ʺ��������');
legend('�������','�������','�����������','�����������')








