%*******************************************
%************ Copyright by HanO ************
%************** 0978.39.41.43 **************
%************** Max Good Sample ************
%*************** Ver: final ****************
%*******************************************
% init
clear all;
clc;
% declare
input_filename = string('filter_good_rice_');
% input params
num_file = input('Number of data files: ');
% process
for(num = 1:num_file)
    time_start = clock;
    input_file = input_filename + num + string('.csv');
    input = csvread(input_file);
    size_input = size(input);
    tmp = 0;
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
    csvwrite(sprintf('max_good_rice_%d.csv',num),max);
    % plot data
    plot(max);
    xlabel('pixel');
    ylabel('value');
    title('Max Good Rice');
    grid on;
    axis([0 inf 9 inf])
    hold on
    % clear stored data
    input = 0;
    max = 0;
    % time processing
    time_process = etime(clock, time_start)
end