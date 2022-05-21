%   Function accept inputs and find the distance and the idx to the nearest
%   neighbors.
%   Input: 
%   1.  X is the query data, and is of size Dim x M, where Dim is the
%       number of dimensions and M the number of feature vectors. E.g. X is
%       a set of feature vectors.
%   2.  Y is the data, and is of size Dim x N. E.g. Y is a set of
%       codewords. 
%   3.  k is the number of nearest neighbors we desired.
%   Output:
%   1.  D is a k x  M matrix. Each column is for one feature vector of X.
%       The first row holds the nearest SQUARE-Euclidean-distance from its
%       first nearest neighbor.
%       The second row holds the nearest SQUARE-Euclidean-distance from its
%       second nearest neighbor...
%   2.  N is a k x  M matrix. Each column is for one feature vector of X.
%       The first row holds the index in Y (codeword), which is the nearest
%       to it.
%       The second row holds the index in Y (codeword), which is the second
%       nearest to it...


function [D, N] = knn(X, Y, k, dist)
% [distance, index] = knn(query, data, k);
% Written by Mo Chen (mochen@ie.cuhk.edu.hk). Oct. 2010.

% [D, N] = sort(bsxfun(@plus,(-2)*(Y'*X),dot(Y,Y,1)'));
% N = N(1:k,:);
% D = D(1:k,:);

% top(x,k) is a partial sort function which returns top k entries of x 
if dist=='Euclidean'
    [D, N] = top(bsxfun(@plus,(-2)*(Y'*X),dot(Y,Y,1)'), k); % Euclidean distance
    D = bsxfun(@plus,D,dot(X,X,1));
    
elseif dist== 'Manhattan'
    % Manhattan distance
    tree = KDTreeSearcher(Y','Distance','cityblock'); % default = Euclidean
    %tree = KDTreeSearcher(Y');
    [N, D] = knnsearch(tree,X','k',1);
end

return;


% % function [D, N] = knn(X, Y, k)
% % % [distance, index] = knn(query, data, k);
% % % Written by Mo Chen (mochen@ie.cuhk.edu.hk). Oct. 2010.
% % 
% % % [D, N] = sort(bsxfun(@plus,(-2)*(Y'*X),dot(Y,Y,1)'));
% % % N = N(1:k,:);
% % % D = D(1:k,:);
% % 
% % % top(x,k) is a partial sort function which returns top k entries of x 
% % [D, N] = top(bsxfun(@plus,(-2)*(Y'*X),dot(Y,Y,1)'), k);
% % D = bsxfun(@plus,D,dot(X,X,1));
% 
% 
% 
% 
% % NumDim = 40;
% % NumImgPixels = 100000;
% % NumTexton = 256;
% % 
% % Texton = rand(NumTexton,NumDim);
% % ImgTextureResponse = rand(NumImgPixels, NumDim);
% % DistMatrix = zeros(NumImgPixels, NumTexton);
% % 
% % tic;
% % TmpDistMatrix = zeros(NumImgPixels, NumDim);
% % for ii = 1:NumTexton
% %     currTexton = Texton(ii,:);
% %     for jj = 1:NumDim
% %         currTextonVal = currTexton(jj);
% %         currDistVal = (ImgTextureResponse(:,jj) - currTextonVal).^2;
% %         TmpDistMatrix(:,jj) = currDistVal;
% %     end
% %     currDist = sum(abs(TmpDistMatrix),2);
% %     DistMatrix(:,ii) = currDist;
% % end
% % %   Finding the texton with the minimum distance.
% % [MinDist MinIdx] = min(DistMatrix, [], 2);
% % toc;
% % 
% % 
% % query = ImgTextureResponse;     X = query';
% % data = Texton;                  Y = data';
% % k = 1;
% % 
% % tic;
% % [D, N] = top(bsxfun(@plus,(-2)*(Y'*X),dot(Y,Y,1)'), k);
% % D = bsxfun(@plus,D,dot(X,X,1));
% % toc;
% % 
% % disp('e');
% % 
% % 
% % 
% % 
% % 
% % 
