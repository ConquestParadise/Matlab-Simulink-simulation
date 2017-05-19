%����Alamouti 2��2�տ�ʱ�������ܣ����Ʒ�ʽQPSK
clear all
datasize=100000;    %���������
EbN0=0:2:20;
M=4;
x=randsrc(2,datasize/2,[0:3]);  %����Դ
x1=pskmod(x,M,pi/4);
h=randn(4,datasize/2)+j*randn(4,datasize/2);    %   Rayleighƽ˥���ŵ�
h=h./sqrt(2);

for indx=1:length(EbN0)
    sigma1=sqrt(1/(4*10.^(EbN0(indx)/10))); %SISO�ŵ���˹��������׼��
    n=sigma1*(randn(2,datasize/2)+j*randn(2,datasize/2));
    y=x1+n; %ͨ��AWGN�ŵ�
    y1=x1+n./h(1:2,:);  %ͨ��SISO����˥���ŵ�����о�����
    x2=pskdemod(y,M,pi/4);
    x3=pskdemod(y1,M,pi/4);
    sigma2=sqrt(1/(2*10.^(EbN0(indx)/10))); %Alamouti����ÿ�����ŵ���˹��������׼��
    n=sigma2*(randn(4,datasize/2)+j*randn(4,datasize/2));
    
    %2��1�� Almouti�����о������е�������
    n1(1,:)=(conj(h(1,:)).*n(1,:)+h(2,:).*conj(n(2,:)))./(sum(abs(h(1:2,:)).^2));
    n1(2,:)=(conj(h(2,:)).*n(1,:)-h(1,:).*conj(n(2,:)))./(sum(abs(h(1:2,:)).^2));
    
    y=x1+n1;
    x4=pskdemod(y,M,pi/4);
    %2��2��Almouti�����о������е�������
    n2(1,:)=(conj(h(1,:)).*n(1,:)+h(2,:).*conj(n(2,:))+conj(h(3,:)).*n(3,:)+h(4,:).*conj(n(4,:)))./(sum(abs(h).^2));
    
    n2(2,:)=(conj(h(2,:)).*n(1,:)-h(1,:).*conj(n(2,:))+conj(h(4,:)).*n(3,:)-h(3,:).*conj(n(4,:)))./(sum(abs(h).^2));
    
    y1=x1+n2;
    x5=pskdemod(y1,M,pi/4);
    [temp,ber1(indx)]=biterr(x,x2,log2(M));
    [temp,ber2(indx)]=biterr(x,x3,log2(M));
    [temp,ber3(indx)]=biterr(x,x4,log2(M));
    [temp,ber4(indx)]=biterr(x,x5,log2(M));
    
end
semilogy(EbN0,ber1,'-k*',EbN0,ber2,'-ko',EbN0,ber3,'-kd',EbN0,ber4,'-k.')
grid on
legend('AWGN�ŵ�','SISO����˥���ŵ�','2��1��Almouti����','2��2��Almouti����')
xlabel('�����Eb/N0(dB)')
ylabel('������ʣ�BER��')
title('Almouti����������˥���ŵ��µ�����')




