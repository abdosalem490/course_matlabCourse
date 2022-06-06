function data = class_based_outlier_function(data,outlier, class)

selected_instance = logical(zeros(length(class),1));

d = 0;
    for i =1:length(class)
        
        if class(i) == 1 
            d = d +1;
            if outlier(d) ==1
                selected_instance(i) = 0;
            
            else 
              
                selected_instance(i) = 1;
            end
        else 
            selected_instance(i) = 1;
        end

    
    
    end 
            data = data(selected_instance,:);
            
end 