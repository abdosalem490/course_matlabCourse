month = 1:12; 

percep = [3.4 3.3 4.3 3.7 3.5 3.7 3.4 3.4 3.4 3.9 4.0 3.8];

temp = [16 25 40 58 59 70 77 77 65 56 47 34]; 

yyaxis left

plot(month,percep);  % try with bar(month,percep) also

ylabel('percipitation'); 

xlabel('month'); 

yyaxis right 

plot(month,temp); 

ylabel('temperature'); 
