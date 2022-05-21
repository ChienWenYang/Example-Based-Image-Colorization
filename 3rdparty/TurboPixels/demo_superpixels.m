% Runs the superpixel code on the lizard image

addpath('lsmlib');
%img = im2double(imread('lizard.jpg'));
img = im2double(imread('grayinput.png'));
[phi,boundary,disp_img,sup_image] = superpixels(img, 1200);
imagesc(disp_img);
