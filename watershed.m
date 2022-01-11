f = imread('Fig1026(a).tif');
imshow(f);
gc = ~f;
D = bwdist(gc);
L = watershed(-D);
w = L == 0;
g2 = f & ~w;
figure,imshow(g2);

f = imread('Fig1027(a).tif');
imshow(f);
h = fspecial('sobel');
fd = tofloat(f);
g = sqrt(imfilter(fd,h,'replicate').^2 + imfilter(fd,h','replicate').^2);
figure,imshow(g);
L = watershed(g);
wr = L == 0;
figure,imshow(wr);
