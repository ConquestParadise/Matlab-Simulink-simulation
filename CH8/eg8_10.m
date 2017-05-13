clear all
EbN0=0:10;
N=1000000;  %��Ϣ���ظ���
M=2;    %BPSK
L=7;    %Լ������
trel=poly2trellis(L,[171 133]);
tblen=6*L;  %ά�ر�����������
msg=randint(1,N);%��Ϣ��������
msg1=convenc(msg,trel); %�������
x1=pskmod(msg1,M);  

for ii=1:length(EbN0)
    %�����˹����������Ϊ������1/2������ÿ�����ŵ�����Ҫ�ȱ���������3db
    y=awgn(x1,EbN0(ii)-3);
    y1=pskdemod(y,M);   %Ӳ�о�
    y1=vitdec(y1,trel,tblen,'cont','hard');
    [err,ber1(ii)]=biterr(y1(tblen+1:end),msg(1:end-tblen));    %�������
    
    y2=vitdec(real(y),trel,tblen,'cont','unquant');%���о�
    [err,ber2(ii)]=biterr(y2(tblen+1:end),msg(1:end-tblen));
end

ber=berawgn(EbN0,'psk',2,'nodiff'); %BPSK�����������
semilogy(EbN0,ber,'-ko',EbN0,ber1,'-k*',EbN0,ber2,'-k.');
legend('BPSK�����������','Ӳ�о��������','���о��������')
title('���������')
xlabel('Eb/N0');ylabel('�������')







