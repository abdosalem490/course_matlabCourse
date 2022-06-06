clear all 

N = input('Please enter a number '); 
Numbers = 1:N;

% Step 1: Find the square of sum of the first N numbers.
square_of_sum = sum(Numbers)^2;


% Step 2: Find the sum of squares of the first N numbers
sum_of_squares = sum(Numbers.^2);

% Step 3: Find the difference of results from step 1 and step 2
Difference = square_of_sum - sum_of_squares

