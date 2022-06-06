clear all

%% --------------- Importing the dataset -------------------------
% ---------------------------- Code ---------------------------
data = readtable('D:\Machine Learning for Data Science using MATLAB\Dimensionality Reduction\PCA\Wine.csv');



%________________________________________________________________
%________________________________________________________________

%%---------------Data Preprocessing -----------------------------


%% -------------- Feature Scalling -------------------------------

% -------------- Method 1: Standardization ----------------------
% ---------------------------- Code -----------------------------

stand_var1 = (data.Var1 - mean(data.Var1))/std(data.Var1);
data.Var1 = stand_var1; 

stand_var2 = (data.Var2 - mean(data.Var2))/std(data.Var2);
data.Var2 = stand_var2; 

stand_var3 = (data.Var3 - mean(data.Var3))/std(data.Var3);
data.Var3 = stand_var3; 


stand_var4 = (data.Var4 - mean(data.Var4))/std(data.Var4);
data.Var4 = stand_var4; 


stand_var5 = (data.Var5 - mean(data.Var5))/std(data.Var5);
data.Var5 = stand_var5; 

stand_var6 = (data.Var6 - mean(data.Var6))/std(data.Var6);
data.Var6 = stand_var6; 

stand_var7 = (data.Var7 - mean(data.Var7))/std(data.Var7);
data.Var7 = stand_var7; 

stand_var8 = (data.Var8 - mean(data.Var8))/std(data.Var8);
data.Var8 = stand_var8; 

stand_var9 = (data.Var9 - mean(data.Var9))/std(data.Var9);
data.Var9 = stand_var9; 

stand_var10 = (data.Var10 - mean(data.Var10))/std(data.Var10);
data.Var10 = stand_var10; 

stand_var11 = (data.Var11 - mean(data.Var11))/std(data.Var11);
data.Var11 = stand_var11; 

stand_var12 = (data.Var12 - mean(data.Var12))/std(data.Var12);
data.Var12 = stand_var12; 

stand_var13 = (data.Var13 - mean(data.Var13))/std(data.Var13);
data.Var13 = stand_var13; 

%________________________________________________________________
%________________________________________________________________

%%---------------- Dimensionality Reduction ----------------------
%% --------------------------- PCA -------------------------------
% ---------------------------- Code ---------------------------
class_labels = data.Var14;
data = table2array(data(:,1:end-1));

[coeff,score,latent,tsquared,explained,mu] = pca(data);

Var1 = score(:,1);
Var2 = score(:,2);
data = table(Var1, Var2, class_labels)

%%---------------Classifying Data  -----------------------------
%% -------------- Building Classifier ----------------------------
% ---------------------------- Code ---------------------------


classification_model = fitcdiscr(data,'class_labels');
%please define your classifier here

%% -------------- Test and Train sets ----------------------------
% ---------------------------- Code ---------------------------

 cv = cvpartition(classification_model.NumObservations, 'HoldOut', 0.2);
 cross_validated_model = crossval(classification_model,'cvpartition',cv); 




%% -------------- Making Predictions for Test sets ---------------
% ---------------------------- Code ---------------------------

Predictions = predict(cross_validated_model.Trained{1},data(test(cv),1:end-1));



%% -------------- Analyzing the predictions ---------------------
% ---------------------------- Code ---------------------------

 Results = confusionmat(cross_validated_model.Y(test(cv)),Predictions);




%% -------------- Visualizing training set results --------------
%  ---------------------------- Code ---------------------------
 
labels = unique(data.class_labels);
classifier_name = 'K-Nearest Neigbor (Training Results)';
 % please mention your classifier name here

Var1_range = min(data.Var1(training(cv)))-1:0.01:max(data.Var1(training(cv)))+1;
Var2_range = min(data.Var2(training(cv)))-1:0.01:max(data.Var2(training(cv)))+1;

[xx1, xx2] = meshgrid(Var1_range,Var2_range);
XGrid = [xx1(:) xx2(:)];
 
predictions_meshgrid = predict(cross_validated_model.Trained{1},XGrid);
 
gscatter(xx1(:), xx2(:), predictions_meshgrid,'rgb');
 
hold on
 
training_data = data(training(cv),:);
Y1 = ismember(training_data.class_labels,labels(1));
Y2 = ismember(training_data.class_labels,labels(2));
Y3 = ismember(training_data.class_labels,labels(3));
 
 
scatter(training_data.Var1(Y1),training_data.Var2(Y1), 'o' , 'MarkerEdgeColor', 'black', 'MarkerFaceColor', 'red');
scatter(training_data.Var1(Y2),training_data.Var2(Y2) , 'o' , 'MarkerEdgeColor', 'black', 'MarkerFaceColor', 'green');
scatter(training_data.Var1(Y3),training_data.Var2(Y3) , 'o' , 'MarkerEdgeColor', 'black', 'MarkerFaceColor', 'blue');

 
 
xlabel('Var 1');
ylabel('Var 2');
 
title(classifier_name);
legend off, axis tight
legend({'1', '2', '3'},'Location',[0.45,0.01,0.45,0.05],'Orientation','Horizontal','FontSize',14);
 
 
 
%% -------------- Visualizing testing set results ----------------
% ---------------------------- Code ---------------------------
 
labels = unique(data.class_labels);
classifier_name = 'K-Nearest Neigbor (Testing Results)';
% please mention your classifier name here

Var1_range = min(data.Var1(training(cv)))-1:0.01:max(data.Var1(training(cv)))+1;
Var2_range = min(data.Var2(training(cv)))-1:0.01:max(data.Var2(training(cv)))+1;

[xx1, xx2] = meshgrid(Var1_range,Var2_range);
XGrid = [xx1(:) xx2(:)];

predictions_meshgrid = predict(cross_validated_model.Trained{1},XGrid);

figure

gscatter(xx1(:), xx2(:), predictions_meshgrid,'rgb');

hold on

testing_data =  data(test(cv),:);
Y1 = ismember(testing_data.class_labels,labels(1));
Y2 = ismember(testing_data.class_labels,labels(2));
Y3 = ismember(testing_data.class_labels,labels(3));
 
scatter(testing_data.Var1(Y1),testing_data.Var2(Y1), 'o' , 'MarkerEdgeColor', 'black', 'MarkerFaceColor', 'red');
scatter(testing_data.Var1(Y2),testing_data.Var2(Y2) , 'o' , 'MarkerEdgeColor', 'black', 'MarkerFaceColor', 'green');
scatter(testing_data.Var1(Y3),testing_data.Var2(Y3) , 'o' , 'MarkerEdgeColor', 'black', 'MarkerFaceColor', 'blue');



xlabel('Var 1');
ylabel('Var 2');

title(classifier_name);
legend off, axis tight

legend({'1', '2', '3'},'Location',[0.45,0.01,0.45,0.05],'Orientation','Horizontal');
 
%________________________________________________________________
%________________________________________________________________
 