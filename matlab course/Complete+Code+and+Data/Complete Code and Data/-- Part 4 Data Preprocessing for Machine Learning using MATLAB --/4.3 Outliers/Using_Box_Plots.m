%% --------------- Importing the dataset -------------------------
% ---------------------------- Code ---------------------------
data = readtable('D:\Data preprocessing for Machine Learning using MATLAB\Outlier detection\Data_7.csv')




%% -------------- Handling Outliers-------------------------------

% -------------- Method 3.1: Detection (Box Plot) -------------------
%--------------- Dealing strategy (Deleting Rows) -----------------
% ---------------------------- Code -----------------------------

% boxplot(data.Age);
% outlier = isoutlier(data.Age,'quartiles');
% data = data(~outlier,:); 


% -------------- Method 3.2: Detection (Box Plot) ------------------
% ---------------------- Class specific ----------------------------
%--------------- Dealing strategy (Deleting Rows) -----------------
% ---------------------------- Code -----------------------------

% boxplot(data.Age,data.Opinion);
% 
% class_1 = categorical(data.Opinion) == 'not liked';
% outlier = isoutlier(data.Age(class_1),'quartiles');
% 
% data = class_based_outlier_function(data,outlier,class_1); 


% -------------- Method 3.3: Detection (Box Plot) -------------------
%--------------- Dealing strategy (Filling Rows) -----------------
% ---------------------------- Code -----------------------------

% boxpot(data.Age);
% Age = filloutliers(data.Age,'clip','quartiles');
% data.Age = Age;

% -------------- Method 3.4: Detection (Box Plot) -------------------
% ---------------------- Class specific ----------------------------
%--------------- Dealing strategy (Filling Rows) -----------------
% ---------------------------- Code -----------------------------

% boxplot(data.Age,data.Opinion);
% class_1 = categorical(data.Opinion) == 'not liked';
% Age = filloutliers(data.Age(class_1),'clip','quartiles');
% data.Age(class_1) = Age;

%________________________________________________________________
%________________________________________________________________

