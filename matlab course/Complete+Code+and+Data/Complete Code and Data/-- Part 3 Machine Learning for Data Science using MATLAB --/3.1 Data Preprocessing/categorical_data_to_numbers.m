function new_variable = encoding_categorical_data(variable,values_set,numbers) 

[rows,col] = size(variable);


new_variable = zeros(rows,1);
 
for i=1:length(values_set)
    indices = ismember(variable,values_set{i});
    new_variable(indices) = numbers(i);
end 

end 

 