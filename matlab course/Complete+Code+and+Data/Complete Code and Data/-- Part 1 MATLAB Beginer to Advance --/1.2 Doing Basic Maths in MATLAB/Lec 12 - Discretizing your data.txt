%------------- Script 1 --------------------
data = [1 1 2 3 6 5 8 10 4 4 ]; 
edges = 2:2:10;
edges = [1 3 4 7 10 11]; 

Y1 = discretize(data,edges)
Y2 = discretize(data,edges,'Included', 'right')

% for the Y1 
% bin 1: 2 - 3.99 
% bin 2: 4 - 5.99
% bin 3: 6 - 7.99 
% bin 4: 8 - 10

% for the Y2 
% bin 1: 2 - 4
% bin 2: 4.01 - 6
% bin 3: 6.01 - 8 
% bin 4: 8.01 - 10

%------------- Script 2 --------------------

data = [1 1 2 3 6 5 8 10 4 4 ]; 
edges = [1 3 4 7 10 11]; 

Y1 = discretize(data,edges)
Y2 = discretize(data,edges,'Included', 'right')

% for the Y1 
% bin 1: 1 - 2.99
% bin 2: 3 - 3.99
% bin 3: 4 - 6.99 
% bin 4: 7 - 9.99
% bin 5: 10 - 11

% for the Y2 
% bin 1: 1	- 3
% bin 2: 3.01 	- 4
% bin 3: 4.01 	- 7 
% bin 4: 7.01 	- 10
% bin 5: 10.01 	- 11

%------------- Script 3 --------------------

data = [1 1 2 3 6 5 8 10 4 4 ]; 

[Y, E] = discretize(data,3)

% for the Y 
% bin 1: 1 	- 4
% bin 2: 4.01 	- 8
% bin 3: 8.01 	- 12 

%------------- Script 4 --------------------

data = [1 1 2 3 6 5 8 10 4 4 ]; 

[Y, E] = discretize(data,3,'IncludedEdge','right');

% for the Y 
% bin 1: 1 	- 4
% bin 2: 4 	- 7.99
% bin 3: 8 	- 12 
