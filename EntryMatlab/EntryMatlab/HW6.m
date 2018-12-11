


%Load the data
clear all
run loadLongData
iota = ones(length(enter),1);
X=[iota pop city2 distance];

simDraws=20;
u=normrnd(0,1,rows(X),simDraws);
y=enter;
x=X;
z=X;
sim=u;
