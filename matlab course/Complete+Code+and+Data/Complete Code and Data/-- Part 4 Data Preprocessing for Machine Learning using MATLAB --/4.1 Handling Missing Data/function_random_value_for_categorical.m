function new_variable = function_random_value_for_categorical(variable)

I = ismissing(variable); 
num_missing = sum(I);
no_unique_values = length(unique(variable(~I))); 
unique_values = unique(variable(~I));
x = randperm(no_unique_values,num_missing);
new_variable = variable;

d = 0;
for i=1: length(I)
    if I(i) == 1
        d = d+1;
        
        new_variable(i) = unique_values(x(d));  
    end 
end 
end