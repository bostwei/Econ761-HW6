%*************************************************************************
% Econ 761 HW6 
% Shiyan Wei
% 12/9/2018
% ************************************************************************

% ************************************************************************
% This script is to try replicating Berry(1992)
% ***********************************************************************



%Load the data
clear all
run loadLongData
iota = ones(length(enter),1);
X=[iota pop city2 distance];

simDraws=20;
u=normrnd(0,1,rows(X),simDraws);
data.y=enter;
data.x=X;
data.z=X;
data.sim=u;
