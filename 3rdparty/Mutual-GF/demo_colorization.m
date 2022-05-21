clear all;close all;clc
addpath(genpath('./'))


for pic = [1:14]

if pic==1   % Saliency
    keyWord = 'sail'
elseif pic==2
    keyWord = 'lion'
elseif pic==3
    keyWord = 'leopard'
elseif pic==4
    keyWord = 'himeji'
elseif pic==5   % No Saliency
    keyWord = 'grass'
elseif pic==6
    keyWord = 'castle'
elseif pic==7
    keyWord = 'mt'
elseif pic==8
    keyWord = 'mt2'
elseif pic==9
    keyWord = 'mt3'
elseif pic==10
    keyWord = 'mt4'
elseif pic==11
    keyWord = 'woman'
elseif pic==12
    keyWord = 'lake'
elseif pic==13
    keyWord = 'neuschwanstein' 
elseif pic==14
    keyWord = 'lighthouse'
end

fName = ['./testdata/',keyWord,'.mat'];
load(fName);

fu = init(:,:,2);
fv = init(:,:,3);
g = init(:,:,1); 

% figure;imshow(fu,[]);
% figure;imshow(g,[]);

%% Do the job -- dynamic/dynamic
alpha_t = 0.005; % can be tuned
alpha_r = 0.001; % can be tuned
N_iter =10;
mode = 0; 
epsr = 0.001;
epst = 0.01;
for alpha_t = [0.005]
for alpha_r = [0.001]
    for epsr = [0.001]
    for epst=[0.01]
% for epst = [0.01]
% [S,Q] = muGIF(T,R,alpha_t,alpha_r,maxiter,mode) T:target, R:reference  
tic
[T1,R1] = muGIF(fu,g,alpha_t,alpha_r,N_iter,mode,epsr,epst)  ;
toc
% figure;imshow(T1,[]);
% figure;imshow(R)

result_name = ['./results/',keyWord,'_U' '_t=' num2str(alpha_t) '_r=' num2str(alpha_r) '_er=' num2str(epsr) '_et=' num2str(epst) '.png'];
imwrite(reshape(normalize(T1(:)),size(T1)),result_name);


%% V channel
% alpha_t = 0.005; % can be tuned
% alpha_r = 0.001; % can be tuned
% N_iter =10;
% mode = 0; 
% epsr = 0.01;
% epst = 0.01;

% [S,Q] = muGIF(T,R,alpha_t,alpha_r,maxiter,mode) T:target, R:reference  
tic
[T2,R2] = muGIF(fv,g,alpha_t,alpha_r,N_iter,mode,epsr,epst)  ;
toc
% figure;imshow(T2,[]);
% figure;imshow(R)

result_name = ['./results/',keyWord,'_V' '_t=' num2str(alpha_t) '_r=' num2str(alpha_r) '_er=' num2str(epsr) '_et=' num2str(epst) '.png'];
imwrite(reshape(normalize(T2(:)),size(T2)),result_name);


result_name = ['./results/',keyWord, '_t=' num2str(alpha_t) '_r=' num2str(alpha_r) '_er=' num2str(epsr) '_et=' num2str(epst) '.png'];
output = cat(3,g,T1,T2);
imwrite(yuv2rgb(output),result_name);
% figure;imshow(yuv2rgb(output));

    end
end
end
end

end