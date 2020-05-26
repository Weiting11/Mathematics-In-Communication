
%graphics_toolkit gnuplot;
clear all;
close all;


t=(-0.2:0.001:0.2);

s1 = zeros(size(t));
N1=10;
for n=0:N1
   s1 = s1 + sin((2*n+1)*t)/(2*n+1);
end
s1=s1*4/pi;


s2 = zeros(size(t));
N2=50;
for n=0:N2
   s2 = s2 + sin((2*n+1)*t)/(2*n+1);
end
s2=s2*4/pi;


s3 = zeros(size(t));
N3=1000
% add lines to  calculate the Fourier series up to N=100
for n=0:N3
   s3 = s3 + sin((2*n+1)*t)/(2*n+1);
end
s3=s3*4/pi;


figure
% Modify the following line to add a GREEN line for N3 
plot(t,s1,'r-',t,s2,'k-.',t,s3,'g-'); 
xlabel('t','fontsize',16,'fontname','Helvetica');
ylabel('x(t)','fontsize',16,'fontname','Helvetica');
title('Fourier Series of x(t) (410586010)','fontsize',16,'fontname','Helvetica'); %<-- Fill your id

% Modify the following line to (1) show N3 in addition, and (2) change the location to top-left  
legend(['N=  ',num2str(N1);'N=  ',num2str(N2);'N=',num2str(N3)],'location','northwest'); 

fname = 'prob_fourier_01(410586010).png';  %<-- Fill your id
print (fname, '-dpng'); 
