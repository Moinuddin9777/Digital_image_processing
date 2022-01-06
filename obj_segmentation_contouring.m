clear all; 
close all; 
clc;

A = imread('img.jpg'); 

A = rgb2gray(A);

mask = zeros(size(A));
mask(10:end-10,10:end-10) = 1;

bw = activecontour(A, mask, 500);

figure, subplot(1, 2, 1), imshow(A), title('Original image');
subplot(1, 2, 2), imshow(bw), title('Segmented image');
