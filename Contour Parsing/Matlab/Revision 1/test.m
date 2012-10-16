dir = 'path_name';
image_name = 'image_path';
cd(dir);
pic1 = imread(image_name);
pic2 = rgb2gray(pic1);
[Tpic, SMpic] = graythresh(pic2);
pic3 = im2bw(pic2, Tpic);
% Possible Morphology?
% Thin/Skeleton to reduce thickness and dots
% Get Pixel Array
% Output to Labview