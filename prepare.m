% Number of images we want in each folder (train, test)
num_images = 300

% directories of source images
male_images   = dir('faces94\male\*\*.jpg');
female_images = dir('faces94\female\*\*.jpg');

% Counter for naming the images counter.jpg
counter = 1;

% First the male images
for ii = 1:num_images

  % We know that each person has 20 images 
  % so we use modulo2 to take 10 for the trainning set and 10 for the testing set 
  if mod(ii, 2) == 0
    imwrite(imread(strcat(male_images(ii).folder, '\', male_images(ii).name)), strcat('data\train\', int2str(counter), '.jpg'));
    counter = counter + 1;
  endif
  if mod(ii, 2) != 0
    imwrite(imread(strcat(male_images(ii).folder, '\', male_images(ii).name)), strcat('data\test\', int2str(counter), '.jpg'));
  endif
endfor

% Do the same for the female images
for ii = 1:num_images
  
  % We know that each person has 20 images 
  % so we use modulo2 to take 10 for the trainning set and 10 for the testing set
  if mod(ii, 2) == 0
    % ii is even we store this image in the train folder
    imwrite(imread(strcat(female_images(ii).folder, '\', female_images(ii).name)), strcat('data\train\', int2str(counter), '.jpg'));
    counter = counter + 1;
  endif
  if mod(ii, 2) != 0
    % ii is odd we store this image in the test folder
    imwrite(imread(strcat(female_images(ii).folder, '\', female_images(ii).name)), strcat('data\test\', int2str(counter), '.jpg'));
  endif
endfor