
clear all
%% --------------- Importing the dataset -------------------------
% ---------------------------- Code ---------------------------
data = readtable('D:\Data preprocessing for Machine Learning using MATLAB\Dealing with Categorical Data\titanic_train.csv');


%________________________________________________________________
%________________________________________________________________

%%---------------Data Preprocessing -----------------------------
%--------------- Deleting data ----------------------------------
%--------------- 1. Irrelevant to classification ----------------
%--------------- 2. High missing rate ---------------------------


data.passenger_id = [];     % Just Ids and therefore may not be relevant to classification
data.name = [];             % Hard to make correlation between names and target values
data.ticket = [];           % Just ticket no. and therefore may not be relevant to classification
data.body = [];             % around 90% missing
data.boat = [];             % around 60% missing
data.cabin = [];            % around 78 missing
data.home_dest = [];        % around 20% missing (you may consider it)    

%---------------- Deleting data ----------------------------------
complete_data = rmmissing(data);
data = complete_data; 



%% --------------- Categorical Data Handling Methods ------------
%% -------------- Method: Categorical Data (no order)----------
% ------------------- Also Called One Hot Encoding --------------
% ---------------------------- Code -----------------------------

data = function_categorical_data_to_dummy_variables(data,data.sex);
data.sex = [];

data = function_categorical_data_to_dummy_variables(data,data.embarked);
data.embarked = [];


%% --------------- Handling Missing Values ------------------------
% -------------- Method 1: Deleting rows or column --------------
% ---------------------------- Code ---------------------------

% complete_data = rmmissing(data);


%% -------------- Method 2: Using Mean --------------------------
% ---------------------------- Code ---------------------------
 
% M_Age = mean(data.age, 'omitnan');
% U_Age = fillmissing(data.age, 'constant',M_Age);
% data.age = U_Age;


%________________________________________________________________
%________________________________________________________________

%% -------------- Method 3: Using Class based Mean ----------------
% ---------------------------- Code -----------------------------
%  
% class_1 = data.survived == 1; % (changed)
% class_1_mean = mean(data.age(class_1),'omitnan');
% data.age(class_1) = fillmissing(data.age(class_1),'constant',class_1_mean);
% 
% class_2 = data.survived == 0; % (changed)
% class_2_mean = mean(data.age(class_2),'omitnan');
% data.age(class_2) = fillmissing(data.age(class_2),'constant',class_2_mean);


%% -------------- Method 4: Using Mode --------------------------
% ---------------------------- Code ---------------------------

% Freq_age = mode(data.age); 
% Ages = fillmissing(data.age,'constant',Freq_age);
% data.age = Ages;

%% ------------- Method 5: Using Class based Mode ---------------
% ---------------------------- Code ---------------------------
 
% class_1 = data.survived == 1; % (changed)
% class_1_mode = mode(data.age(class_1));
% data.age(class_1) = fillmissing(data.age(class_1),'constant',class_1_mode);
 
% class_2 = data.survived == 0; % (changed)
% class_2_mode = mode(data.age(class_2));
% data.age(class_2) = fillmissing(data.age(class_2),'constant',class_2_mode);


%% -------------- Method 6: Using a Special Value ---------------
% ----------------------------- Code ---------------------------

% constant_value = -1; 
% Age = fillmissing(data.age, 'constant', constant_value);
% data.age = Age;


%% -------------- Method 7: Using Random Value -------------------
% ----------------------------- Code ----------------------------


% Age_max = max(data.age);
% Age_min = min(data.age);
% I = ismissing(data.age); 
% 
% for i=1: length(I)
%     if I(i) == 1
%         data.age(i) =  Age_min+randi(Age_max-Age_min);
%     end 
% end 


%%--------------- Classifying Data  -----------------------------
%% -------------- Building Classifier ---------------------------
% ---------------------------- Code ---------------------------


classification_model = fitcnb(data,'survived');
classifier = 'NB_MC';
%please define your classifier here

%% -------------- Test and Train sets ----------------------------
% ---------------------------- Code ---------------------------

cv = cvpartition(classification_model.NumObservations, 'HoldOut', 0.3);
cross_validated_model = crossval(classification_model,'cvpartition',cv); 




%% -------------- Making Predictions for Test sets ---------------
% ---------------------------- Code ---------------------------

Predictions = predict(cross_validated_model.Trained{1},data(test(cv),1:end-1));



%% -------------- Analyzing the predictions ---------------------
% ---------------------------- Code ---------------------------

Results = confusionmat(cross_validated_model.Y(test(cv)),Predictions);
Evaluation_results = Function_confusionmatStats(cross_validated_model.Y(test(cv)),Predictions);

%% -------------- Saving the results----------------------------
% ---------------------------- Code ---------------------------

fileID = fopen('d:\Comparison_Missing_Results.csv','a');
fprintf(fileID, '%s, %f \n',classifier, mean(Evaluation_results.accuracy(1)));
fclose(fileID);

