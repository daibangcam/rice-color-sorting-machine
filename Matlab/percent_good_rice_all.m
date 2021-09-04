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
% input_filename = string('filter_good_rice_');
input_filename = string('scale_good_rice_');
% input params
num_file = input('Number of data files: ');
threshold_rice = input('Threshold of Rice: ');
max_threshold_rice = 40;
figure
% process
for(num = 1:num_file)
    time_start = clock;
    input_file = input_filename + num + string('.csv');
    input = csvread(input_file);
    size_input = size(input);
    %
    good_rice = 0;
    total_rice = 0;
    % process
    for(threshold_good_rice=threshold_rice:max_threshold_rice)
        for(i=1:size_input(1,1))
            for(j=1:size_input(1,2))
               if(input(i,j)>=threshold_rice)
                   total_rice = total_rice + 1;
               end;
%                total_rice = total_rice + input(i,j);
               if(input(i,j)>=threshold_good_rice)
                   good_rice = good_rice + 1;
               end;
            end;
        end;
        percent(1,threshold_good_rice) = threshold_good_rice;
        percent(2,threshold_good_rice) = good_rice / total_rice * 100;
        good_rice = 0;
        total_rice = 0;
    end;
    % write to file
    csvwrite(sprintf('percent_good_rice_%d.csv',num),percent);
    % Plot data    
    plot(percent(2,:),'r');
    xlabel('value');
    ylabel('percent');
    title('Percent Good Rice');
    grid on;
    axis([threshold_rice inf 0 inf])
    hold on
    % clear stored data
    input = 0;
    percent = 0;
    % time processing
    time_process = etime(clock, time_start)
end