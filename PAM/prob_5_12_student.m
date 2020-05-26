% MATLAB script for Illustrated Problem 5.8.
 clear all;
 close all;
SNRindB1=0:1:12;	  		
SNRindB2=0:0.1:12;			
for i=1:length(SNRindB1)
  % simulated error rate 
  smld_err_prb(i)=smldpe512_student(SNRindB1(i));    
end

for i=1:length(SNRindB2)
  % signal-to-noise ratio
  SNR_per_bit=exp(SNRindB2(i)*log(10)/10);  
  % theoretical error rate
  theo_err_prb(i)=(3/2)*qfunc(sqrt((4/5)*SNR_per_bit)); 

end

% Plotting commands follow.

semilogy(SNRindB1,smld_err_prb,'*');
hold on
semilogy(SNRindB2,theo_err_prb);
grid;
xlabel('10 log_{10}E/N_0');
ylabel('Symbol Error Probability')
title('Error Probability for M=4 PAM');

fname = 'prob_05_12(410586010).png';
print (fname, '-dpng'); 

