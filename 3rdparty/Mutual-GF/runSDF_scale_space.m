clc;
clear all;

for pic = [1]

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

%fName = ['./testdata/',keyWord,'_afterpd.mat'];
fName = ['./testdata/',keyWord,'.mat'];
load(fName);

addpath 'algorithms'
addpath 'graphAnalysisToolbox-1.0'

%img_name = 'ss_01.png';
%img_dir = './imgs/scale-space/'
%f = im2double(imread(fullfile(img_dir, img_name))); %input image

% f = init(:,:,1);

f = init(:,:,2);
f2 = init(:,:,3);
[m,n,c] = size(f);

%scale-space filtering using joint static and dynamic guidance 
nei= 1;                   % 0: 4-neighbor 1: 8-neighbor
lambda = [500];   % regularization parameter
mu = 300;                  % bw for static guidance
nu = 500;                 % bw for dymadic guidance 500
step = 10;                % num of steps
issparse = false;

g=init(:,:,1);           %static guidance image 
u0=ones(m,n,c); %dynamic guidance image (constant initialization, u0 = 1)

disp('===========================================');
disp('joint static and dynamic guidance filtering');
disp('===========================================');
disp('*configuration for scale-space filtering*');
%St = sprintf(' img: %s \n u^0: costant \n mu: %d \n nu: %d \n isSparse: %d', img_name, mu, nu, issparse);
%disp(St);fprintf('\n');

%folder_name = './results/scale-space/';
folder_name = './results/colorization/all_data/';

if ~exist(folder_name, 'dir')
    mkdir(folder_name);
end

for l=1:numel(lambda) 
for mu = [500]   
    %% joint static and dynamic guidance filtering 
    tic;
    u = sdfilter(g,u0,f,nei,lambda(l),mu,nu,step,issparse);
    u2 = sdfilter(g,u0,f2,nei,lambda(l),mu,nu,step,issparse);
    toc;
    fprintf('\n');
    
    result_name = [keyWord,'_output_U_sd_' num2str(lambda(l)) '_mu=' num2str(mu) '_nu=' num2str(nu) '_it=' num2str(step) '.png'];
    %imwrite(reshape(normalize(u(:)),size(u)),fullfile(folder_name,result_name));
    result_name = [keyWord,'_output_V_sd_' num2str(lambda(l)) '_mu=' num2str(mu) '_nu=' num2str(nu) '_it=' num2str(step) '.png'];
    %imwrite(reshape(normalize(u2(:)),size(u2)),fullfile(folder_name,result_name));
    output = cat(3,g,u,u2);
    result_name = [keyWord,'_output_sd_' num2str(lambda(l)) '_mu=' num2str(mu) '_nu=' num2str(nu) '_it=' num2str(step) '.png'];
    %imwrite(yuv2rgb(output),fullfile(folder_name,result_name));
end
end
%imwrite(yuv2rgb(init),fullfile(folder_name,[keyWord,'_init.png']));
%imwrite(reshape(normalize(f(:)),size(f)),fullfile(folder_name,[keyWord,'_init_U.png']));
%imwrite(reshape(normalize(f2(:)),size(f2)),fullfile(folder_name,[keyWord,'_init_V.png']));

% %scale-space filtering using static guidance (WLS)
% nei= 1;                   % 0: 4-neighbor 1: 8-neighbor
% lambda = [2000];   % regularization parameter
% mu = 4000;                 % bw for static guidance
% 
% % g=result_yuv(:,:,2);                      %static guidance image 
% 
% disp('===============================');
% disp('static guidance filtering (WLS)');
% disp('===============================');
% %St = sprintf('configuration, img: %s, mu: %d', img_name, mu);
% %disp(St);fprintf('\n');
% 
% for l=1:numel(lambda) 
%     for mu=[2000,4000]
%     
%     %% wls filtering 
%     tic;
%     u = wlsfilter(g,f,nei,lambda(l),mu);
%     u2 = wlsfilter(g,f2,nei,lambda(l),mu);
%     toc;
%     fprintf('\n');
%     
%     %imwrite(u,fullfile(folder_name,result_name)); 
%     result_name = [keyWord,'_wls-output_U_' num2str(lambda(l)) '_mu=' num2str(mu) '.png'];
%     imwrite(reshape(normalize(u(:)),size(u)),fullfile(folder_name,result_name));
%     result_name = [keyWord,'_wls-output_V_' num2str(lambda(l)) '_mu=' num2str(mu) '.png'];
%     imwrite(reshape(normalize(u2(:)),size(u2)),fullfile(folder_name,result_name));
%     output = cat(3,g,u,u2);
%     result_name = [keyWord,'_wls-output_' num2str(lambda(l)) '_mu=' num2str(mu) '.png'];
%     imwrite(yuv2rgb(output),fullfile(folder_name,result_name));
%     end
% end
end


