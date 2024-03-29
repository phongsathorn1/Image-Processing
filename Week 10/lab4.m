close all
clear all

f = imread('noisy_fingerprint.tif');
se = strel('square', 3);

fo = imopen(f, se);
foc = imclose(fo, se);

figure(1);
subplot(1, 3, 1); imshow(f);
subplot(1, 3, 2); imshow(fo);
subplot(1, 3, 3); imshow(foc);