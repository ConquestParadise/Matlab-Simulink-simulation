clear all
N=100000;   %���͵�֡��
L=16;   %һ֡�е���Ϣ���ظ���
poly=[1 1 1 0 1 0 1 0 1];   %CRC���ɶ���ʽ
N1=length(poly)-1;  %CRC����
EbN0=0:10;
ber=berawgn(EbN0,'qam',16); %16-QAM�����������

for indx=1:length(ber)
    pe=ber(indx);   %BSC�ŵ��������
    for iter=1:N
        msg=randint(1,L);   %��Ϣ����
        msg1=[msg zeros(1,N1)]; %��Ϣ��������
        [q,r]=deconv(msg1,poly);%�ö���ʽ������CRCУ���룬qΪ�̣�rΪ����
        r=mod(abs(r),2);
        crc=r(L+1:end);%CRCУ����
        frame=[msg crc];    %����֡
        x=bsc(frame,pe);    %ͨ�������ƶԳ��ŵ�
        [q1,r1]=deconv(x,poly); %�������г��Զ���ʽ
        r1=mod(abs(r1),2);
        err(iter)=biterr(frame,x);  %ͳ�Ʊ�֡�Ƿ��������
        err1(iter)=sum(r1); %ͨ��CRCͳ�Ʊ�֡�Ƿ��������
        
    end
    fer1(indx)=sum(err~=0); %��֡��
    fer2(indx)=sum(r1); %CRCͳ�Ʊ�֡�Ƿ��������
    
end
pmissed=(fer1-fer2)/N;  %CRC��©�ĸ���
semilogy(EbN0,pmissed)
title('CRC-8�������')
xlabel('Eb/N0');ylabel('©�����')





