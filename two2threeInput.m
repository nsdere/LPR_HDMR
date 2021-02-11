function [X] = two2threeInput(X)
X = double(X);
X(:,:,1) = X;
X(:,:,2) = X;