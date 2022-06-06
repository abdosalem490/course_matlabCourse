clear all 

%% --------------- Importing the dataset -------------------------
% ---------------------------- Code ---------------------------
data = readtable('D:\Machine Learning for Data Science using MATLAB\Clustering\K-means\Mall_Customers.csv');


%________________________________________________________________
%________________________________________________________________

%%---------------Data Preprocessing -----------------------------


%% -------------- Feature Scalling -------------------------------

% -------------- Method 1: Standardization ----------------------
% ---------------------------- Code -----------------------------
stand_AnnualIncome = (data.AnnualIncome - mean(data.AnnualIncome))/std(data.AnnualIncome);
data.AnnualIncome = stand_AnnualIncome; 

stand_SpendingScore = (data.SpendingScore - mean(data.SpendingScore))/std(data.SpendingScore);
data.SpendingScore = stand_SpendingScore; 

%%--------------- Selecting Data of interest ---------------------
% ---------------------------- Code ------------------------------

data = data(:,4:5);
data = table2array(data);

%________________________________________________________________
%________________________________________________________________

%%------------  Computing Hierarchical Clustering based ---------
% --------------- on some method (max, min,avg etc) -------------
% ---------------------------- Code -----------------------------

Z = linkage(data,'ward');

%________________________________________________________________
%________________________________________________________________

%%--------------------- Creating Dendogram ----------------------
% ---------------------------- Code -----------------------------

dendrogram(Z);

%________________________________________________________________
%________________________________________________________________
%%---------- Determining Thresholds for Optimal Number ---------- 
%------------- of Clusters using Links Inconsistencies ----------
% ---------------------------- Code -----------------------------

I = inconsistent(Z,7);
[a,b] = max(I(:,4)); 

%________________________________________________________________
%________________________________________________________________
%%------------------ Determining the Clusters -------------------
% ---------------------------- Code -----------------------------

C = cluster(Z,'cutoff',Z(b,3)-0.01,'Criterion','distance');



%________________________________________________________________
%________________________________________________________________
%%--------------- Visualizing the Results------------------------

figure,
gscatter(data(:,1),data(:,2),C);
legend({'Cluster 1', 'Cluster 2', 'Cluster 3', 'Cluster 4', 'Cluster 5'})
xlabel('Annual Income');
ylabel('Spending Scores')
hold off
