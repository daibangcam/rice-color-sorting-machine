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
input_filename = string('scale_bad_rice_');
% input params
num_file = input('Number of data files: ');
threshold_rice = input('Threshold of Rice: ');
% process
for(num = 1:num_file)
    time_start = clock;
    input_file = input_filename + num + string('.csv');
    input = csvread(input_file);
    size_input = size(input); 
    for(i = 1:size_input(1,1))
        for(j = 1:size_input(1,2))
            if(input(i,j)<threshold_rice)
           input_filter(i,j) = 0;
       else
           input_filter(i,j) = input(i,j);
       end
        end
    end
    % write to file
    csvwrite(sprintf('filter_bad_rice_%d.csv',num),input_filter);
    % clear stored data
    input = 0;
    input_filter = 0;
    % time processing
    time_process = etime(clock, time_start)
end