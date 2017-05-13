clear all
Lc=7;   %�����Լ������
BitRate=100000; 
EbN0=0:10;

for ii=1:length(EbN0)
    SNR=EbN0(ii);
    sim('fz8_11');
    ber1(ii)=BER1(1);
    ber2(ii)=BER2(1);
    
end

ber=berawgn(EbN0,'psk',2,'nodiff');
semilogy(EbN0,ber,'-ko',EbN0,ber1,'-k*',EbN0,ber2,'-k.');
legend('BPSK�����������','Ӳ�о��������','���о��������');
title('���������');
xlabel('Eb/N0');ylabel('�������')