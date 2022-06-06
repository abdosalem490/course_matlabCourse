%% --------------- Importing the dataset -------------------------
% ---------------------------- Code ---------------------------
data = readtable('D:\Machine Learning for Data Science using MATLAB\Data Preprocessing\Data_6.csv')



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

% -------------- Method 1.1: Deleting rows or columns based on
% -------------------------- Relative Percentage of missing---
% ---------------------------- Code ---------------------------

% restricted_missing = rmmissing(data,'MinNumMissing',3);
% restricted_missing = rmmissing(data,2,'MinNumMissing',2);
% restricted_missing = rmmissing(data,2,'MinNumMissing',3);
%  
% data = restricted_missing;
 
% -------------- Method 2: Using Mean --------------------------
% ---------------------------- Code ---------------------------
 
% M_Age = mean(data.Age, 'omitnan');
% U_Age = fillmissing(data.Age, 'constant',M_Age);
% data.Age = U_Age;



% ------------- Method 3: Dealing with non-numeric data --------
% ---------------------------- Code ---------------------------

% data.Opinion = categorical(data.Opinion);
% Freq_opinion = mode(data.Opinion);
% 
% Opinion = fillmissing(data.Opinion,'constant',cellstr(Freq_opinion));
% data.Opinion = Opinion; 

%________________________________________________________________
%________________________________________________________________









%% -------------- Handling Outliers-------------------------------

% -------------- Method 1: Deleting Rows ------------------------
% ---------------------------- Code -----------------------------

% outlier = isoutlier(data.Age);
% data = data(~outlier,:); 



% -------------- Method 2: Filling Outliers ---------------------
% ---------------------------- Code -----------------------------
% 
% Age = filloutliers(data.Age,'clip','mean')
% data.Age = Age;


%________________________________________________________________
%________________________________________________________________



%% -------------- Categorical data------------------
%% -------------- Method 1: Categorical data (no order)----------
% ---------------------------- Code -----------------------------

% data = categorical_data_to_dummy_variables(data,data.Location);
% data.Location = [];

% -------------- Method 2: Categorical data (with order)----------
% ---------------------------- Code -----------------------------

% new_variable = categorical_data_to_numbers(data.YearlyIncome,{'Average', 'High', 'Very High', 'Low'}, [2 3 5 1]);
% data.YearlyIncome = new_variable




%________________________________________________________________
%________________________________________________________________



%% -------------- Feature Scalling -------------------------------

% -------------- Method 1: Standardization ----------------------
% ---------------------------- Code -----------------------------

% stand_age = (data.Age - mean(data.Age))/std(data.Age)
% data.Age = stand_age; 


% -------------- Method 2: Normalization ------------------------
% ---------------------------- Code -----------------------------
% normalize_age = (data.Age - min(data.Age)) / (max(data.Age) - min(data.Age))
% data.Age = normalize_age;
%  
%________________________________________________________________
%________________________________________________________________




%writetable(data,'D:\preprocessed_data.csv'); 
























































