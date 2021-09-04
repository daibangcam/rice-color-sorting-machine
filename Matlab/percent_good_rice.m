%*******************************************
%************ Copyright by HanO ************
%************** 0978.39.41.43 **************
%************ Percent Good Sample **********
%*************** Ver: final ****************
%*******************************************
% init
clear all;
clc;
% declare
input = csvread('filter_good_rice_1.csv');
size_input = size(input);
% threshold_rice = 12;
% threshold_good_rice = 90;
good_rice = 0;
total_rice = 0;
% process
for(threshold_good_rice=1:255)
    for(i=1:size_input(1,1))
        for(j=1:size_input(1,2))
%            if(input(i,j)>threshold_rice)
%                total_rice = total_rice + input(i,j);
%            end;
           total_rice = total_rice + input(i,j);
           if(input(i,j)>=threshold_good_rice)
               good_rice = good_rice + input(i,j);
           end;
        end;
    end;
    percent(1,threshold_good_rice) = threshold_good_rice;
    percent(2,threshold_good_rice) = good_rice / total_rice * 100;
    good_rice = 0;
    total_rice = 0;
end;
% write to file
csvwrite('percent_good_rice_1.csv',percent);
% Plot data
plot(percent(2,:));
xlabel('value');
ylabel('percent');
title('Rice value');
grid on;
axis([0 inf 0 inf])