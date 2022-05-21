function [Img_yuv,Img_rgb] = read_Image (input_folder, keyWord, type)

% find path
ImgName = [input_folder,type,'_',keyWord,'.*'];
list = dir(ImgName);
ImgPath = [input_folder,list.name];

% Output yuv and rgb images
Img_rgb = im2double(imread(ImgPath));

if size(Img_rgb,3)==3
    Img_yuv = rgb2yuv(Img_rgb);
else
    Img_yuv = rgb2yuv(cat(3,Img_rgb,Img_rgb,Img_rgb));
end

end