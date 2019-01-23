# simulate Loewner curve from complex-valued driving function
# the driving function is a complex (kappa) multiple of Brownian motion
# not (sqrt(kappa)) * Brownian_motion

# theh body of the file inherits from continuity_in_kappa.m

# we use Newton's method to compute the tip.

# (view_SLE.m)
# this file is to view curves


clear all;

kappa = 0.5 + 0.2*i;

file_read = 'sampleBM_N2000.txt';

fid = fopen(file_read);
A = fscanf(fid, '%f %f', [2 inf]);
fclose(fid);
T = A(1,:);
BrM = A(2,:);
N = length(T) - 1; 
DT = 1/(length(T)-1);


% each row of K is a copy of kappa
% each column of Ti is a copy of T

X = zeros(size(T));
Y = zeros(size(T));
BrM = fliplr(BrM);
%backward Loewner equation  + Newton
for t = 1: length(T)
  z = i*(0.01) + BrM(t);
  for j=1:(t-1)
    z = -2./(z-BrM(t-j+1)) * DT  + z;
  end
  X(t) = real(z);
  Y(t) = imag(z);  
end
  
  %save this curve to matrix X and Y
  %each column j, is the information of SLE_{kappa_j}

 
% save all information 
save('SLE.mat','X','Y');

%to see the simulation, use view_SLE.m