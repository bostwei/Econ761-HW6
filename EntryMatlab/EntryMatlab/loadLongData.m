

load airlines4test;
citypair=data(:,1);
yr_q=data(:,2);
car=data(:,3);
pax=data(:,4);
pot96=data(:,5);
pot97=data(:,6);
enter=data(:,7);
city2=data(:,8);
city972=data(:,9);
distance=data(:,10);
tourist=data(:,11);
basepop=data(:,12);
refpop=data(:,13);
paxtot=data(:,14);
pop=data(:,15);
enter96=data(:,16);
totenter=data(:,17);
cityN2=data(:,18);
cityN1=data(:,19);
numroute=data(:,20);
sharepax=data(:,21);
sharepaxdist=data(:,22);
totpotential=data(:,23);
herfCityPair=data(:,24);
incumbents=data(:,25);
totsinglepot=data(:,26);
dist2=data(:,27);


T = table(citypair,yr_q,car,pax,pot96,pot97,enter,city2,city972,distance,...
    tourist,basepop, refpop, paxtot, pop, enter96, totenter,cityN2,...
    cityN1, numroute, sharepax, sharepaxdist, totpotential, herfCityPair,...
    incumbents, totsinglepot, dist2);
filename = 'Berry1992.xlsx';
writetable(T,filename,'Sheet',1);
