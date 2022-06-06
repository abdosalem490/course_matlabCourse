clear all
%% --------------- Importing the dataset -------------------------
% ---------------------------- Code ---------------------------
data = readtable('D:\Data preprocessing for Machine Learning using MATLAB\Outlier detection\pima_indain.csv'); 




%% -------------- Handling Outliers-------------------------------

% --------- Method 5.1: Detection (Local Outlier Factor) ---------
%--------------- Dealing strategy (Deleting Rows) -----------------
% ---------------------------- Code -----------------------------

% x = [data.Var1 data.Var2 data.Var3 data.Var4 data.Var5 data.Var6 data.Var7 data.Var8];
% lof_value = lof(x,5); 
% 
% outlier = isoutlier(lof_value);      % high spread => mean, low spread => medain
% data = data(~outlier,:);


% --------- Method 5.2: Detection (Local Outlier Factor) ---------
%--------------- Dealing strategy (Filling Rows) -----------------
% ---------------------------- Code -----------------------------



x = [data.Var1 data.Var2 data.Var3 data.Var4 data.Var5 data.Var6 data.Var7 data.Var8];
lof_value = lof(x,5); 

outlier = isoutlier(lof_value); 
new_values = mean(x); 
data.Var1(outlier) = new_values(1);
data.Var2(outlier) = new_values(2);
data.Var3(outlier) = new_values(3);
data.Var4(outlier) = new_values(4);
data.Var5(outlier) = new_values(5);
data.Var6(outlier) = new_values(6);
data.Var7(outlier) = new_values(7);
data.Var8(outlier) = new_values(8);



%________________________________________________________________
%________________________________________________________________

