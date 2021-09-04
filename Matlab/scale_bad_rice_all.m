%*******************************************
%************ Copyright by HanO ************
%************** 0978.39.41.43 **************
%************* Scale Bad Sample ************
%*************** Ver: final ****************
%*******************************************
% init
clear all;
clc;
% declare
input_filename = string('data_rice');
% input params
num_file = input('Number of data files: ');
threshold_rice = input('Threshold of Rice: ');
% process
for(num = 1:num_file)
    time_start = clock;
    input_file = input_filename + num + string('.csv');
    input = csvread(input_file);
    size_input = size(input); 
    min_col = size_input(1,2);
    min_row = size_input(1,1);
    max_col = 1;
    max_row = 1;
    for(i = 1:size_input(1,1))
        for(j = 1:1860)
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
    % write to file
    csvwrite(sprintf('scale_bad_rice_%d.csv',num),input_scale);
    % clear stored data
    input = 0;
    input_scale = 0;
    % time processing
    time_process = etime(clock, time_start)
end