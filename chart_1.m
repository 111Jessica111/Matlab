%% 
% saveas(gcf,'<filename>','<formattype>');
% xlabel() 
% ylabel()
x=0:0.1:2*pi;
title()
y1=sin(x);
y2=exp(-x);
plot(x,y1,'--*',x,y2,':o');
xlabel('t=0 to 2\pi');
ylabel('values of sin(t) and e^{x}');
title('Function Plots of sin(t) and e^{x}');
legend('sin(t)','e^{x}');

%% 
% using LaTex
% text() & annotation() 
x=linspace(0,3);
y=x.^2.*sin(x);
plot(x,y);
line([2,2],[0,2^2*sin(2)]);
str='$$ \int_{0}^{2} x^2\sin(x) dx $$';
text(0.25,2.5,str,'Interpreter','latex');
annotation('arrow','X',[0.32,0.5],'Y',[0.6,0.4]);

%% 
% set()
x=0:0.01:2;
y1=x.^2;
y2=sin(2*pi.*x);
h=plot(x,y1,'k-',x,y2,'ro','MarkerFaceColor','r');
title('Mini Assignment #1');
xlabel('Time(ms)');
ylabel('t(t)');
legend('t^{2}','sin(2\pit)'); 
set(gca,'FontSize',20);
set(h,'LineWidth',1.0);

%% 
% figure
% figure('Positiopn',[left,bottom,width,height])
x=-10:0.1:10;
y1=x.^2-8;
y2=exp(x);
figure,plot(x,y1);
figure,plot(x,y2);

%% 
% subplot(m,n,1)
% grid on/off
% box on/off
% axis on/off
t=0:0.1:2*pi;
x=3*cos(t);
y=sin(t);
subplot(2,2,1);plot(x,y);axis normal
subplot(2,2,2);plot(x,y);axis equal
subplot(2,2,3);plot(x,y);axis square
subplot(2,2,4);plot(x,y);axis equal tight

%% 
% Logarithm Plots
x=logspace(-1,1,100);
y=x.^2;
subplot(2,2,1);plot(x,y);title('Plot');
subplot(2,2,2);semilogx(x,y);title('Semilogx');
subplot(2,2,3);semilogy(x,y);title('Semilogy');
subplot(2,2,4);loglog(x,y);title('Loglog');
set(gca,'XGrid','on');

%% 
% plotyy()
x=0:0.01:20;
y1=200*exp(-0.05*x).*sin(x);
y2=0.8*exp(-0.5*x).*sin(10*x);
[AX,H1,H2]=plotyy(x,y1,x,y2);
set(get(AX(1),'Ylabel'),'String','Left Y-axis');
set(get(AX(2),'Ylabel'),'String','Right Y-axis');
title('Labeling plotyy');
set(H1,'LineStyle','--');
set(H2,'LineStyle',':');

%% 
% Histogram
y=randn(1,1000);
subplot(2,2,1);
histogram(y,10);
title('Bins = 10');
subplot(2,2,2);
histogram(y,50);
title('Bins = 50');

%% 
% Bar Charts
x=[1 2 5 4 8];
y=[x;1:5];
subplot(2,3,1);
bar(x);
axis square;
title('A bargraph of vector x');
subplot(2,3,2);
bar(y);
axis square;
title('A bargraph of vector y');
subplot(2,3,3);
bar3(y);
axis square;
title('A 3D bargraph');
subplot(2,3,4);
bar(y,'stacked');
axis square;
title('stacked');
subplot(2,3,5);
barh(y);
axis square;
title('Horizontal');

%% 
% Pie Charts
a=[10 5 20 30];
subplot(1,3,1);
pie(a);
subplot(1,3,2);
pie(a,[0,1,0,1]);
subplot(1,3,3);
pie3(a,[1,0,1,0]);

%% 
% Polar Chart
x=1:100;
theta=x/10;
r=log10(x);
subplot(2,2,1);
polarplot(theta,r);
theta=linspace(0,2*pi);
r=cos(4*theta);
subplot(2,2,2);
polarplot(theta,r);
theta=linspace(0,2*pi,6);
r=ones(1,length(theta));
subplot(2,2,3);
polarplot(theta,r);
theta=linspace(0,2*pi);
r=1-sin(theta);
subplot(2,2,4);
polarplot(theta,r);

%% 
% Stairs and Stem Charts
 
