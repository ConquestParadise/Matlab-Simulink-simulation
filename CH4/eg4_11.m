clear all
snr=-3:3;
SimulationTime=0; %�������ʱ��
eg4_7; %����eg4_7
ser1=ser;ber1=ber; %����ʾ��4.7���
%%
for ii=1:length(snr)
    SNR=snr(ii);
    sim('fz4_11');
    ber(ii)=BER(1); %���汾�η���õ���BER
    ser(ii)=SER(1); %���汾�η���õ���SER
  
end
%%
semilogy(snr,ber,'-rs',snr,ser,'-r^',snr,ber1,'-bo',snr,ser1,'-b*')
legend('Rayleigh˥��+AWGN�ŵ�BER','Rayleigh˥��+AWGN�ŵ�SER','AWGN�ŵ�BER','AWGN�ŵ�SER');
title('QPSK��AWGN�ͶྶRayleigh˥���µ�����')
xlabel('����ȣ�dB��')
ylabel('������ʺ��������')



