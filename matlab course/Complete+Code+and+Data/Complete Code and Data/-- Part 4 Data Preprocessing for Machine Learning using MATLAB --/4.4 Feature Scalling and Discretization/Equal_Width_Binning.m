%% --------------- Importing the dataset -------------------------
% ---------------------------- Code ---------------------------
data = readtable('D:\Data preprocessing for Machine Learning using MATLAB\Feature Scalling and Discretization\Data_10.csv');




%% ----------------- Discretization -------------------------------

% -------------- Method 1.1: Equal Width Binning --------------------
% --------------- Using Mean of the Bins Edges ----------------------
% ---------------------------- Code -----------------------------

% [rows col] =  size(data);
% num_bins = round(1 + (3.322* log10(rows)));
% 
% [Bins, Edges] = discretize(data.Age,num_bins);
% new_variable = data.Age;
% 
% for i=1:num_bins
%     indexes = Bins == i;
%     new_variable(indexes) = (Edges(i) + Edges(i+1)) / 2; % mean of the edges
%   
% end 
% 
% data.Age = new_variable; 
    

% -------------- Method 1.2: Equal Width Binning ------------------
% -------------- Using Mean the of values in a Bin ----------------
% ---------------------------- Code -----------------------------

% [rows col] =  size(data);
% num_bins = round(1 + (3.322* log10(rows)));
% 
% [Bins, Edges] = discretize(data.Age,num_bins);
% new_variable = data.Age;
% 
% for i=1:num_bins
%     indexes = Bins == i;
%     new_variable(indexes) = mean(new_variable(indexes)); % mean of the edges
%    
% end 
% 
% data.Age = new_variable; 

% -------------- Method 1.3: Equal Width Binning --------------------
% -------------- Using Median of the Values in a Bin-------------------
% ---------------------------- Code -----------------------------

% [rows col] =  size(data);
% num_bins = round(1 + (3.322* log10(rows)));
% 
% [Bins, Edges] = discretize(data.Age,num_bins);
% new_variable = data.Age;
% 
% for i=1:num_bins
%     indexes = Bins == i;
%     new_variable(indexes) = median(new_variable(indexes)); 
% end 
% 
% data.Age = new_variable; 





