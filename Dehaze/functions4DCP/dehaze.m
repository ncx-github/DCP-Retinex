function [radiance2,transmission2] = dehaze(image,omega,r,eps,s,patch_size_dc1)

%% Dehazing algorithm
[m,n,~]=size(image);

str1=strel('square',patch_size_dc1);
dc1=imerode(min(image,[],3),str1);

atmosphere=compute_airlight(image, dc1);
rep_atmosphere = repmat(reshape(atmosphere, [1, 1, 3]), m, n);
[radiance2, transmission2] = improve_image(image,rep_atmosphere,omega,r,eps,s);
end

