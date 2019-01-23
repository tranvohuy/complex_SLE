# simulate Loewner curve from complex-valued driving function
# the driving function is a complex (kappa) multiple of Brownian motion
# not (sqrt(kappa)) * Brownian_motion

# the body of the file inherits from continuity_in_kappa.m 
# in Newton's method folder

# we use Newton's method to compute the tip.

# -save computations in file 'SLE.mat' and 'kappa.mat'


# (view_SLE.m)
# this file is to view curves


clear all;

kappa = 0:0.1:2;
kappa_0 = 0.5 + 0.2 *1i;
nk = length(kappa);

file_read = 'sampleBM_N2000.txt';

fid = fopen(file_read);
A = fscanf(fid, '%f %f', [2 inf]);
fclose(fid);
T = A(1,:);
BrM = A(2,:);
N = length(T) - 1; 
DT = 1/(length(T)-1);


[K, Ti] = meshgrid(kappa, T);
% each row of K is a copy of kappa
% each column of Ti is a copy of T

X = zeros(size(K));
Y = zeros(size(K));
lambda = kappa*kappa_0;
  
%backward Loewner equation  + Newton
for t = 1: length(T)
  z = i*(0.01) + lambda*BrM(t);
  for j=1:(t-1)
    z = -2./(z-lambda*BrM(t-j+1)) * DT  + z;
  end
  X(t, :) = real(z);
  Y(t, :) = imag(z);  
end
  
  %save this curve to matrix X and Y
  %each column j, is the information of SLE_{kappa_j}

 
% save all information 
save('SLE1.mat','X','Y');
save('kappa1.mat','K');

%to see the simulation, use view_SLE.m