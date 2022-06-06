%% --------------- Importing the dataset -------------------------
% ---------------------------- Code ---------------------------
data = readtable('D:\Data preprocessing for Machine Learning using MATLAB\Handling Missing Data\Data_11.csv');


%________________________________________________________________
%________________________________________________________________

%%---------------Data Preprocessing -----------------------------
%% -------------- Method 6.1: Using Random Value ----------------
% ------------------------- Numerical data ----------------------
% ----------------------------- Code ----------------------------


% Age_max = max(data.Age);
% Age_min = min(data.Age);
% I = ismissing(data.Age); 
% 
% for i=1: length(I)
%     if I(i) == 1
%         data.Age(i) =  Age_min+randi(Age_max-Age_min);
%     end 
% end 

%% -------------- Method 6.2: Using Random Value ---------------
% ------------------------- Categorical data ----------------------
% ----------------------------- Code ----------------------------
    

% new_variable = function_random_value_for_categorical(data.Location); 
% data.Location = new_variable; 


