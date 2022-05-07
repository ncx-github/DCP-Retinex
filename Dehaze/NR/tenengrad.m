function score = tenengrad(varargin)
narginchk(1,2);
validateInputImage(varargin{1});
varargin = varargin{1};
varargin = double(rgb2gray(varargin));
[timgheight, timgwidth] = size(varargin);

gx = 1/4 * [-1 0 1;-2 0 2;-1 0 1];
gy = 1/4 * [1 2 1;0 0 0;-1 -2 -1];
gradx = filter2(gx,varargin,'same');
grady = filter2(gy,varargin,'same');
tenengrad = 0;
for i = 1:timgheight
    for j = 1:timgwidth
        tenengrad = tenengrad + sqrt((gradx(i,j)*gradx(i,j) + grady(i,j)*grady(i,j)));
    end
end
tenengrad = tenengrad/(timgheight*timgwidth);
score = tenengrad;

end