clear all
snr=-3:3;
SimulationTime=10; %�������ʱ��
for ii=1:length(snr)
    SNR=snr(ii); %��ֵ��AWGNģ����SNR
    sim('fz4_7'); %���з���
    ber(ii)= BER(1); %���汾�η���õ���BER
    ser(ii)=SER(1);
    
end

figure
semilogy(snr,ber,'-ro',snr,ser,'-b*');
legend('BER','SER')
title('QPSK��AWGN�ŵ��µ�����')
xlabel('����ȣ�db��');ylabel('������ʺ��������')