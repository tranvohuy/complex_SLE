% view SLE
% view data pre-computed by 'continuity_of_tip_in_kappa.m'


% there are several ways to view curves.

% 
% First way. Plot in 3d and interpolate nicely between kappa
clear all;
hold on;
load('SLE.mat','X','Y');
plot(X,Y);
axis equal;