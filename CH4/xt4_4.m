clear all
fd=120; %������Ƶ��
ts=1/100000; %�źų���ʱ����
t=0:ts:1;
tau=[0 6e-5 11e-5]; %�ྶ�ӳ�
pdb=[0 -3 -6]; %��������
chan = rayleighchan(ts,fd,tau,pdb);
%plot( 20*log10(abs(chan) )  );

title('fd=120Hzʱ���ŵ���������');
xlabel('ʱ��');ylabel('����');