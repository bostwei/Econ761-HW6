function [SSR] = Berry92(theta)
%This function calculate the SSR given parameter theta 
%   theta is the parameter
% data is the data used to estimate 
global d

% z = [city2 sharepaxdist];
% y = totenter;
% data=[y,x,z,enter];

% unbundal the data
x = d.x;
y = d.y;
city2 = d.city2;
sharepaxdist = d.sharepaxdist;
enter = d.enter;
n = d.n;
% load Berry1992Wide

%  const=ones(size(pop,1),1);
%  x=[const pop distance];
% unbundel the parameter
% theta_0 = [beta0; alpha0_1; alpha0_2; delta0; rho0];
beta_1 = theta(1);
beta_2 = theta(2);
beta_3 = theta(3);
alpha_1 = theta(4);
alpha_2 = theta(5);
delta = theta(6);
rho = theta(7);

beta = [beta_1;beta_2;beta_3];
 
[i,k] = size(enter);

T = 100; % number of simulation
n_hat = zeros(i,T);
for t = 1:T

    %--- First draw 31 error for each firm k in each market i
u_ik = normrnd(0,1,[i,k]);

u_i0 = normrnd(0,1,[i,1]);

% calculate the profit for each firm under each number of firm's condition
pi_hat = zeros(i,k,n); % profit for each form k in each market i, given competitive firm number n 

for N = 1:n
  pi_hat(:,:,N) = x * beta +  alpha_1 * city2 + alpha_2 * sharepaxdist + delta * log(N) + rho * u_i0 + sqrt(1- rho^2)* u_ik;  
end

pi_hat_1 = double(pi_hat>=0); % identify the firm with postive profit

num = sum(pi_hat_1,2);% number of postive profit firm for each market given competitive number n 

num_1 = zeros(i,n); % reshape the num to be a 2D matrix
for I = 1:n
 num_1(:,I) = num(:,1,I);
end

% n_hat is defined as the largest interger n such tat at lease n firm are
% profitable in n-firm equilibrium ( sequential searching) for each market
% i
for I = 1:i
    for N = 1:n
        if num_1(I,N)>= N
        n_hat(I,t) = num_1(I,N); % 
        end
    end
end


% fprintf('This is the %d times simulation.\n ',t);
end

% calulate the avarage Number of entering 
N_hat = mean(n_hat,2);

% calculate the estimation error
v_0 = y - N_hat;

% calculate the sum of least square
SSR = v_0'*v_0;



end

