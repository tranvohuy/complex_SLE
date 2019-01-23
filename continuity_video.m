% video
% see how curve changes w.r.t kappa

clear all;
load('kappa1.mat','K');
load('SLE1.mat','X','Y');
%each columns of X and Y is for different kappa

[nt nk] = size(X); %number of different times and kappa
axis manual;
for i = 1:nk
  plot(X(:,i), Y(:,i));
  axis equal;
  xlim([-2 2]);
  ylim([0, 2]);
  xlabel('Real part');
  ylabel('Imag part');
  title(['kappa=' num2str(K(1,i))]);
  pause(0.1);
end

