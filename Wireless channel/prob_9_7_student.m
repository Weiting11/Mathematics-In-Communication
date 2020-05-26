% Problem 9.7
clear all;
close all;
N=100000;
Eb = 1;
EbNo_dB = 0:5:35;
No_over_2  = Eb*10.^(-EbNo_dB/10);
sigma = 1;
BER = zeros(1,length(EbNo_dB));
for i=1:length(EbNo_dB)
   no_errors = 0;
   for k=1:N
      %% Generate a random bit
     %%  m= 0 or 1
      t=rand;
      if t<0.5
         m=0;
      else
         m=1;
      end 
      
      %% Generate a Rayleigh rv  
      u=rand;
      alpha = sigma*sqrt((-2)*log(u));  %%%%<=== fill here
       
      %% Generate AWGN
      noise = sqrt(No_over_2(i))*randn;

      %% Generate received data
     % y =  alpha*sqrt(Eb)*cos(m*pi) + noise;     % <===fill here
      if m == 0
          y=alpha*sqrt(Eb) + noise;
      else
          y = alpha*sqrt(Eb)*(-1) + noise;
      end
      
      %% Make decision
      if y > 0
         m_d = 0 ;   % <===fill here
      else
         m_d = 1 ;   % <===fill here
      end
      
      if m~=m_d
          no_errors = no_errors + 1;      
      end

   end
   BER(i) = no_errors/N;

end

rho_b = Eb./No_over_2*sigma^2;
P2 = 1/2*(1-sqrt(rho_b./(1+rho_b)));

semilogy(EbNo_dB,BER,'-*',EbNo_dB,P2,'-o');
xlabel('Average SNR/bit (dB)','fontsize',16,'fontname','Helvetica');
ylabel('Error Probability','fontsize',16,'fontname','Helvetica');
legend('Monte Carlo Simulation','Theoretical Value');
title(['Monte Carlo Simulation of Frequency Nonselective Channel (410586010)'],'fontsize',10,'fontname','Helvetica');
fname = 'prob_09_07(410586010).png';
print (fname, '-dpng'); 
