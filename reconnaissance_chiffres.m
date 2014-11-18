clear

% Load the image
base = imread('app.tif');

% Seek lines
lines = seeklines(base);

% Seek columns
columns = seekcolumns(base, lines);

% Seek and draw rectangles
rectangles = seekrectangle(base, lines, columns);
%drawrectangle(base, rectangles);

% Save results
save('coordinates.mat', 'rectangles', '-ascii');

% Extract profiles
n = size(rectangles, 1);
vectors = zeros(n, 10);

for i=1:n
    top = rectangles(i, 1) + 1;
    bottom = rectangles(i, 3) - 1;
    left = rectangles(i, 2) + 1;
    right = rectangles(i, 4) - 1;
    vectors(i, 1:10) = extractprofile(base(top:bottom, left:right));
end

% Compute the mean vector (center) for each class
centers = zeros(10, 10);
for i=1:10
    centers(i, 1:10) = mean(vectors(i*20 - 19:i*20, 1:10));
end

save('center.mat', 'centers', '-ascii');

% Lire le fichier "test.tif" et sortir un vecteur pour chaque chiffre
% à classer dans une classe définie préalablement. Pour cela on utilise
% les vecteurs de probabilité, permettant une réutilisation dans la
% combinaison des classifieurs.