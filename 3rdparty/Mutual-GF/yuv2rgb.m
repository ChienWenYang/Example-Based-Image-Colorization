function [outImg] = yuv2rgb(input)


Y = input(:,:,1);
U = input(:,:,2);
V = input(:,:,3);

R = Y + 1.140*V;
G = Y - 0.395*U - 0.581*V;
B = Y + 2.032*U;

R(R>1) = 1;
G(G>1) = 1;
B(B>1) = 1;

R(R<0) = 0;
G(G<0) = 0;
B(B<0) = 0;

outImg = cat(3,R,G,B);


end