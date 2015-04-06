% demo of the finite element method for the problem -u'' = 1

N = 4;
h = 1/(N+1);
x = [1:N]*h;

% construct the stiffness matrix (integrals done by hand)

maindiag = 2/h*ones(N,1);
offdiag = -1/h*ones(N-1,1);
K = diag(maindiag) + diag(offdiag,1) + diag(offdiag,-1);

% construct the load vector (integrals done by hand)
b = ones(N,1)*h; % f for solution #2 and #3

% solve for expansion coefficients of Galerkin approximation
c = K\b;

% plot the true solution
xx = linspace(0,1,500)';     % finely spaced points between 0 and 1.
u = .5*xx.*(1-xx);      % true solution

figure(1), clf
plot(xx, u, 'b-','linewidth',2)
hold on

% plot the approximation solution
uN = zeros(size(xx));
for j=1:N
    uN = uN + c(j)*hat(xx,j,N);
end
plot(xx, uN, 'r-','linewidth',2)

set(gca,'fontsize',16)
xlabel('x')
legend('true solution', 'u_N(x)')
title(sprintf('N = %d', N))

figure(2)
% plot the error in the solution for this N
plot(xx, u-uN, 'r-','linewidth',2)
set(gca,'fontsize',16)
xlabel('x')
ylabel(' u(x) - u_N(x)')

% approximate the maximum error for this value of N
maxerr = max(abs(u - uN));
title(['Max error = ' num2str(maxerr)])