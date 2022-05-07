% function for Dark Channel Prior without sky detect
function output = func_DCP_noSkyDetect(input)
J = input;

patch_size_dc1 = 16;
str1=strel('square',patch_size_dc1);
Jdark = imerode(min(J,[],3),str1);

[m,n,~] = size(J);
imsize = m*n;
N = floor( m*n./1000 );
JDarkVec = reshape(Jdark,imsize,1);
ImVec = reshape(J,imsize,3);
[~,indices] = sort(JDarkVec);
indices = indices(imsize-N+1:end);
atmsum = zeros(1,3);
for ind = 1:N
    atmsum = atmsum + ImVec(indices(ind),:);
end
Ac = atmsum/N;
w = 0.8;
im = zeros(size(J));
for ind = 1:3
    im(:,:,ind)= J(:,:,ind)./Ac(ind);
end

dark2= imerode(min(im,[],3),str1);
Jt = 1 - w * dark2;
r = 64;
eps = 0.01;
s = 4;
Jt = fastguidedfilter(rgb2gray(J),Jt, r, eps, s);

Iorg = zeros(m,n,3);
for i = 1:1:m
    for j = 1:1:n
        for k = 1:1:3
        Iorg(i,j,k) = (J(i,j,k)-Ac(k)) ./ Jt(i,j) + Ac(k);
        end
    end
end
output = Iorg;
end