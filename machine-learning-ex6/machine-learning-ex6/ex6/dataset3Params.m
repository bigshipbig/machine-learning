function [C, sigma] = dataset3Params(X, y, Xval, yval)
%EX6PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = EX6PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

set_values = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];  

n = numel(set_values);

mmax = 100000000000.0

for i = 1:n
    C_tmp = set_values(i);
    for j = 1:n
        sigma_tmp = set_values(j);
        model = svmTrain(X, y, C_tmp, @(x1, x2) gaussianKernel(x1, x2, sigma_tmp));
        predictions = svmPredict(model,Xval);
        predictions_error = mean(double(predictions ~= yval));
        if mmax > predictions_error
            C =C_tmp;
            sigma=sigma_tmp;
            mmax = predictions_error;
        end;
    end;
end;
        
        




% =========================================================================

end
