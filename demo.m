%-----------------------------------------------------------------------------------------
% Example-Based Image Colorization Using Primal-Dual Algorithm and Saliency Screening
%-----------------------------------------------------------------------------------------
addpath('./util')
clc; clear all; close all;

input_folder = './input/';

i=1;
keyWord = num2str(i,'%02d');
max_it = 100;

[tar_yuv, tar_rgb] = read_Image(input_folder, keyWord, 'gray'); %tar_rgb is grayscale
[ref_yuv, ref_rgb] = read_Image (input_folder, keyWord, 'ref');
result = main_colorization(keyWord,tar_yuv,tar_rgb,ref_yuv,ref_rgb,max_it);

imwrite(result,['./output/output_',keyWord,'.png'])
