%% --------------- Importing the dataset -------------------------
% ---------------------------- Code ---------------------------
%data = readtable('D:\Data preprocessing for Machine Learning using MATLAB\Dealing with Categorical Data\Data_6.csv')
data = readtable('D:\Data preprocessing for Machine Learning using MATLAB\Dealing with Categorical Data\titanic_train.csv');


%________________________________________________________________
%________________________________________________________________

%%--------------- Data Preprocessing -----------------------------
% --------------- Categorical data------------------
%% -------------- Method 1: Categorical data (no order)----------
% ------------------- Also called one hot encoding --------------
% ---------------------------- Code -----------------------------

% data = function_categorical_data_to_dummy_variables(data,data.Location);
% data.Location = [];

% -------------- Method 2: Categorical data (with order)----------
% ---------------------------- Code -----------------------------

% new_variable = function_categorical_data_to_numbers(data.YearlyIncome,{'Average', 'High', 'Very High', 'Low'}, [2 3 5 1]);
% data.YearlyIncome = new_variable


%% -------------- Method 3: Categorical data (no order)----------
% ---------------------- Frequency encoding ---------------------
% ---------------------------- Code -----------------------------

%Note: make sure we do not have any missing values
% data_6 and titanic

% Freq_embarked = mode(categorical(data.embarked));
% 
% embarked = fillmissing(data.embarked,'constant',cellstr(Freq_embarked));
% data.embarked = embarked; 
% 
% new_variable = function_categorical_to_frequency(data.embarked);
% data.embarked = new_variable; 


%% -------------- Method 4: Categorical data (no order)----------
% --------------- Ordering labels according to target -----------
% ---------------------------- Code -----------------------------

% Note: make sure we do not have any missing values

% Freq_embarked = mode(categorical(data.embarked));
% 
% embarked = fillmissing(data.embarked,'constant',cellstr(Freq_embarked));
% data.embarked = embarked; 
%  
% new_variable = function_categorical_to_target(data.embarked,data.survived,1,1);
% data.embarked = new_variable;

%new_variable = categorical_to_target(data.MaritalStatus,data.Cheat,'Yes',0);



%________________________________________________________________
%________________________________________________________________



























