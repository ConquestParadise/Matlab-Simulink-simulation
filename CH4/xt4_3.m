clear all
snr=-15:10;
SimulationTime=10; %�������ʱ��
%%
for ii=1:length(snr)
    SNR=snr(ii);
    sim('fzxt4_3');
    ber(ii)=BER(1);  %���汾�η���õ���BER
   
end

%%
figure
semilogy(snr,ber,'-ro');
legend('BER');
title('QPSK��AWGN�ŵ��µ�����')
xlabel('����ȣ�dB��');ylabel('�������');
