%% --------------- Importing the dataset -------------------------
% ---------------------------- Code ---------------------------
data = readtable('D:\Data preprocessing for Machine Learning using MATLAB\Feature Scalling\Data_10.csv')
 
 
 
 
%% -------------- Feature Scalling -------------------------------

% -------------- Method 1: Standardization ----------------------
% ---------------------------- Code -----------------------------

% stand_age = (data.Age - mean(data.Age)) / std(data.Age)
% data.Age = stand_age; 
% 
% stand_Salary = (data.AnnualSalary - mean(data.AnnualSalary)) / std(data.AnnualSalary);
% data.AnnualSalary = stand_Salary;


% -------------- Method 2: Normalization ------------------------
% ---------------------------- Code -----------------------------


% normalize_age = (data.Age - min(data.Age)) / (max(data.Age) - min(data.Age)); 
% data.Age = normalize_age; 


