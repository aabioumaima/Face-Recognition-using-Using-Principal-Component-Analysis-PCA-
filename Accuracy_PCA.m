%MATLAB Program for calculate the Accuracy 
%Number of images we want in each folder (train, test)
load data_PCA.mat
num_images = 200

disp('[1/8] Directories of source images ...');
images = dir('..\Test1\*.png');

number_false = 0;

disp('[2/8] First the male image...');
i = 1;
while i <= num_images
    filename = strcat(num2str(i), '.png');
    filewithpath = strcat(images(i).folder, '\', filename);
    display(filename);
    display(filewithpath);

    original_index = str2double(strsplit(filename, '.'));
    original_index = original_index(1);
    
    if mod(original_index, 5) == 0
        keep_new_index = original_index - 4;
    else
        keep_index = original_index - (mod(original_index, 5) - 1);
    end
    display(i);
    display(original_index);
    display(keep_index);

    disp('[3/8] Reading the image...');
    img  = imread(filewithpath);
    imgo = img;
    
    disp('[4/8] Resizing image...');
    img  = imresize(img, [M, N]);

    disp('[5/8] Reshaping matrix image to vector...');
    img  = double(reshape(img, [1, M*N]));

    disp('[6/8] Projecting the image to Pca space...');
    imgpca = (img - m)*Ppca;

    % initialize difference array
    distarray = zeros(n, 1);
    
    disp('[7/8] Finding L1 distance...');
    for j = 1:n
        distarray(j) = sum(abs(T(j, :) - imgpca));
    end

    disp('[8/8] Getting best match...');
    [result, index] = min(distarray);

    disp('[8/8] Getting the corresponding image and its identifiant index (the first)...');
    if mod(index, 5) == 0
        keep_new_index = index - 4;
    else
        keep_new_index = index - (mod(index, 5) - 1);
    end

    display(index);
    display(keep_new_index);
    
    % testing the truth of the result
    if keep_index ~= keep_new_index
        number_false = number_false + 1;
    end
    
    i = i + 1;

end
display(number_false)

accuarcy = ((num_images - number_false) / num_images) * 100;
display(strcat('Nombre of component chosen L = ', num2str(L)));
display(strcat('Accuarcy = ', num2str(accuarcy), '%'));