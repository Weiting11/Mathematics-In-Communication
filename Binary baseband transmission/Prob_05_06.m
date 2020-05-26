% MATLAB script for Illustrative Problem 5.6.
clear all;
close all;
%graphics_toolkit gnuplot;

echo on
SNRindB1=0:1:12;
SNRindB2=0:0.1:12;
for i=1:length(SNRindB1)
  % simulated error rate
  % rename smldpe56_student.m to smldpe56.m
  smld_err_prb(i)=smldpe56(SNRindB1(i));   
  echo off ;
end
echo on ;
for i=1:length(SNRindB2)
  SNR=exp(SNRindB2(i)*log(10)/10);  
  % theoretical error rate    
  % theo_err_prb(i) = qfunc(sqrt(SNR)); 
  theo_err_prb(i) = qfunc(sqrt(SNR));    
  echo off ;
end
echo on;
% Plotting commands follow.
semilogy(SNRindB1,smld_err_prb,'*');
hold on
semilogy(SNRindB2,theo_err_prb);
grid;
xlabel('10 log_{10}E/N_0');
ylabel('Error Probability')


fname = 'prob_05_06(410586010).png';
print (fname, '-dpng'); 

