function [ h] = rayleigh( fd,t)
%UNTITLED2 �˴���ʾ�йش˺�����ժҪ
%   fd:�ŵ���������Ƶ��
% t:�źų���ʱ�����У�����ʱ����
% hΪ����������ŵ���������һ��ʱ�亯��������

%��������䲨��Ŀ
N=40;
wm=2*pi*fd;

% ÿ���޵����䲨��Ŀ��������Ŀ
N0=N/4;

% �ŵ�����ʵ��
Tc=zeros(1,length(t));

% �ŵ������鲿
Ts=zeros(1,length(t));

%��һ������ϵ��
P_nor=sqrt(1/N0);

%�������·���ľ��ȷֲ������λ
theta=2*pi*rand(1,1)-pi;

for ii=1:N0
    % ��i�����䲨�������
    alfa(ii)=(2*pi*ii-pi+theta)/N;
    
    % ��ÿ�����ز������ڣ�-pi,pi��֮����ȷֲ��������λ
    fi_tc=2*pi*rand(1,1)-pi;
    fi_ts=2*pi*rand(1,1)-pi;
    
    %��������Ӧ����
    Tc=Tc+cos(cos(alfa(ii)) *wm*t+fi_tc);
    Ts=Ts+cos(cos(alfa(ii))*wm*t+fi_ts);
    
end

% �˹�һ������ϵ���õ��Ĵ��亯��
h=P_nor*(Tc+j*Ts);



end

