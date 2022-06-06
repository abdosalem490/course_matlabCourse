%% --------------- Importing the dataset -------------------------
% ---------------------------- Code ---------------------------
data = readtable('D:\Data preprocessing for Machine Learning using MATLAB\Handling Missing Data\Data_4.csv');


%________________________________________________________________
%________________________________________________________________

%%--------------- Adding a Separate Category ----------------------
%% -------------- Method 5.1: Using a Special Value ---------------
% ------------------------- Numerical data ----------------------
% ----------------------------- Code ----------------------------

%constant_value = -1;  %use a value that is not found in the data and  also not very devaiant from the data
% Age = fillmissing(data.Age, 'constant', constant_value);
% data.Age = Age;





%% -------------- Method 5.2: Using a Special Value ---------------
% ------------------------- Categorical data --------------------
% ----------------------------- Code ----------------------------

% location = fillmissing(data.Location,'constant','Other'); 
% data.Location = location;




