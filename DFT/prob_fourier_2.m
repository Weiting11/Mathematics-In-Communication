%

%graphics_toolkit gnuplot;
clear all;
close all;

nx=32;
x=randn(nx,1); 
xdft=mydft(x); % write your own dft function with name "mydft"
xfft=fft(x);

max(abs(xdft-xfft))

figure(1);
plot(abs(xdft-xfft));
xlabel('index','fontsize',16,'fontname','Helvetica');
ylabel('absolute error','fontsize',16,'fontname','Helvetica');
title('Difference between mydft and dft (410586010)','fontsize',12,'fontname','Helvetica');
fname = 'prob_fourier_2_1(410586010).png';  %<-- Fill your id
print (fname, '-dpng'); 

ntry=7;
timedft=zeros(1,ntry);
timefft=zeros(1,ntry);

for k=1:ntry
   nx = 2^(k+2);
   x=randn(nx,1);   
   tic();
   xdft=mydft(x);
   timedft(k) = toc();
   tic();
   xfft=fft(x);
   timefft(k) = toc();   
end



figure(2);
semilogy(((1:ntry)+2),timedft,'-o',((1:ntry)+2),timefft,'-x');
grid;
legend(['dft';'fft']);
xlabel('transform size (2^n)','fontsize',16,'fontname','Helvetica');
ylabel('Elapsed time (sec)','fontsize',16,'fontname','Helvetica');
title('Comparsion of elapsed times between dct and dft (410586010)','fontsize',16,'fontname','Helvetica');
fname = 'prob_fourier_2_2(410586010).png';  %<-- Fill your id
print (fname, '-dpng'); 
