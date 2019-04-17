clear; clc; close all

filter2_data = xlsread('Spec_data_Day2.xlsx',2);
filter7_8_data = xlsread('Spec_data_Day2.xlsx',3);

concentration1 = 10^-6.*(squeeze(filter2_data(:,1)))';
concentration2 = 10^-6.*(squeeze(filter2_data(:,1)))';

%%
%Store the values for each trial
trial1 = squeeze(filter2_data(:,2))';
trial2 = squeeze(filter2_data(:,3))';
trial3 = squeeze(filter2_data(:,4))';

%Subtract blank voltage from all data points
% trial1_norm = trial1 - trial1(1);
% trial2_norm = trial2 - trial2(1);
% trial3_norm = trial3 - trial3(1);

trial1_norm = trial1;
trial2_norm = trial2;
trial3_norm = trial3;

for jj = 1:length(concentration1)
    
    average(jj) = mean([trial1_norm(jj), trial2_norm(jj), trial3_norm(jj)]);
    deviation(jj) = std([trial1_norm(jj), trial2_norm(jj), trial3_norm(jj)]);
    
end

indices = find(average < 0);
average(indices) = [];
concentration1(indices) = [];
concentration1(1) = eps;

% model = polyfit(log10(concentration1),log10(average),1);

LM1 = fitlm(concentration1,average, 'Intercept', true);

std_error = deviation/sqrt(3);
errorbar(concentration1,average,std_error,'o');
ylabel('Voltage (V)');
xlabel('Concentration (uM)');
title('Voltage vs Concentration for filter 2');

% %%
% %Store the values for each trial
% trial1 = squeeze(filter7_8_data(:,2));
% trial2 = squeeze(filter7_8_data(:,3));
% trial3 = squeeze(filter7_8_data(:,4));
% 
% %Subtract blank voltage from all data points
% trial1_norm = trial1 - trial1(1);
% trial2_norm = trial2 - trial2(1);
% trial3_norm = trial3 - trial3(1);
% 
% for jj = 2:length(concentration2)
%     
%     average2(jj) = mean([trial1_norm(jj), trial2_norm(jj), trial3_norm(jj)]);
%     deviation2(jj) = std([trial1_norm(jj), trial2_norm(jj), trial3_norm(jj)]);
%     
% end
% 
% indices2 = find(average2 < 0);
% average2(indices2) = [];
% concentration2(indices2) = [];
% 
% model2 = polyfit(log(concentration2),log(average2),1);
% 
% % LM2 = fitlm(concentration,average2);
% % figure()
% % std_error = deviation2/sqrt(3);
% % errorbar(concentration,average2,std_error,'o');
% % ylabel('Voltage (V)');
% % xlabel('Concentration (uM)');
% % title('Voltage vs Concentration for filter 7&8');
