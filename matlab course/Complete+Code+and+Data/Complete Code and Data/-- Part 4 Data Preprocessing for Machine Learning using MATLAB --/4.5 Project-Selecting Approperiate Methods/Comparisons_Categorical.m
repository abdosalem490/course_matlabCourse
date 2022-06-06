
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
data.home_dest = [];        % around 45% missing (you may consider it)    

%%--------------- Missing Values---------------------------------
% --------------- Method: Using Mean ----------------------------
% ---------------------------- Code -----------------------------
 
M_Age = mean(data.age, 'omitnan');
U_Age = fillmissing(data.age, 'constant',M_Age);
data.age = U_Age;


%---------------- Deleting data ----------------------------------
complete_data = rmmissing(data);
data = complete_data; 


%% --------------- Categorical Data Handling Methods ------------
%% -------------- Method 1: Categorical Data (no order)----------
% ------------------- Also Called One Hot Encoding --------------
% ---------------------------- Code -----------------------------

% data = function_categorical_data_to_dummy_variables(data,data.sex);
% data.sex = [];
% 
% data = function_categorical_data_to_dummy_variables(data,data.embarked);
% data.embarked = [];


%% -------------- Method 2: Categorical data (no order)----------
% ---------------------- Frequency encoding ---------------------
% ---------------------------- Code -----------------------------

% new_variable = function_categorical_to_frequency(data.embarked);
% data.embarked = new_variable; 
% 
% new_variable = function_categorical_to_frequency(data.sex);
% data.sex = new_variable; 
% 


%% -------------- Method 3: Categorical data (no order)----------
% --------------- Ordering labels according to target -----------
% ---------------------------- Code -----------------------------


new_variable = function_categorical_to_target(data.embarked,data.survived,1,1);
data.embarked = new_variable;

new_variable = function_categorical_to_target(data.sex,data.survived,1,1);
data.sex = new_variable;

%%--------------- Classifying Data  -----------------------------
%% -------------- Building Classifier ---------------------------
% ---------------------------- Code ---------------------------


classification_model = fitcnb(data,'survived');
classifier = 'NB_TE';
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

fileID = fopen('d:\Comparisons_Categorical_Results.csv','a');
fprintf(fileID, '%s, %f \n',classifier, mean(Evaluation_results.accuracy(1)));
fclose(fileID);

