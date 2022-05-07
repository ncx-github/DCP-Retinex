% function for Multi-Scale Retinex with Color Restore
function output = func_MSRCR(input1,input2) % the hazy image and the output of MSR

image = input1;
MSRimage = input2;
Ir = image(:,:,1); Ig = image(:,:,2); Ib = image(:,:,3);
Rr = MSRimage(:,:,1); Gg = MSRimage(:,:,2); Bb = MSRimage(:,:,3);

[MSRCR_r,MSRCR_g,MSRCR_b] = MSRCR_rgb(Ir,Ig,Ib,Rr,Gg,Bb); % Color Restore

output = cat(3,MSRCR_r,MSRCR_g,MSRCR_b);

end

% function for Color Restore
function [outputR,outputG,outputB] = MSRCR_rgb(Ir,Ig,Ib,Rr,Gg,Bb)
G = 192; % 30 192 other choices for constants
b = -30; % -6 -30
alpha = 125; %125 125
beta = 46; % 1 46

CRr = beta*(log(alpha*Ir+1)-log(Ir+Ig+Ib+1)); 
Rr = G*(CRr.*Rr+b); 
min1 = min(min(Rr)); 
max1 = max(max(Rr)); 
outputR = uint8(255*(Rr-min1)/(max1-min1)); 

CGg = beta*(log(alpha*Ig+1)-log(Ir+Ig+Ib+1)); 
Gg = G*(CGg.*Gg+b); 
min1 = min(min(Gg)); 
max1 = max(max(Gg)); 
outputG = uint8(255*(Gg-min1)/(max1-min1)); 

CBb = beta*(log(alpha*Ib+1)-log(Ir+Ig+Ib+1)); 
Bb = G*(CBb.*Bb+b); 
min1 = min(min(Bb)); 
max1 = max(max(Bb)); 
outputB = uint8(255*(Bb-min1)/(max1-min1)); 
end