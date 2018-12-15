%*************************************************************************
% Econ 761 HW6 
% Shiyan Wei
% 12/14/2018
% ************************************************************************

% ************************************************************************
% This script is to try replicating Berry(1992)
% ***********************************************************************


%Load the data
clc
clear all
run loadWideData

% Note that # city_i = 184
% # Car_k = 31


const=ones(size(pop,1),1);
x=[const pop distance];
z = [city2 sharepaxdist];
y = totenter;

global d
d.x = x;
d.y = y;
d.city2 = city2; 
d.sharepaxdist = sharepaxdist;
d.enter = enter;
% for each potential entry number calculate the profit for each firm
d.n = 31;

% given the initial guess value
beta0 = [-5.32; 1.36; 1.72]; 
alpha0_1 = 4.89;
alpha0_2 = 4.73;
delta0 = 0.527;
rho0 = 0.802;

% given the parameter space each parameter 100
 theta_0 = [beta0; alpha0_1; alpha0_2; delta0; rho0];
% beta = linspace(-7,-3,100);
% SSR0 = Berry92(theta_0);

% define parameter space
grid = 9; %The grid number of searching 
theta(:,1) =linspace(-7,-2,grid)';
theta(:,2) = linspace(0,5,grid)';
theta(:,3) = linspace(0,5,grid)';
theta(:,4) = linspace(2,7,grid)';
theta(:,5) = linspace(2,7,grid)';
theta(:,6) = linspace(0,1,grid)';
theta(:,7) = linspace(0,1,grid)';

[Th1,Th2,Th3,Th4,Th5,Th6,Th7]= ndgrid(theta(:,1),theta(:,2),theta(:,3),theta(:,4),theta(:,5),theta(:,6),theta(:,7));
Th = [Th1(:), Th2(:),Th3(:),Th4(:),Th5(:),Th6(:),Th7(:)];

SSR = zeros(length(Th),1);
parfor i = 1: length(Th)
    SSR(i) = Berry92(Th(i,:));
    fprintf('This is %d line:\n',i);
end

