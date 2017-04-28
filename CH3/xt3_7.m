clear all
w=-1:0.0001:1;
n=0:20;
xn=2-0.5.^n;
Hjw=xn*(exp(-j*pi).^(n'*w));

subplot(2,1,1);plot(w,abs(Hjw));
title('Hjw');xlabel('pi���ȣ�w��');ylabel('���');

subplot(2,1,2);plot(w,angle(Hjw)/pi);
xlabel('pi���ȣ�w��');ylabel('��λ')