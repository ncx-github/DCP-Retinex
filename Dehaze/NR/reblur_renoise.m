function [reblur,renoise] = reblur_renoise(varargin)
narginchk(1,2);
validateInputImage(varargin{1});
varargin = varargin{1};
varargin = double(rgb2gray(varargin));

reblured = gradient(imfilter(varargin, (fspecial('motion',35,48))));
reblur = mean2(varargin - reblured);

renoised = gradient(imnoise(varargin,'gaussian',0, 0.01));
renoise = mean2(varargin - renoised);

end