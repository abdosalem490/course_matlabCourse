%% --------------- Importing the dataset -------------------------
% ---------------------------- Code ---------------------------
data = readtable('D:\Data preprocessing for Machine Learning using MATLAB\Outlier detection\Data_7.csv');




%% -------------- Handling Outliers-------------------------------

% -------------- Method 4.1: Detection (Histogram Plot) ------------
%--------------- Dealing strategy (Deleting Rows) -----------------
% ---------------------------- Code -----------------------------

% [rows col] =  size(data);
% num_bins = round(1 + (3.322* log10(rows)));
% histogram(data.Age,num_bins);
% 
% outlier = data.Age >=70;
% data = data(~outlier,:); 


% -------------- Method 4.2: Detection (Histogram Plot) ------------
% ---------------------- Class specific ----------------------------
%--------------- Dealing strategy (Deleting Rows) -----------------
% ---------------------------- Code -----------------------------
% 
% [rows col] =  size(data);
% num_bins = round(1 + (3.322* log10(rows)));
% 
% class_1 = categorical(data.Opinion) == 'not liked';
% histogram(data.Age(class_1),num_bins);
% 
% outlier = data.Age(class_1) >= 70;
% data = class_based_outlier_function(data,outlier,class_1); 


% -------------- Method 4.3: Detection (Histogram Plot) ----------
%--------------- Dealing strategy (Filling Rows) -----------------
% ---------------------------- Code -----------------------------

% [rows col] =  size(data);
% num_bins = round(1 + (3.322* log10(rows)));
% histogram(data.Age,num_bins);
% 
% outlier = data.Age >=70;
% data.Age(outlier) = max(data.Age(~outlier)); 
% data.Age(outlier) = mean(data.Age(~outlier)); 
% data.Age(outlier) = median(data.Age(~outlier)); 





% -------------- Method 4.4: Detection (Histogram Plot) ------------
% ---------------------- Class specific ----------------------------
%--------------- Dealing strategy (Filling Rows) -----------------
% ---------------------------- Code -----------------------------

% [rows col] =  size(data);
% num_bins = round(1 + (3.322* log10(rows)));
% 
% class_1 = categorical(data.Opinion) == 'not liked';
% histogram(data.Age(class_1),num_bins);
% 
% outlier = data.Age(class_1) >= 70;
% Ages = data.Age(class_1); 
% maximum = max(Ages(~outlier));
% 
% Ages(outlier) = maximum;
% data.Age(class_1) = Ages;


%________________________________________________________________
%________________________________________________________________

