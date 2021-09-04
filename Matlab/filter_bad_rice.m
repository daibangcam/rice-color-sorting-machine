%*******************************************
%************ Copyright by HanO ************
%************** 0978.39.41.43 **************
%************ Filter Bad Sample ************
%*************** Ver: final ****************
%*******************************************
% init
clear all;
clc;
% declare
threshold = 6;
input = csvread('scale_bad_rice_1.csv');
size_input = size(input);
% process
for(i=1:size_input(1,1))
    for(j=1:size_input(1,2))
       if(input(i,j)<threshold)
           input_filter(i,j) = 0;
       else
           input_filter(i,j) = input(i,j);
       end
    end;
end;
% write to file
csvwrite('filter_bad_rice_1.csv',input_filter);