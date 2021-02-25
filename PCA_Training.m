% MATLAB Program for Training
M = 100; N = 90; % Required Imae Dimensions
TRAIN_DIR = 'data/train/';

n = input('Enter No. of Images for trainig : ');
L = input('Enter No. of Dominant Eigen Values to keep : ');

X = zeros(n, (M*N)); % Intialize Dataset matrix [X]
T = zeros(n, L); % Initilize Transformed data set [T] in PCA space

disp('Reading images ...');
for count=1:n
    I = imread(strcat(TRAIN_DIR, int2str(count), '.jpg')); %Reading images
    I = rgb2gray(I);
    I = imresize(I,[M,N]);
    X(count, :) = reshape(I, [1, M*N]); %Rehsaping images as 1D vector
endfor

disp('Calculating mean ...');
Xb = X; %Copy database for further use
m  = mean(X); %Mean of all Images

disp('Substracting mean ...')
for i = 1:n
    X(i,:) = X(i,:) - m; %substracting Mean from each 10 image
endfor

disp('Calculating Covariance Matrix ...');
Q = (X'*X)/(n - 1);   % Covaraince Matrix

disp('Calculating eigne vectors and values');
[Evecm, Evalm] = eig(Q); % Getting eigen values and Eigen vectors of Cov Matrix

disp('Sorting the values and the vectors ...');
[Evalsorted, Index] = sort(Eval, 'descen'); % Sorting eigen values
Evecsorted = Evecm(:, Index);

disp('Getting the PCA Matrix by selecting the first %d Vecors ...', L);
Ppca = Evecsorted(:, 1:L); % Reduced trsnformation matrix [Ppca]

disp('Projecting the images into the PCA space (X-m)*RCA ...');
for i = 1:n
    T(i, :) = (Xb(i, :) - m)*Ppca; % Projecting each image to PCA space
end