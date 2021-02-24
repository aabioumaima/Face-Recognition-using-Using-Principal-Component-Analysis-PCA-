image = imread('img.jpg');
image = double(rgb2gray(image));
% image = reshape(image,[],1); % convert matrix to column vector

[coeff, score, sigma] = pca(image);
% reshape(A,1,[]) % convert matrix to row vector
% imshow(image, []);