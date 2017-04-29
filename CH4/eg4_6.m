clear all
nSamp=8; %���������ȡ������
numSymb = 20000; %ÿ��SNR�´���ķ�����
M=4; %QPSK�ķ���������
SNR=-3:3; 
grayencod=[0 1 3 2];%����������ʽ
for ii=1:length(SNR)
    msg=randsrc(1,numSymb,[0:3]); %�������ͷ���
    msg_gr=grayencod(msg+1); %���и��ױ���ӳ��
    msg_tx=pskmod(msg_gr,M); %QPSK����
    msg_tx=rectpulse(msg_tx,nSamp); %�����������
    msg_rx=awgn(msg_tx,SNR(ii),'measured'); %ͨ��AWGN�ŵ�
    msg_rx_down=intdump(msg_rx,nSamp);%ƥ���˲�����ؽ��
    msg_gr_demod = pskdemod(msg_rx_down,M); %QPSK���
    [dummy graydecod]=sort(grayencod); 
    graydecod=graydecod-1;
    msg_demod=graydecod(msg_gr_demod+1); %���ױ�����ӳ��
    [errorBit BER(ii)]=biterr(msg,msg_demod,log2(M)); %����BER
    [errorSym SER(ii)]=symerr(msg,msg_demod); %����SER
    
end

scatterplot(msg_tx(1:100)); %���������ź�����ͼ
title('�����ź�����ͼ')
xlabel('ͬ�����');ylabel('��������');

scatterplot(msg_rx(1:100))  %���������źŵ�����ͼ
title('�����ź�����ͼ')
xlabel('ͬ�����');ylabel('��������');

figure
semilogy(SNR,BER,'-r*',SNR,SER,'-g*')  %����BER��SNR��SNR�仯������
legend('BER','SER');
title('QPSK��AWGN�ŵ��µ�����');
xlabel('����ȣ�dB��');ylabel('������ʺ��������')











