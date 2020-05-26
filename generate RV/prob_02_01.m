%% prob 2.1
%graphics_toolkit gnuplot;
clear;
close all;

%Gemerate r.v Y with pdf fY(y)=c*y,0<=y<=3 ,0,o.w


NX = 1000;
X = rand(NX,1); % generate 1000 uniformly distributed rv

Y=3*sqrt(X); % <=== Modify here �bmatlab����x�}�ۭ���* �A�x�}���������ۭ���.*

%CDF: P(Y<=y) = [#(Y<=y)]/Nx ;Y<=���w��y�����v

Nbin=60; %�b0~1������60��
FY = zeros(Nbin,1); % prepare to store the cdf for Nbin bins

Ymin=0; % min Y % <=== Modify here
Ymax=3; % max % <=== Modify here

for i=1:Nbin
  yt = Ymin + Ymax*i/Nbin;
  FY(i) = length(find(Y<=yt))/NX; %function "find()"�D�XY<=y���ȡA�A��length()�p��X�`��
end

bins = Ymin + (Ymax-Ymin)*(1:Nbin)/Nbin;

figure

idealFY=(bins.*bins)/9; % <=== Modify here


plot(bins,FY,'-',bins,idealFY,'-.');

xlabel('Y','fontsize',16,'fontname','Helvetica');
ylabel('CDF of Y','fontsize',16,'fontname','Helvetica');
title('CDF of Y (410586010)','fontsize',16,'fontname','Helvetica');
legend(['Simulated CDF';'Ideal CDF    '],'location','northwest');
text(3,1,' c = 2/9');
fname = 'prob_02_01(410586010).png';
print (fname, '-dpng'); 
