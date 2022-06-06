%% --------------- Importing the dataset -------------------------
% ---------------------------- Code ---------------------------
data = readtable('D:\Data preprocessing for Machine Learning using MATLAB\Handling Missing Data\Data_3.csv')



%% -------------- Method 3.1: Using Mean --------------------------
% ---------------------------- Code ---------------------------
 
% M_Age = mean(data.Age, 'omitnan');
% U_Age = fillmissing(data.Age, 'constant',M_Age);
% data.Age = U_Age;


%________________________________________________________________
%________________________________________________________________


%% ------------- Method 4.1: Using Mode --------------------------
% ----------------(Non-numeric data) ----------------------------
% ---------------------------- Code ---------------------------

% data.Opinion = categorical(data.Opinion);
% Freq_opinion = mode(data.Opinion);
% 
% Opinion = fillmissing(data.Opinion,'constant',cellstr(Freq_opinion));
% data.Opinion = Opinion; 

% ------------- Method 4.2: Using Mode --------------------------
% ---------------- (Numeric data) ----------------------------
% ---------------------------- Code ---------------------------
% 
% Freq_age = mode(data.Age); 
% Ages = fillmissing(data.Age,'constant',Freq_age);
% data.Age = Ages;

%________________________________________________________________
%________________________________________________________________


