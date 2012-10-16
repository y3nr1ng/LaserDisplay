function coordinate=parsecontour(image_path, image_name)
original = imread(strcat(image_path, '\', image_name));
gray = rgb2gray(original);
[Tpic, SMpic] = graythresh(gray);
threshold = im2bw(gray, Tpic);
contour = edge(threshold, 'prewitt');
[i, j] = ind2sub(size(contour), find(contour==1));
coordinate = [i j];