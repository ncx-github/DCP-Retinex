function [score1,score2] = smd(varargin)
narginchk(1,2);
validateInputImage(varargin{1});
varargin = varargin{1};
varargin = double(rgb2gray(varargin));
[timgheight, timgwidth] = size(varargin);

smd = 0;
for i = 1:(timgheight-1)
    for j = 2:timgwidth
        smd = smd +  (abs(varargin(i,j) - varargin(i,j-1)) + abs(varargin(i,j)-varargin(i+1,j)));
    end
end
smd = smd/(timgheight*timgwidth);

smd2 = 0;
for i = 1:(timgheight-1)
    for j = 2:timgwidth
        smd2 = smd2 + abs(varargin(i,j) - varargin(i+1,j)) * abs(varargin(i,j)-varargin(i,j-1));
    end
end
smd2 = smd2/(timgheight*timgwidth);

score1 = smd;
score2 = smd2;

end