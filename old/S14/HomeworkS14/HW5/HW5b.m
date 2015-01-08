clear
clc
alpha=0;
beta=0;
figure(1)
clf
x=linspace(0,1,1000);
u=-x.^4+4*x.^3-2*x.^2-alpha*x+alpha+beta-1;
plot(x, u, '-k')
xlabel('$x$','interpreter','latex','FontSize',12)
ylabel('$u(x)$ ($\alpha=0$, $\beta=0$)','interpreter','latex','FontSize',12)
saveas(figure(1),'hw5b.eps','epsc')