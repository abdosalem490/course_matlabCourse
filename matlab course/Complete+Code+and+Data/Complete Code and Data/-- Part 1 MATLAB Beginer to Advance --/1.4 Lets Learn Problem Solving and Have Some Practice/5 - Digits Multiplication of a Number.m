clear all 

%Step 1: Generate the numbers from 1 to million
Numbers=1:1000000; 

%Step 2: Concatenate the numbers to get one big number
string_of_numbers = num2str(Numbers);
string_of_numbers = string_of_numbers(~isspace(string_of_numbers));

%Step 3: Find the number at location
%d1, d10, d100, d1,000, d10,000, d100,000, d1,000,000
d_1 = string_of_numbers(1); 
d_10 = string_of_numbers(10); 
d_100 = string_of_numbers(100); 
d_1000 = string_of_numbers(1000); 
d_10000 = string_of_numbers(10000); 
d_100000 = string_of_numbers(100000); 
d_1000000 = string_of_numbers(1000000); 


 

%Step 4: Compute the d1 × d10 × d100 × d1,000 × d10,000 × d100,000 × d1,000,000
Final_answer = str2num(d_1) *str2num(d_10) *str2num(d_100) * str2num(d_1000) * str2num(d_10000) * str2num(d_100000) * str2num(d_1000000);
fprintf('the final answer of multiplication is %d \n',Final_answer);
