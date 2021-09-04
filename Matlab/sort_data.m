%*******************************************
%************ Copyright by HanO ************
%************** 0978.39.41.43 **************
%**************** Sort Data ****************
%*************** Ver: final ****************
%*******************************************
% init
clear all;
clc;
% declare
num_pixel = 2049;       % s? pixel 1 l?n ghi (camera linescan 2048 pixel + 1 pixel r?ng do l?p trình)
num_col = 1;            % l?y c?t 1 - blue byte (1 pixel g?m 3 byte B-G-R)
% read file csv
input = csvread('data.csv');
size_input = size(input);
% process
row = ceil(size_input(1,1)/num_pixel);
for(i=1:row)
    for(j=1:num_pixel)
        temp(i,j) = input((i-1)*num_pixel+j,num_col);
    end
end
% write to file
csvwrite('sort_data.csv',temp);