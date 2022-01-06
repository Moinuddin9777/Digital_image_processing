function [ image ] = filterify( img, fil, type )

s = size(img);
t = size(s);

if t(2) == 3
    img = im2double(rgb2gray(img));
else
    img = im2double(img);
end

fil = im2double(fil);

if strcmp(type,'conv')
    fil = rot90(fil,2);
end

[image_rows,image_cols] = size(img);
image = zeros(image_rows,image_cols);
[filter_rows,filter_cols] = size(fil);

diff_rows = ceil(filter_rows/2);
diff_cols = ceil(filter_cols/2);

for row = 1:diff_rows
    image(row,:) = img(row,:);
end

for col = 1:diff_cols
    image(:,col) = img(:,col);
end

for row = image_rows-diff_rows:image_rows
    image(row,:) = img(row,:);
end

for col = image_cols-diff_cols:image_cols
    image(:,col) = img(:,col);
end

for row = diff_rows:image_rows-diff_rows+1
    for col = diff_cols:image_cols-diff_cols+1
        sum = 0;
        r = row-1;
        c = col-1;
        for i = 1:filter_rows
            for j = 1:filter_cols
                sum = sum + img(r+i-diff_rows+1,c+j-diff_cols+1)*fil(i,j);
            end
        end
        image(row,col) = sum;
    end
end
end
