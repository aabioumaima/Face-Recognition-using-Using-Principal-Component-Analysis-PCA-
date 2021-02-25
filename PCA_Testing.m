%MATLAB Program for Testing
[filename, pathname] = uigetfile('*.*', 'Select the input Image');
filewithpath = stract(pathname, filename);
img  = imread(filewithpath);
imgo = img;
img  = rgb2gray(img);
img  = imresize(img, [M, N]);
img  = double(reshape(img, [1, M*N]));
imgpca = (img - m)*Ppca; %Projecting query image to Pca space
distarray = zeros(n, 1); %initialize difference array
for i = 1:n
    distarray(i) = sum(abs(T(i, :) - imgpca)); %Finding L1 distance
end
[result, index] = min(distarray); %Getting best match
resultimg = imgread(sprintf('%d.jpg', index)); %Getting best matched
%Plotting Images
subplot(imgo);
title('Query Face');
subplot(122)
imshow(resultimg);
title('Recognized Face');