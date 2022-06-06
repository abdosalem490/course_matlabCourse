% Note: 
% This function assumes that you have taked rid of the missing values

function new_variable = function_categorical_to_frequency(variable)


frequency = tabulate(variable);
[rows col] = size(frequency) ; 
new_variable = zeros(rows,1); 
 

for i=1:rows
    value = frequency{i,2}; 
    index = categorical(variable) == frequency{i,1};
    new_variable(index) = value;
end

end
