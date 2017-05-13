clear all
EbN0=0:10;
ber=berawgn(EbN0,'qam',16);
for ii=1:length(EbN0)
    BER=ber(ii);
    sim('fz8_7');
    ber1(ii)=BER1(1);
    
end

semilogy(EbN0,ber,'-ko',EbN0,ber1,'-k*');
legend('δ����','RS(15,11)����')
title('δ�����RS(15,11)�����16-QAM��AWGN�µ�����')
xlabel('Eb/N0');ylabel('�������')