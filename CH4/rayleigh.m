function [h]=rayleigh(fd,t)
%���øĽ���jakesģ��������������ƽ̹������˥���ŵ�
% fd:�ŵ�����������Ƶ�ƣ�Hz
% t:�źŵĳ���ʱ������
% h:����������ŵ���������һ��ʱ�亯��������

N=40; %���䲨��Ŀ
wm=2*pi*fd;

N0=N/4; %ÿ���޵����䲨��Ŀ��������Ŀ

Tc=zeros(1,length(t)); %�ŵ�������ʵ��
Ts =zeros(1,length(t)); %�ŵ��������鲿

P_nor=sqrt(1/N0); %��һ������ϵ��

theta=2*pi*rand(1,1)-pi; %����ÿ��·���ľ��ȷֲ������λ

for ii=1:N0
    alfa(ii)=(2*pi*ii-pi+theta)/N; %��i�����䲨�������
    fi_tc=2*pi*rand(1,1)-pi; %��ÿ�����ز������ڣ�-pi,pi��֮����ȷֲ��������λ
    fi_ts=2*pi*rand(1,1)-pi;
    
    Tc=Tc+cos(cos(alfa(ii))*wm*t+fi_tc);
    Ts=Ts+cos(sin(alfa(ii))*wm*t+fi_ts);
    
    
end

h=P_nor*(Tc+j*Ts); %��һ������ϵ���õ����亯��




