
clear all
load('Monkey1_Figure5_PSTH.mat')

imagecount=8; %15 for Monkey2
fulltimewindow=400;

% Main PSTH graphs
meanMLobjectfacee=nanmean(nanmean(MLobjectface,3),1);
semMLobjectface=std(nanmean(MLobjectface,3))/sqrt(size(MLobjectface,1));

meanMLobject=nanmean(nanmean(MLobject,3),1);
semMLobject=std(nanmean(MLobject,3))/sqrt(size(MLobject,1));

ts = tinv([0.025  0.975],imagecount);

figure
hold on
lineProps.col{1}=[1 0 0];
lineProps.col{2}=[.5 0 0];
lineProps.col{3}=[0 0 1];
lineProps.width=3;
transparent=1;
mseb([1:fulltimewindow;1:fulltimewindow],[meanMLobjectfacee;meanMLobject],[semMLobjectface*ts(2);semMLobject*ts(2)],lineProps,transparent)
set(gca,'linewidth',2)
set(gca,'TickLength',[0 0])

