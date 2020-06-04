clear  all
load('Monkey2_Figure6.mat')

imagecount=7;
fulltimewindow=400;
histogram_timewindow=[100:250];

% Main PSTH graphs
meanMLheadbody=mean(mean(MLheadbody,3),1);
semMLheadbody=std(mean(MLheadbody,3))/sqrt(size(MLheadbody,1));
meanMLheadonly=mean(mean(MLheadonly,3),1);
semMLheadonly=std(mean(MLheadonly,3))/sqrt(size(MLheadonly,1));

meanMLnoiseheadbody=mean(mean(MLnoiseheadbody,3),1);
semMLnoiseheadbody=std(mean(MLnoiseheadbody,3))/sqrt(size(MLnoiseheadbody,1));
meanMLnoiseheadonly=mean(mean(MLnoiseheadonly,3),1);
semMLnoiseheadonly=std(mean(MLnoiseheadonly,3))/sqrt(size(MLnoiseheadonly,1));

meanMLoutlineheadbody=mean(mean(MLoutlineheadbody,3),1);
semMLoutlineheadbody=std(mean(MLoutlineheadbody,3))/sqrt(size(MLoutlineheadbody,1));
meanMLoutlineheadonly=mean(mean(MLoutlineheadonly,3),1);
semMLoutlineheadonly=std(mean(MLoutlineheadonly,3))/sqrt(size(MLoutlineheadonly,1));

meanMLobjectbody=mean(mean(MLobjectbody,3),1);
semMLobjectbody=std(mean(MLobjectbody,3))/sqrt(size(MLobjectbody,1));
meanMLobjectonly=mean(mean(MLobjectonly,3),1);
semMLobjectonly=std(mean(MLobjectonly,3))/sqrt(size(MLobjectonly,1));

ts = tinv([0.025  0.975],imagecount);

figure
hold on
lineProps.col{1}=[1 0 0];
lineProps.col{2}=[.5 0 0];
lineProps.col{3}=[0 0 1];
lineProps.width=3;
transparent=1;
mseb([1:fulltimewindow;1:fulltimewindow],[meanMLnoiseheadbody;meanMLnoiseheadonly],[semMLnoiseheadbody*ts(2);semMLnoiseheadonly*ts(2)],lineProps,transparent)
set(gca,'linewidth',2)
set(gca,'TickLength',[0 0])

