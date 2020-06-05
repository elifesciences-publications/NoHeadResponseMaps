clear all
load('Monkey1_Figure4_PSTH.mat')

imagecount=10; %11 for Monkey2
fulltimewindow=400;

% Main PSTH graphs
meanMLface=nanmean(nanmean(MLface,3),1);
semMLface=std(nanmean(MLface,3))/sqrt(size(MLface,1));

meanMLnonface=nanmean(nanmean(MLnonface,3),1);
semMLnonface=std(nanmean(MLnonface,3))/sqrt(size(MLnonface,1));

ts = tinv([0.025  0.975],imagecount);

figure
hold on
lineProps.col{1}=[1 0 0];
lineProps.col{2}=[.5 0 0];
lineProps.col{3}=[0 0 1];
lineProps.width=3;
transparent=1;
mseb([1:fulltimewindow;1:fulltimewindow],[meanMLface;meanMLnonface],[semMLface*ts(2);semMLnonface*ts(2)],lineProps,transparent)
set(gca,'linewidth',2)
set(gca,'TickLength',[0 0])