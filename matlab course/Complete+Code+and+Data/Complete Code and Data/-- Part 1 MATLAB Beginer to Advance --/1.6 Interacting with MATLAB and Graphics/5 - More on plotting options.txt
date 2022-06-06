x = rand(10,1);

y = rand(10,1);

Z = rand(10,1);

plot(x,y); 

figure, plot(x,y);  % for holding a plot so that it is not over written 


subplot(2,2,1), plot(x,y); 
subplot(2,2,2), plot(x,z); 
subplot(2,2,3), plot(y,z); 
subplot(2,2,4), plot(x,x); 


 