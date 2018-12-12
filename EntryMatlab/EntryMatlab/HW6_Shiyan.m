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
clc
clear all
run loadWideData;
const=ones(size(pop,1),1);
x=[const pop distance];
xi=[sharepaxdist];
z=[x, xi];			%Remember that the number of insturements must be greater than num of paramters.
y=totenter;
w=inv(z'*z);

%Simulation draws are taken for each market and each airline in each market
simDraws=10;
t=simDraws+simDraws*numAirlines;
%sim=normrnd(0,1,rows(x),t);
load sim

rho=.5;


data.x=x;
data.xi=xi;
data.z=z;
data.sim=sim;
data.simdraws=simDraws;
data.numairlines=numAirlines;
data.rho=rho;
data.y=y;
data.w=w;

options = optimset('TolFun',.00000000001,'TolX',.00000001,'MaxIter',5000);


%BerryGMMsim2([-2;.2;.2;.7;10],data);

tic
f=gridSearch('BerryGMMsim2',[-.5,-.7;1.3,1.6;.08,.10;1.09,1.4;9,11],[5;5;5;5;5],data,0,0);
f.b
f.val
toc


[b,o,j,c]=repeatSearch('BerryGMMsim2',f.b,options,data,8,.00000000001);
b
o
% -0.6007    1.5605    0.1042    1.2989   10.0329
%  335.8096


% %Again, I need to do more work to solve for the standard errors.
% var=numVarianceCov('BerryGMMsim2',f.b,data,w,.01);
% var.se




