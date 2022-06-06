%% --------------- Importing the dataset -------------------------
% ---------------------------- Code ---------------------------
data = readtable('D:\Data preprocessing for Machine Learning using MATLAB\Handling Missing Data\Data_4.csv')



%% -------------- Method 3.2: Using Class based Mean ----------------
% ---------------------------- Code -----------------------------
 
% class_1 = categorical(data.Opinion) == 'not liked';
% class_1_mean = mean(data.Age(class_1),'omitnan');
% data.Age(class_1) = fillmissing(data.Age(class_1),'constant',class_1_mean);

%________________________________________________________________
%________________________________________________________________


%% ------------- Method 4.3: Using Mode --------------------------
% ---------------- (Numeric data) ----------------------------
% ---------------------------- Code ---------------------------
%  
% class_1 = categorical(data.Opinion) == 'not liked';
% class_1_mode = mode(data.Age(class_1));
% data.Age(class_1) = fillmissing(data.Age(class_1),'constant',class_1_mode);

% ------------- Method 4.4: Using Mode --------------------------
% ---------------- (Non-numeric data) ----------------------------
% ---------------------------- Code ---------------------------

% class_1 = categorical(data.Opinion) == 'not liked';
% class_1_mode = mode(categorical(data.Location(class_1)));
% data.Location(class_1) = fillmissing(data.Location(class_1),'constant',cellstr(class_1_mode));

%________________________________________________________________
%________________________________________________________________


