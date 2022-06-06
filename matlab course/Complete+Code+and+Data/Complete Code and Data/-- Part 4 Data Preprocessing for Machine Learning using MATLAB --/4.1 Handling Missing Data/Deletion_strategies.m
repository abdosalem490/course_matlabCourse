%% --------------- Importing the dataset -------------------------
% ---------------------------- Code ---------------------------
data = readtable('D:\Data preprocessing for Machine Learning using MATLAB\Handling Missing Data\Data_1.csv');



%________________________________________________________________
%________________________________________________________________

%%---------------Data Preprocessing -----------------------------
% -------------- Handling Missing Values ------------------------

% -------------- Method 1: Deleting rows or column --------------
% ---------------------------- Code ---------------------------
% 
% complete_data = rmmissing(data)
% complete_data = rmmissing(data,2)
% data = complete_data; 

% -------------- Method 2: Deleting rows or columns based on
% -------------------------- Relative Percentage of missing---
% ---------------------------- Code ---------------------------

% restricted_missing = rmmissing(data,'MinNumMissing',3);
% restricted_missing = rmmissing(data,2,'MinNumMissing',2);
% restricted_missing = rmmissing(data,2,'MinNumMissing',3);
%  
% data = restricted_missing;
