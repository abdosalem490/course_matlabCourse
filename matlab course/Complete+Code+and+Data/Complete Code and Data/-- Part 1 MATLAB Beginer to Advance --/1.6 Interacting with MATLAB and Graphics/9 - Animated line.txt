h = animatedline; 

x = 1:1000; 
y = sin(x); 

for i=1:length(x)
	addpoints(h,x(i),y(i)); 
	drawnow;
end 
