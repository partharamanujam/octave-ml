% set-path for octavelib and clear
addpath([pwd() '/../octavelib']);
clear ; close all; clc;

%  Load an image of a 24-bit colors bird & generate the input-features
A = double(imread('bird_small.png'));
A = A / 255; % Divide by 255 so that all values are in the range 0 - 1
imgSize = size(A);
X = reshape(A, imgSize(1) * imgSize(2), 3);

% compress image using 4-bit (16) colors & compte cost
k = 16;
[Centroids, idx] = generateKMeansClusters(X, k, 10);
cost = kMeansCostFunction(Centroids, X, idx);
fprintf('Cost/Distortion of computed clusters: %.3f\n', cost);
fprintf('Program paused. Press enter to continue.\n');
pause;

% regenerate colors & image
NewX = Centroids(idx, :);
NewA = reshape(NewX, imgSize(1), imgSize(2), 3);

% compare both the images
fprintf('Comparing original and compressed images...\n');
subplot(1, 2, 1);
imagesc(A);
title('Original');
subplot(1, 2, 2);
imagesc(NewA);
title('Compressed');