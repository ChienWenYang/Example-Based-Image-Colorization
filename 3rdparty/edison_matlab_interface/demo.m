
function demo
I=im2double(imread('butterfly00285.jpg'));

[ISeg ILabel modes regSize grad conf]=edison_wrapper(I,@RGB2Luv,'step',2,'SpatialBandWidth',5,'RangeBandWidth',3,'MinimumRegionArea',100);

return;