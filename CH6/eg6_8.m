clear all
EsN0=0:15;

for ii=1:length(EsN0)
    SNR=EsN0(ii);
    sim('fz6_8');
    ber(ii)=BER(1);
    ser(ii)=SER(1);
end

semilogy(EsN0,ber,'-ko',EsN0,ser,'-k*',EsN0,1.5*qfunc(sqrt(0.4*10.^(EsN0/10))));
title('4PAM�ź���AWGN�ŵ��µ�����');
xlabel('Es/N0');ylabel('������ʺ��������');
legend('�������','�������','�����������')