%*******************************************
%************ Copyright by HanO ************
%************** 0978.39.41.43 **************
%************ Scale Good Sample ************
%*************** Ver: final ****************
%*******************************************
% init
clear all;
clc;
% % time measure
% time_start = clock;
% read file csv
input = csvread('good_rice_1.csv');
size_input = size(input);
% declare
min_col = size_input(1,2);
min_row = size_input(1,1);
max_col = 1;
max_row = 1;
%
threshold_rice = 10;
% process
    for(i = 1:size_input(1,1))
        for(j = 1:size_input(1,2))
           if(input(i,j) > threshold_rice)
               if (j < min_col)
                   min_col = j;
               end
               if (i < min_row)
                   min_row = i;
               end
               if (j > max_col)
                   max_col = j;
               end           
               if (i > max_row)
                   max_row = i;
               end
           end
        end
    end
% Calib
min_col = min_col - 2;
min_row = min_row - 2;
max_col = max_col + 2;
max_row = max_row + 2;
% write to file
a = 1;
b = 1;
for(i = min_row:max_row)
    for(j = min_col:max_col)
        input_scale(a,b) = input(i,j);
        b = b + 1;
    end;
    b = 1;
    a = a + 1;
end;
csvwrite('scale_good_rice_1.csv',input_scale);
% time measure
time_process = etime(clock, time_start)