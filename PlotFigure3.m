clear all
load('Monkey1_Figure2_PSTH.mat')

imagecount=12; %10 for  Monkey 2
fulltimewindow=400;

% Main PSTH graphs
meanMLface=nanmean(nanmean(MLface,3),1);
semMLface=std(nanmean(MLface,3))/sqrt(size(MLface,1));

meanMLnonface=nanmean(nanmean(MLnonface,3),1);
semMLnonface=std(nanmean(MLnonface,3))/sqrt(size(MLnonface,1));

meanMLfaceoccluded=nanmean(nanmean(MLfaceoccluded,3),1);
semMLfaceoccluded=std(nanmean(MLfaceoccluded,3))/sqrt(size(MLfaceoccluded,1));


ts = tinv([0.025  0.975],imagecount);

figure
hold on
lineProps.col{1}=[1 0 0];
lineProps.col{2}=[.5 0 0];
lineProps.col{3}=[0 0 1];
lineProps.width=3;
transparent=1;
mseb([1:fulltimewindow;1:fulltimewindow;1:fulltimewindow],[meanMLface;meanMLfaceoccluded;meanMLnonface],[semMLface*ts(2);semMLfaceoccluded*ts(2);semMLnonface*ts(2)],lineProps,transparent)
set(gca,'linewidth',2)
set(gca,'TickLength',[0 0])