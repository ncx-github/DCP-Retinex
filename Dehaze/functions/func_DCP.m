% function for Dark Channel Prior with sky detect
function output = func_DCP(input)
image = input;

omega=0.8; % Omega should be between 0 and 1, bigger omega means stronger haze removal.
r = 64;
eps = 0.01;
s = 4;
patch_size_dc1=16;

[radiance2,transmission2]=dehaze(image,omega,r,eps,s,patch_size_dc1);
% dehazed image and the refined transmission map

output = radiance2;
end
