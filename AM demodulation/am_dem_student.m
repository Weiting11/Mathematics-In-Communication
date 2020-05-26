
%graphics_toolkit gnuplot;
clear;
close all;

t0=.2;                              	% signal duration
ts=0.001;                            	% sampling interval
fc=250;                              	% carrier frequency
a=0.85;                              	% Modulation index
fs=1/ts;                             	% sampling frequency
t=[0:ts:3*t0/4];                         	% time vector
df=0.25;                             	% required frequency resolution

% message signal
m=[(0:ts:t0/4-ts),(0.05*ones(1,length(t0/4:ts:2*t0/4-ts))),((2*t0/4:ts:3*t0/4)-0.15)*(-1)];                                    %<==== fill the message signal

c=cos(2*pi*fc.*t);                   	% carrier signal
m_n=m/max(abs(m));                   	% normalized message signal
[M,m,df1]=fftseq(m,ts,df);           	% Fourier transform 
f=[0:df1:df1*(length(m)-1)]-fs/2;    	% frequency vector
u=(1+a*m_n).*c;                      	% modulated signal

r=u;                                    % recieved signal, without noise
y=r.*c;                                 % 

%%% Do demodulation
[Y,y,df1]=fftseq(y,ts,df);           	% Fourier transform 
Y=Y/fs;                                 % scaling

f_cutoff= fc;                        	    %<==== fill the cut-off frequency 
n_cutoff=floor(f_cutoff/df1);             	% design the filter
f=[0:df1:df1*(length(y)-1)] - fs/2;
H=zeros(size(f));                    
H(1:n_cutoff)=2*ones(1,n_cutoff);    
H(length(f)-n_cutoff+1:length(f))=2*ones(1,n_cutoff);
DEM=H.*Y;			                	% spectrum of the filter output
dem=real(ifft(DEM))*fs;		     	% filter output
dem=2*(dem-1)/a;                    % convert back to message

subplot(3,1,1)
plot(t,m(1:length(t)))
%axis([0 0.2 -2.1 2.1])
%xlabel('Time')
title('The message signal')

subplot(3,1,2)
plot(t,u(1:length(t)))
%axis([0 0.2 -2.1 2.1])
%xlabel('Time')
title('The modulated signal')

subplot(3,1,3)
plot(t,dem(1:length(t)))
%axis([0 0.2 -2.1 2.1])
xlabel('Time')
title('The demodulated signal')

fname = 'prob_03_09(410586010).png';
print (fname, '-dpng'); 


