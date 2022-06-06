clear all 

%% --------------- Importing the dataset -------------------------
% ---------------------------- Code -----------------------------
data = readtable('D:\Data preprocessing for Machine Learning using MATLAB\Feature Scalling and Discretization\Data_10.csv');



%% ----------------- Discretization -------------------------------
% -------------- Method 2.1: Equal Frequency Binning --------------
% -------------- Using Mean the of values in a Bin ----------------
% ---------------------------- Code -------------------------------
 
% new_variable = Function_Discretize_Equal_Frequency(data.Age,'mean')
% data.Age = new_variable; 

% -------------- Method 2: Equal Frequency Binning ----------------
% -------------- Using Mean the of values in a Bin ----------------
% ---------------------------- Code -------------------------------

% new_variable = Function_Discretize_Equal_Frequency(data.Age,'median')
% data.Age = new_variable; 

