%MATLAB Program for Testing
[filename, pathname] = uigetfile('*.*', 'Select an image : ');
if isequal(filename, 0)
   disp('User selected Cancel');
else
   disp(['User selected ', fullfile(pathname, filename)]);
end
filewithpath = stract(pathname, filename);

% Reading the image
img  = imread(filewithpath);
imgo = img;

% Converting image to gray scale
img  = rgb2gray(img);

% Resizing image
img  = imresize(img, [M, N]);

% Reshaping matrix image to vector
img  = double(reshape(img, [1, M*N]));

% Projecting the image to Pca space
imgpca = (img - m)*Ppca;

% initialize difference array
distarray = zeros(n, 1);
 
% Finding L1 distance
for i = 1:n
    distarray(i) = sum(abs(T(i, :) - imgpca));
end

% Getting best match
[result, index] = min(distarray);
disp(result);

% Getting the corresponding image
resultimg = imgread(sprintf('%d.jpg', index));

% Plotting Images
subplot(imgo);
title('Query Face');
subplot(122)
imshow(resultimg);
title('Recognized Face');