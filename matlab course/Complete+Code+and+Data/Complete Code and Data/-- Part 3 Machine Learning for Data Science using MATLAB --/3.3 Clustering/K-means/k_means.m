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

%%------------  Selecting Optimal Number of Clusters ------------
% -------------- Method 1: Using the Elbow Method ---------------
% ---------------------------- Code -----------------------------


WCSS = [];
for k = 1:10
    sumd = 0;
    [idx,C,sumd] = kmeans(data,k);
    WCSS(k) = sum(sumd);
end 

plot(1:10, WCSS); 

%________________________________________________________________
%________________________________________________________________

%%--------------- Clustering data -------------------------------

[idx,C] = kmeans(data,5);

%________________________________________________________________
%________________________________________________________________


%%--------------- Visualizing the Results------------------------
figure, 

gscatter(data(:,1),data(:,2),idx);
hold on
for i = 1:5
    scatter(C(i,1),C(i,2) ,96, 'black','filled');
    
end
legend({'Cluster 1', 'Cluster 2', 'Cluster 3', 'Cluster 4', 'Cluster 5'})
xlabel('Annual Income');
ylabel('Spending Scores')
hold off
