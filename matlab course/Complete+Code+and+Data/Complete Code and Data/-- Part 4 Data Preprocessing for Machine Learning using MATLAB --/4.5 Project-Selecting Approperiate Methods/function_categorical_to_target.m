function new_variable = function_categorical_to_target(variable,target_variable,target_value, numeric)

if numeric == 1
    target = target_variable == target_value; 
else 
    target = categorical(target_variable) == target_value;
end 

unique_values = unique(variable);
[rows col] = size(variable); 
new_variable = zeros(rows,1);

for i=1:length(unique_values)
    indexes = categorical(variable) == unique_values(i);
    new_variable(indexes) = sum(target(indexes));
    
end 
end 

