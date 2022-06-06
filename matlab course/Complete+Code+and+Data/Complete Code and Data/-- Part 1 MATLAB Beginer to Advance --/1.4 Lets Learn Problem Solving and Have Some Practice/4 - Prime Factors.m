clear all 

N = input('Please enter a number '); 

% Step 1: Find the factors of the number N. 
Factors_of_N = factor(N);

% Step 2: Find the prime numbers from the factors determined in Step 1. 
Unique_factors_of_N = unique(Factors_of_N)); 

% Step 3: Find the unique prime numbers determined in Step 2. 
Unique_factors_of_N(isprime(Unique_Factors_of_N)) 


Clear all 

N = input('Please enter a number '); 

% Step 1: Find the factors of the number N. Step 2: Find the prime numbers from the factors determined in Step 1.
 
Unique_factors_of_N = unique(factor(N)); 

% Step 3: Find the unique prime numbers determined in Step 2. 
Unique_factors_of_N(isprime(Unique_Factors_of_N)) 

