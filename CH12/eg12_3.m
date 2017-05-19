clear all
%����V-BALST�ṹZF����㷨���ܣ�QPSK����

Nt=4;   %����������
Nr=4;   %����������
N=10;   %ÿ֡����
L=10000;    %�������֡��
EbN0=0:2:20;
M=4;
x=randint(N*L,Nt,M);    %��Դ����
s=pskmod(x,M,pi/4);

for  indx=1:length(EbN0)
    s1=[];
    s2=[];
    s3=[];
    for indx1=1:L
        h=randn(Nt,Nr)+j*randn(Nt,Nr);  %Rayleigh˥���ŵ�ϵ��
        h=h./sqrt(2);   %�ŵ�ϵ����һ��
        [q1,r1]=qr(h'); %�ŵ�ϵ������QR�ֽ�
        r=r1(1:Nt,:)';  %����R
        q=q1(:,1:Nt)';
        
        sigma1=sqrt(1/(10.^(EbN0(indx)/10)));   %ÿ���������ߵĸ�˹��������׼��
        n=sigma1*(randn(N,Nr)+j*randn(N,Nr));   %ÿ���������ߵĸ�˹������
        
        y=s((indx1-1)*N+1:indx1*N,:)*h*q'+n*q'; %�ź�ͨ���ŵ�
        
        y1=y*inv(r);    %�޸�������ʱ��ZF���
        s1=[s1;pskdemod(y1,M,pi/4)];
        
        %�и�������ʱ��ZF���
        y(:,Nt)=y(:,Nt)./(r(Nt,Nt));    %����Nt��
        y1(:,Nt)=pskdemod(y(:,Nt),M,pi/4);  %�����Nt��
        y(:,Nt)=pskmod(y1(:,Nt),M,pi/4);    %�Ե�Nt����������½��е���
        y2=y;
        y3=y1;
        
        for jj=Nt-1:-1:1    %����Nt-1:1 ��
            for kk=jj+1:Nt
                y(:,jj)=y(:,jj)-r(kk,jj).*y(:,kk);  %�������������
                y2(:,jj)=y2(:,jj)-r(kk,jj).*s((indx1-1)*N+1:indx1*N,kk);
                
            end
            
            y(:,jj)=y(:,jj)./r(jj,jj);
            y2(:,jj)=y2(:,jj)./r(jj,jj);    %��jj���о�����
            y1(:,jj)=pskdemod(y(:,jj),M,pi/4);  %�Ե�jj����
            y3(:,jj)=pskdemod(y2(:,jj),M,pi/4);
            y(:,jj)=pskmod(y1(:,jj),M,pi/4);    %��jj����������½��н��
            y2(:,jj)=pskmod(y3(:,jj),M,pi/4);
           
        end
        
        s2=[s2;y1];
        s3=[s3;y3];
        
    end
    
    [temp,ber1(indx)]=biterr(x,s1,log2(M)); %�޸�������ʱ��ϵͳ������
    [temp,ber2(indx)]=biterr(x,s2,log2(M)); %�������������ʱϵͳ�ܵ�������
    [temp,ber3(indx)]=biterr(x,s3,log2(M)); %�����������ʱϵͳ�ܵ�������
    
    [temp,ber24(indx)]=biterr(x(:,1),s2(:,1),log2(M));  %�������������ʱ��4���������
    [temp,ber23(indx)]=biterr(x(:,2),s2(:,2),log2(M)); %�������������ʱ��3���������
   [temp,ber22(indx)]=biterr(x(:,3),s2(:,3),log2(M));   %�������������ʱ��2���������
   [temp,ber21(indx)]=biterr(x(:,4),s2(:,4),log2(M));   %�������������ʱ1��������
   
   [temp,ber34(indx)]=biterr(x(:,1),s3(:,1),log2(M));   %�����������ʱ��4��������
   [temp,ber33(indx)]=biterr(x(:,2),s3(:,2),log2(M));
   [temp,ber32(indx)]=biterr(x(:,3),s3(:,3),log2(M));
   [temp,ber31(indx)]=biterr(x(:,4),s3(:,4),log2(M));
      
end

semilogy(EbN0,ber1,'-k*',EbN0,ber2,'-ko',EbN0,ber3,'-kd')
title('V-BLAST�ṹZF����㷨����')
legend('�޸�������','�������������','�����������')
xlabel('EbN0(dB)')
ylabel('BER')

figure
semilogy(EbN0,ber34,'-k*',EbN0,ber33,'-ko',EbN0,ber32,'-kd',EbN0,ber31,'-k^')
title('�����������ʱZF����㷨��������')
legend('��1��','2��','3��','4��')
xlabel('EbN0')
ylabel('BER')

figure
semilogy(EbN0,ber24,'-k*',EbN0,ber23,'-ko',EbN0,ber22,'-kd',EbN0,ber21,'-k^')
title('�������������ʱZF����㷨��������')
xlabel('EbN0')
ylabel('BER')








