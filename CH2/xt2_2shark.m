function xdot= xt2_2shark( t,x )
%UNTITLED2 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��

r=1;
d=0.5;
a=0.1;
b=0.02;

xdot = diag([r-a*x(2), -d+b*x(1)]) *x;


end

