clear all
nsamp=10; %ÿ�������źŵĳ�������

s0=ones(1,nsamp); %���������ź�
s1=[ones(1,nsamp/2) -ones(1,nsamp/2)];

nsymbol=100000; %ÿ��������µķ�����
EbN0=0:12;
msg=randint(1,nsymbol); %��Ϣ����
s00=zeros(nsymbol,1);
s11=zeros(nsymbol,1);
indx=find(msg==0); %����0�ڷ�����Ϣ�е�λ��
s00(indx)=1;
s00=s00*s0; %����0ӳ��Ϊ���Ͳ���s0
indx1=find(msg==1);
s11(indx1)=1;
s11=s11*s1;
s=s00+s11;  %�ܷ��Ͳ���
s=s.';%����ת�ã�������ն˴���

for indx=1:length(EbN0)
    decmsg=zeros(1,nsymbol);
    r=awgn(s,EbN0(indx)-7);
    r00=s0*r; %��s0���
    r11=s1*r;
    indx1=find(r11>=r00);
    decmsg(indx1)=1;
    [err,ber(indx)]=biterr(msg,decmsg);

end

semilogy(EbN0,ber,'-ko',EbN0,qfunc(sqrt(10.^(EbN0/10))));
title('�����������ź������������');
xlabel('EbN0');ylabel('�������Pe');
legend('������','���۽��')





       


