function [X] = two2three(X)
X = imread(X);
X(:,:,1) = X;
X(:,:,2) = X;