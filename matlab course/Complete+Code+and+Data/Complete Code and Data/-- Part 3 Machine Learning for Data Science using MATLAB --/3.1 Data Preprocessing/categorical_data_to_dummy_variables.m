
 function data = categorical_data_to_dummy_variables(data,variable)

unique_values = unique(variable);
 
for i=1:length(unique_values)
    dummy_variable(:,i) = double(ismember(variable,unique_values{i})) ;
end 


T = table;
[rows, col] = size(dummy_variable);

for i=1:col
    T1 = table(dummy_variable(:,i));
    T1.Properties.VariableNames = unique_values(i);
    T = [T T1];
end 

    data = [T data]; 
 end 