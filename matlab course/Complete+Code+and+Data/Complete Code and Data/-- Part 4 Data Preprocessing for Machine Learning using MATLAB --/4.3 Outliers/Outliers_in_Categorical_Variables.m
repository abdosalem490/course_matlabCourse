clear all 

%% --------------- Importing the dataset -------------------------
% ---------------------------- Code -----------------------------
data = readtable('D:\Data preprocessing for Machine Learning using MATLAB\Outlier detection\titanic_train.csv');


%________________________________________________________________
%________________________________________________________________

%%------------ Rare Values in categorical Variables -------------

% -------------- Method 1: Deletion Strategy -------------------
% ---------------------------- Code ---------------------------

% Frequencies = tabulate(data.embarked); 
% [rows cols] = size(Frequencies); 
% new_variable = data.embarked; 
% 
% for i=1:rows
%     if Frequencies{i,3} <= 10    
%         indexes = new_variable == string(Frequencies{i,1}) ;
%         new_variable(indexes) = {''};
% 
%     end 
% end 
% 
% data.embarked = new_variable;
% data = rmmissing(data,'DataVariables',{'embarked'});
% 


% -------------- Method 2: Using a Special Label --------------
% ---------------------------- Code ---------------------------
% 
% Frequencies = tabulate(data.embarked); 
% [rows cols] = size(Frequencies); 
% new_variable = data.embarked; 
% 
% for i=1:rows
%     if Frequencies{i,3} <= 10    
%         indexes = new_variable == string(Frequencies{i,1}) ;
%         new_variable(indexes) = {'OTHER'};
% 
%     end 
% end 
% 
% data.embarked = new_variable;

