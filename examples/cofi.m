%init
initEnv();

%  Load the dataset - adds movieList, Y, R to environment
% movieList is cell array of the 1682 movie-names
load('movieList.mat');
%  Y is 1682x943 ratings matrix, containing ratings (1-5) of 1682 movies from 943 users
%  R is 1682x943 matrix, where R(i,j) = 1 if and only if user j rated movie i
% user #19 has provided ratings for 20 out of 1682 movies
load('movieRatings.mat');
fprintf('Visualizing data...\n');
imagesc(Y);
ylabel('Movies');
xlabel('Users');
fprintf('Program paused. Press enter to continue.\n');
pause;
close;

% initialize my ratings
myRatings = zeros(1682, 1);
myRatings(1) = 4;   % Toy Story (1995)      
myRatings(7) = 3;   % Twelve Monkeys (1995)
myRatings(12) = 5;  % Usual Suspects, The (1995)
myRatings(54) = 4;  % Outbreak (1995)
myRatings(64) = 5;  % Shawshank Redemption, The (1994)
myRatings(66) = 3;  % While You Were Sleeping (1995)
myRatings(69) = 5;  % Forrest Gump (1994)
myRatings(98) = 2;  % Silence of the Lambs, The (1991) 
myRatings(183) = 4; % Alien (1979)
myRatings(226) = 5; % Die Hard 2 (1990)
myRatings(355) = 5; % Sphere (1998)  

% update Y & R
Y = [myRatings Y];
R = [(myRatings != 0) R];

% attributes
lambda = 10;
numFeatures = 10;
[numMovies, numUsers] = size(Y);

% normalize ratings
[YNorm, yMean] = normalizeRatings(Y, R);

% compute X, Theta, and predictions
fprintf('Computing parameters for collaborative filtering...\n');
[X, Theta] = computeCoFiParamsByGradDescFmincg(YNorm, R, numFeatures, lambda);
p = X * Theta';
myPredictions = p(:,1) + yMean;

% ratings & top 10 recommendations
fprintf('\n\nRatings provided:\n');
for i = 1:length(myRatings)
    if myRatings(i) > 0 
        fprintf('%d : %s\n', myRatings(i), movieList{i});
    end
end
[r, ix] = sort(myPredictions, 'descend');
fprintf('\n\nTop 10 recommendations:\n');
for i=1:10
    j = ix(i);
    fprintf('%.1f : %s\n', myPredictions(j), movieList{j});
end