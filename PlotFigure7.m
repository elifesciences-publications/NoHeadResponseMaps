clear all
load('Monkey1_Figure7.mat')

imagecount=7;
fulltimewindow=450;

% Main PSTH graphs
meanMLuprighthead=mean(mean(MLuprighthead,3),1);
semMLuprighthead=std(mean(MLuprighthead,3))/sqrt(size(MLuprighthead,1));
meanMLinvhead=mean(mean(MLinvhead,3),1);
semMLinvhead=std(mean(MLinvhead,3))/sqrt(size(MLinvhead,1));

meanMLuprightnoisehead=mean(mean(MLuprightnoisehead,3),1);
semMLuprightnoisehead=std(mean(MLuprightnoisehead,3))/sqrt(size(MLuprightnoisehead,1));
meanMLinvuprightnoisehead=mean(mean(MLinvuprightnoisehead,3),1);
semMLinvuprightnoisehead=std(mean(MLinvuprightnoisehead,3))/sqrt(size(MLinvuprightnoisehead,1));

ts = tinv([0.025  0.975],imagecount);

figure
hold on
lineProps.col{1}=[1 0 0];
lineProps.col{2}=[.5 0 0];
lineProps.col{3}=[0 0 1];
lineProps.width=3;
transparent=1;
mseb([1:fulltimewindow;1:fulltimewindow],[meanMLuprighthead;meanMLinvhead],[semMLuprighthead*ts(2);semMLinvhead*ts(2)],lineProps,transparent)
set(gca,'linewidth',2)
set(gca,'TickLength',[0 0])


figure
hold on
lineProps.col{1}=[1 0 0];
lineProps.col{2}=[.5 0 0];
lineProps.col{3}=[0 0 1];
lineProps.width=3;
transparent=1;
mseb([1:fulltimewindow;1:fulltimewindow],[meanMLuprightnoisehead;meanMLinvuprightnoisehead],[semMLuprightnoisehead*ts(2);semMLinvuprightnoisehead*ts(2)],lineProps,transparent)
set(gca,'linewidth',2)
set(gca,'TickLength',[0 0])

