clear all

%% --------------- Importing the dataset -------------------------
% ---------------------------- Code ---------------------------
data = readtable('D:\Machine Learning for Data Science using MATLAB\Classification\K-Nearest Neighbor\Social_Network_Ads.csv');



%________________________________________________________________
%________________________________________________________________

%%---------------Data Preprocessing -----------------------------


%% -------------- Feature Scalling -------------------------------

% -------------- Method 1: Standardization ----------------------
% ---------------------------- Code -----------------------------

stand_age = (data.Age - mean(data.Age))/std(data.Age);
data.Age = stand_age; 

stand_estimted_salary = (data.EstimatedSalary - mean(data.EstimatedSalary))/std(data.EstimatedSalary);
data.EstimatedSalary = stand_estimted_salary; 

 
%________________________________________________________________
%________________________________________________________________

%%%%---------------Classifying Data  -----------------------------
%% -------------- Building Classifier ----------------------------
% ---------------------------- Code ---------------------------


classification_model = fitcknn(data,'Purchased~Age+EstimatedSalary');
%please define your classifier here

%% -------------- Test and Train sets ----------------------------
% ---------------------------- Code ---------------------------

cv = cvpartition(classification_model.NumObservations, 'KFold', 5);
%cv = cvpartition(classification_model.NumObservations, 'HoldOut', 0.2);
%cv = cvpartition(classification_model.NumObservations, 'Leaveout');


cross_validated_model = crossval(classification_model,'cvpartition',cv); 




%% -------------- Making Predictions for Test sets ---------------
% ---------------------------- Code ---------------------------

Predictions_K_1 = predict(cross_validated_model.Trained{1},data(test(cv,1),1:end-1));
Predictions_K_2 = predict(cross_validated_model.Trained{2},data(test(cv,2),1:end-1));
Predictions_K_3 = predict(cross_validated_model.Trained{3},data(test(cv,3),1:end-1));
Predictions_K_4 = predict(cross_validated_model.Trained{4},data(test(cv,4),1:end-1));
Predictions_K_5 = predict(cross_validated_model.Trained{5},data(test(cv,5),1:end-1));

% Alternate way
Predictions = kfoldPredict(cross_validated_model); 



%% -------------- Analyzing the predictions ---------------------
% ---------------------------- Code ---------------------------

Results_K_1 = confusionmat(cross_validated_model.Y(test(cv,1)),Predictions_K_1);
Results_K_2 = confusionmat(cross_validated_model.Y(test(cv,2)),Predictions_K_2);
Results_K_3 = confusionmat(cross_validated_model.Y(test(cv,3)),Predictions_K_3);
Results_K_4 = confusionmat(cross_validated_model.Y(test(cv,4)),Predictions_K_4);
Results_K_5 = confusionmat(cross_validated_model.Y(test(cv,5)),Predictions_K_5);

Results_K = Results_K_1 + Results_K_2 + Results_K_3 + Results_K_4 + Results_K_5 

% Alternate way 
Results = confusionmat(table2cell(data(:,end)), Predictions);
Evaluation_results = confusionmatStats(table2cell(data(:,end)),Predictions)


