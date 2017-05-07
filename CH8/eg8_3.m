clear all
EbN0=0:10;
SymbolRate=50000;   %��������

for ii=1:length(EbN0)
    SNR=EbN0(ii);
    sim('fz8_3');
    ber1(ii)=BER1(1);
    ber2(ii)=BER2(1);
end

semilogy(EbN0,ber1,'-ko',EbN0,ber2,'-k*');
legend('δ����','Hamming(7,4)����');
title('δ�����Hamming(7,4)�����QPSK��AWGN�µ�����');
xlabel('Eb/N0');ylabel('�������')