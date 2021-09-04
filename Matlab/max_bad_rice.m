%*******************************************
%************ Copyright by HanO ************
%************** 0978.39.41.43 **************
%************** Max Bad Sample *************
%*************** Ver: final ****************
%*******************************************
% init
clear all;
clc;
% declare
input = csvread('filter_bad_rice_1.csv');
size_input = size(input);
% 
tmp = 0; 
% process
for(i=1:size_input(1,1))
	for(j=1:size_input(1,2))
    	if(input(i,j)>tmp)
        	tmp = input(i,j);
    	end;
	end;
    max(1,i)=tmp;
    tmp = 0;
end;
% write to file
csvwrite('max_bad_rice_1.csv',max);
% Plot data
plot(max);
xlabel('pixel');
ylabel('value');
title('Rice value');
grid on;
axis([0 inf 0 inf])
