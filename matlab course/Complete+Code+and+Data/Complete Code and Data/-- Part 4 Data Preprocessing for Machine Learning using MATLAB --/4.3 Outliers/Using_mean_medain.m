%% --------------- Importing the dataset -------------------------
% ---------------------------- Code ---------------------------
data = readtable('D:\Machine Learning for Data Science using MATLAB\Data Preprocessing\Outliers detection\Data_5.csv')




%% -------------- Handling Outliers-------------------------------

% -------------- Method 1: Detection (Mean and Medain) ------------
%--------------- Dealing strategy (Deleting Rows) -----------------
% ---------------------------- Code -----------------------------

% outlier = isoutlier(data.Age);
% data = data(~outlier,:); 



% -------------- Method 2: Detection (Mean and Medain) ----------
%--------------- Dealing strategy (Filling Rows) ----------------
% ---------------------------- Code -----------------------------
 
% Age = filloutliers(data.Age,'clip','mean')
% data.Age = Age;


%________________________________________________________________
%________________________________________________________________











