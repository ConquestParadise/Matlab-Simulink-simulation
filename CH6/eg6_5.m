clear all
EbN0=0:10;

for ii=1:length(EbN0)
    SNR=EbN0(ii);
    sim('fz6_5');
    ber(ii)=BER(1);
end

semilogy(EbN0,ber,'-ko',EbN0,qfunc(sqrt(10.^(EbN0/10))),'-k*',EbN0,qfunc(sqrt(2*10.^(EbN0/10))));
title('˫�����ź������������');
xlabel('EbN0');ylabel('�������Pe');
legend('������','�����ź������������','˫�����ź������������');