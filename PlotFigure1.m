clear all
load('Monkey1_Figure1_PSTH.mat')

imagecount=8;
fulltimewindow=400;

% Main PSTH graphs
meanMLface=nanmean(nanmean(MLface,3),1);
semMLface=std(nanmean(MLface,3))/sqrt(size(MLface,1));
meanMLnonface=nanmean(nanmean(MLnonface,3),1);
semMLnonface=std(nanmean(MLnonface,3))/sqrt(size(MLnonface,1));

meanPLface=mean(mean(PLface,3),1);
semPLface=std(mean(PLface,3))/sqrt(size(PLface,1));
meanPLnonface=mean(mean(PLnonface,3),1);
semPLnonface=std(mean(PLnonface,3))/sqrt(size(PLnonface,1));

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


figure
hold on
lineProps.col{1}=[1 0 0];
lineProps.col{2}=[.5 0 0];
lineProps.col{3}=[0 0 1];
lineProps.width=3;
transparent=1;
mseb([1:fulltimewindow;1:fulltimewindow],[meanPLface;meanPLnonface],[semPLface*ts(2);semPLnonface*ts(2)],lineProps,transparent)
set(gca,'linewidth',2)
set(gca,'TickLength',[0 0])
