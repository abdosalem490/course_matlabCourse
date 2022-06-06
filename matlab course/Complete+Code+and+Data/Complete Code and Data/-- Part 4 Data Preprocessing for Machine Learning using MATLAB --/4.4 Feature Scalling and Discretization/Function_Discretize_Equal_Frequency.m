function new_variable = Function_Discretize_Equal_Frequency(variable,method)
method = string(method); 

if (method ~= 'mean' && method ~= 'median')
    disp('Please select the method as mean or medain');
    return; 
end 

[rows col] =  size(variable);
num_bins = round(1 + (3.322* log10(rows)));
no_values_in_bin = round(rows / num_bins) ; 
[values indexes] = sort(variable);

new_variable = variable; 

for i=1:num_bins
    if i*no_values_in_bin > rows
        
        values_set_in_bin = new_variable(indexes( ((i-1) * no_values_in_bin)+1 : rows)); 
        if method == 'mean'
            mean_of_bin = mean(values_set_in_bin);
        else 
            mean_of_bin = median(values_set_in_bin);
        end            
        new_variable(indexes( ((i-1) * no_values_in_bin)+1 : rows)) = mean_of_bin; 
        
    else
    
        values_set_in_bin = new_variable(indexes( ((i-1) * no_values_in_bin)+1 : i*no_values_in_bin));
        if method == 'mean'
            mean_of_bin = mean(values_set_in_bin);
        else 
            mean_of_bin = median(values_set_in_bin);
        end            
        
        new_variable(indexes( ((i-1) * no_values_in_bin)+1 :  i*no_values_in_bin)) = mean_of_bin; 
        
    end
end 
