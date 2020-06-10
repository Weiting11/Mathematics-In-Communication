clear all;
close all;
K=10;
N=2*K;
T=0.5; % symbol duration

%% 16 QAM constellation
A=zeros(4,4);
for i=1:4
  for k=1:4
     A(i,k) = (i-2.5)*2 + sqrt(-1)*(k-2.5)*2;
  end
end
A

%% randomly generate K 16-QAM symbols
XX=zeros(1,K);
for i=1:K
   ind = 1+floor(16*rand);
   XX(i) = A(ind);
end

%% form conjugate symmetry sequence 

%X=[real(XX(1)),XX(2),XX(3),XX(4),XX(5),XX(6),XX(7),XX(8),XX(9),XX(10),imag(XX(1)),conj(XX(10)),conj(XX(9)),conj(XX(8)),conj(XX(7)),conj(XX(6)),conj(XX(5)),conj(XX(4)),conj(XX(3)),conj(XX(2))] ;   %<== fill here

 X=[real(XX(1)),XX(2:10),imag(XX(1)),conj(XX(10:-1:2))];




%% form OFDM signal by interpolating the IDFT of X

t = 0:T/(10*N):T;%x®y¼Ð
xt=zeros(size(t));
for k=0:N-1
   xt = xt + X(k+1)*exp(1i*2*pi*k*t/T);
end
 

%% IFFT of X, note that the definition of IFFT in OCTAVE may differ from that in textbook by a scalar.
xs=ifft(X)*N;
max(imag(xs)),  % check if xs is real or not    

hold on;
plot(t,real(xt),'--');
stem(0:T/N:(T-T/(10*N)),real(xs));
grid;
legend(['OFDM signal            ';'IFFT of symbol sequence']);
xlabel('time','fontsize',16,'fontname','Helvetica');
ylabel('Amplitude','fontsize',16,'fontname','Helvetica');
title(['OFDM Signal of ', num2str(K),' sub-carriers (410586010)'],'fontsize',16,'fontname','Helvetica');
fname = 'prob_08_02(410586010).png';
print (fname, '-dpng'); 

