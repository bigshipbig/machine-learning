function plotData(X, y)
%PLOTDATA Plots the data points X and y into a new figure 
%   PLOTDATA(x,y) plots the data points with + for the positive examples
%   and o for the negative examples. X is assumed to be a Mx2 matrix.

% Create New Figure
figure; hold on;

% ====================== YOUR CODE HERE ======================
% Instructions: Plot the positive and negative examples on a
%               2D plot, using the option 'k+' for the positive
%               examples and 'ko' for the negative examples.
%

sz1=size(X)
for i = 1:sz1(1),
    if y(i) == 1
        plot(X(i,1),X(i,2),'+r');
    else
        plot(X(i,1),X(i,2),'ob');
    end;
end;



legend('Admitted','Not admitted');


% =========================================================================



hold off;

end
